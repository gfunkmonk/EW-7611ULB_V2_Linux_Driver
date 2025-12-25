/******************************************************************************
 *
 *  Copyright (C) 2008-2012 Broadcom Corporation
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at:
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 ******************************************************************************/

/******************************************************************************
 *
 *  This file contains the implementation of the SMP utility functions used
 *  by SMP.
 *
 ******************************************************************************/

#include "bt_target.h"
#include "bt_utils.h"

#if SMP_INCLUDED == TRUE
    #if SMP_DEBUG == TRUE
        #include <stdio.h>
    #endif
    #include <string.h>

    #include "btm_ble_api.h"
    #include "smp_int.h"
    #include "btm_int.h"
    #include "btm_ble_int.h"
    #include "hcimsgs.h"
    #include "aes.h"
    #ifndef SMP_MAX_ENC_REPEAT
        #define SMP_MAX_ENC_REPEAT      3
    #endif

#ifdef BLUETOOTH_RTK_SC
#include "ecc.h"
#include "crypto.h"
#endif

static void smp_rand_back(tBTM_RAND_ENC *p);
static void smp_genenrate_confirm(tSMP_CB *p_cb, tSMP_INT_DATA *p_data);
static void smp_genenrate_ltk_cont(tSMP_CB *p_cb, tSMP_INT_DATA *p_data);
static void smp_generate_y(tSMP_CB *p_cb, tSMP_INT_DATA *p);
static void smp_generate_rand_vector (tSMP_CB *p_cb, tSMP_INT_DATA *p);
static void smp_process_stk(tSMP_CB *p_cb, tSMP_ENC *p);
static void smp_calculate_comfirm_cont(tSMP_CB *p_cb, tSMP_ENC *p);
static void smp_process_confirm(tSMP_CB *p_cb, tSMP_ENC *p);
static void smp_process_compare(tSMP_CB *p_cb, tSMP_ENC *p);
static void smp_process_ediv(tSMP_CB *p_cb, tSMP_ENC *p);

static const tSMP_ACT smp_encrypt_action[] =
{
    smp_generate_compare,           /* SMP_GEN_COMPARE */
    smp_genenrate_confirm,          /* SMP_GEN_CONFIRM*/
    smp_generate_stk,               /* SMP_GEN_STK*/
    smp_genenrate_ltk_cont,          /* SMP_GEN_LTK */
    smp_generate_ltk,               /* SMP_GEN_DIV_LTK */
    smp_generate_rand_vector,        /* SMP_GEN_RAND_V */
    smp_generate_y,                  /* SMP_GEN_EDIV */
    smp_generate_passkey,           /* SMP_GEN_TK */
    smp_generate_confirm,           /* SMP_GEN_SRAND_MRAND */
    smp_genenrate_rand_cont         /* SMP_GEN_SRAND_MRAND_CONT */
};


    #define SMP_PASSKEY_MASK    0xfff00000

    #if SMP_DEBUG == TRUE
static void smp_debug_print_nbyte_little_endian (UINT8 *p, const UINT8 *key_name, UINT8 len)
{
    int     i, x = 0;
#ifdef BLUETOOTH_RTK_SC
    UINT8   p_buf[300];
    memset(p_buf, 0, 300);
#else
    UINT8   p_buf[100];
    memset(p_buf, 0, 100);
#endif

    for (i = 0; i < len; i ++)
    {
        x += sprintf ((char *)&p_buf[x], "%02x ", p[i]);
    }
    SMP_TRACE_WARNING("%s(LSB ~ MSB) = %s", key_name, p_buf);
}
    #else
        #define smp_debug_print_nbyte_little_endian(p, key_name, len)
    #endif

#ifdef BLUETOOTH_RTK_SC
BOOLEAN smp_generate_pulic_key(BT_OCTET64 local_pk, BT_OCTET64 local_sk)
{
    SMP_TRACE_DEBUG ("smp_generate_pulic_key  ");
    if(!ecc_make_key((UINT8 *)local_pk, (UINT8 *)local_sk))
        return FALSE;
    smp_debug_print_nbyte_little_endian((UINT8 *)local_pk, (const UINT8 *)"LOCAL_PUB", 64);
    smp_debug_print_nbyte_little_endian((UINT8 *)local_sk, (const UINT8 *)"PRIVATE", 32);
    return TRUE;
}

static void smp_sc_calculate_passkey_comfirm(tSMP_CB *p_cb)
{
    SMP_TRACE_DEBUG ("smp_sc_calculate_passkey_comfirm");
    tSMP_KEY    key;
    tSMP_STATUS     status = SMP_PAIR_FAIL_UNKNOWN;
    UINT8 pka[32] = {0};
    UINT8 pkb[32] = {0};
    UINT8 output[16] = {0};
    UINT8 rai = 0;
    UINT32 tk = 0;

    memcpy(pka, p_cb->local_pk, 32);
    memcpy(pkb, p_cb->peer_pk, 32);

    memcpy(&tk, p_cb->tk, 4);
    rai = ((tk >> p_cb->cfm_proc_times) & 0x01) | 0x80;
    SMP_TRACE_DEBUG ("rai = %d, p_cb->cfm_proc_times = %d", rai, p_cb->cfm_proc_times);
    smp_debug_print_nbyte_little_endian((UINT8 *)pka, (const UINT8 *)"LOCAL_PK", 32);
    smp_debug_print_nbyte_little_endian((UINT8 *)pkb, (const UINT8 *)"PEER_PK", 32);
    switch (p_cb->rand_enc_proc)
    {
        case SMP_GEN_CONFIRM:
            smp_debug_print_nbyte_little_endian((UINT8 *)p_cb->rand, (const UINT8 *)"LOCAL_RANDOM", 16);
            bt_crypto_f4(pka,pkb,p_cb->rand,rai, p_cb->confirm);
            key.key_type = SMP_KEY_TYPE_CFM;
            key.p_data = p_cb->confirm;
            smp_debug_print_nbyte_little_endian((UINT8 *)p_cb->confirm, (const UINT8 *)"LOCAL_CONFIRM_CALC", 16);
            break;
        case SMP_GEN_COMPARE:
            smp_debug_print_nbyte_little_endian((UINT8 *)p_cb->rrand, (const UINT8 *)"PEER_RANDOM", 16);
            bt_crypto_f4(pkb,pka,p_cb->rrand,rai, output);
            key.key_type = SMP_KEY_TYPE_CMP;
            key.p_data = output;
            smp_debug_print_nbyte_little_endian((UINT8 *)p_cb->rconfirm, (const UINT8 *)"PEER_CONFIRM", 16);
            smp_debug_print_nbyte_little_endian((UINT8 *)output, (const UINT8 *)"PEER_CONFIRM_CALC", 16);
            break;
    }

    smp_sm_event(p_cb, SMP_KEY_READY_EVT, &key);
}

static BOOLEAN smp_sc_calculate_comfirm(tSMP_CB *p_cb)
{
    SMP_TRACE_DEBUG ("smp_sc_calculate_comfirm");
    tSMP_STATUS     status = SMP_PAIR_FAIL_UNKNOWN;
    UINT8 output[16] = {0};
    UINT8 pka[32] = {0};
    UINT8 pkb[32] = {0};

    if(p_cb->role == HCI_ROLE_SLAVE) {
        memcpy(pka, p_cb->peer_pk, 32);
        memcpy(pkb, p_cb->local_pk, 32);
    }
    else {
        memcpy(pka, p_cb->local_pk, 32);
        memcpy(pkb, p_cb->peer_pk, 32);
    }

    smp_debug_print_nbyte_little_endian((UINT8 *)pka, (const UINT8 *)"LOCAL_PK", 32);
    smp_debug_print_nbyte_little_endian((UINT8 *)pkb, (const UINT8 *)"PEER_PK", 32);
    if(p_cb->role == HCI_ROLE_MASTER) {
        smp_debug_print_nbyte_little_endian((UINT8 *)p_cb->rrand, (const UINT8 *)"PEER_RANDOM", 16);
        bt_crypto_f4(pkb,pka,p_cb->rrand,0, output);
        smp_debug_print_nbyte_little_endian((UINT8 *)p_cb->rconfirm, (const UINT8 *)"PEER_CONFIRM", 16);
        smp_debug_print_nbyte_little_endian((UINT8 *)output, (const UINT8 *)"PEER_CONFIRM_CALC", 16);
        if(!memcmp(p_cb->rconfirm, output, 16)) {
            /* master device always use received i/r key as keys to distribute */
            p_cb->loc_i_key = p_cb->peer_i_key;
            p_cb->loc_r_key = p_cb->peer_r_key;
            return TRUE;
        }
    }
    else {
        smp_debug_print_nbyte_little_endian((UINT8 *)p_cb->rand, (const UINT8 *)"LOCAL_RANDOM", 16);
        bt_crypto_f4(pkb,pka,p_cb->rand,0, p_cb->confirm);
        smp_debug_print_nbyte_little_endian((UINT8 *)p_cb->rconfirm, (const UINT8 *)"LOCAL_CONFIRM", 16);
        return TRUE;
    }
    SMP_TRACE_ERROR("smp_sc_calculate_comfirm fail");
    smp_sm_event(p_cb, SMP_AUTH_CMPL_EVT, &status);
    return FALSE;
}

void smp_sc_calculate_dhkey(tSMP_CB *p_cb, BT_OCTET32 dhkey)
{
    SMP_TRACE_DEBUG ("smp_sc_calculate_dhkey");

    ecdh_shared_secret(p_cb->peer_pk,p_cb->local_sk,dhkey);
    smp_debug_print_nbyte_little_endian((UINT8 *)dhkey, (const UINT8 *)"local_DHKEY", 32);
}

void smp_generate_num_comp(tSMP_CB *p_cb, UINT32 *value)
{
    SMP_TRACE_DEBUG ("smp_generate_num_comp");
    UINT8 pka[32] = {0};
    UINT8 pkb[32] = {0};
    if(p_cb->role == HCI_ROLE_MASTER) {
        memcpy(pka, p_cb->local_pk, 32);
        memcpy(pkb, p_cb->peer_pk, 32);
        bt_crypto_g2(pka, pkb, p_cb->rand, p_cb->rrand, value);
    }
    else {
        memcpy(pka, p_cb->peer_pk, 32);
        memcpy(pkb, p_cb->local_pk, 32);
        bt_crypto_g2(pka, pkb, p_cb->rrand, p_cb->rand, value);
    }
}

static BOOLEAN smp_generate_mac_ltk(tSMP_CB *p_cb)
{
    SMP_TRACE_DEBUG ("smp_generate_mac_ltk");
    UINT8 i_addr[7];
    UINT8 r_addr[7];

    UINT8 *p_i = i_addr;
    UINT8 *p_r = r_addr;
    BD_ADDR     remote_bda;
    tBLE_ADDR_TYPE  addr_type = 0;

    if (!BTM_ReadRemoteConnectionAddr(p_cb->pairing_bda, remote_bda, &addr_type))
    {
        SMP_TRACE_ERROR("can not generate mac| ltk for unknown device");
        return FALSE;
    }

    BTM_ReadConnectionAddr( p_cb->pairing_bda, p_cb->local_bda, &p_cb->addr_type);

    smp_sc_calculate_dhkey(p_cb, p_cb->dhkey);
    memset(i_addr, 0, 7);
    memset(r_addr, 0, 7);


    if (p_cb->role == HCI_ROLE_MASTER)
    {
        /* LSB raddr */
        BDADDR_TO_STREAM(p_r, remote_bda);
        /* iaddr */
        BDADDR_TO_STREAM(p_i, p_cb->local_bda);
        i_addr[6] = p_cb->addr_type;
        r_addr[6] = addr_type;
        bt_crypto_f5(p_cb->dhkey, p_cb->rand, p_cb->rrand, i_addr, r_addr, p_cb->mackey, p_cb->ltk);
    }
    else
    {
        /* LSB ra */
        BDADDR_TO_STREAM(p_i, p_cb->local_bda);
        /* ia */
        BDADDR_TO_STREAM(p_r, remote_bda);
        r_addr[6] = p_cb->addr_type;
        i_addr[6] = addr_type;
        bt_crypto_f5(p_cb->dhkey, p_cb->rrand, p_cb->rand, r_addr, i_addr, p_cb->mackey, p_cb->ltk);
    }

    smp_debug_print_nbyte_little_endian((UINT8 *)p_cb->mackey, (const UINT8 *)"local_mackey", 16);
    smp_debug_print_nbyte_little_endian((UINT8 *)p_cb->ltk, (const UINT8 *)"local_ltk", 16);
    return TRUE;
}

BOOLEAN smp_generate_dhkey_check(tSMP_CB *p_cb, UINT8 role, BT_OCTET16 rdhk_check_calc)
{
    SMP_TRACE_DEBUG ("smp_generate_dhkey_check, role = %d", p_cb->role);
    UINT8 addr[7];
    UINT8 r_addr[7];
    UINT8 io_cap[3] = {0};

    UINT8 *p = addr;
    UINT8 *p_r = r_addr;
    BD_ADDR     remote_bda;
    tBLE_ADDR_TYPE  addr_type = 0;

    memset(addr, 0, 7);
    memset(r_addr, 0, 7);

    if (!BTM_ReadRemoteConnectionAddr(p_cb->pairing_bda, remote_bda, &addr_type))
    {
        SMP_TRACE_ERROR("can not generate dhkey check for unknown device");
        return FALSE;
    }

    /* LSB raddr */
    BDADDR_TO_STREAM(p_r, remote_bda);
    /* iaddr */
    BDADDR_TO_STREAM(p, p_cb->local_bda);

    addr[6] = p_cb->addr_type;
    r_addr[6] = addr_type;

    if(role == HCI_ROLE_MASTER) {
        if(rdhk_check_calc) {
            io_cap[0] = p_cb->peer_io_caps;
            io_cap[1] = p_cb->peer_oob_flag;
            io_cap[2] = p_cb->peer_auth_req;
            smp_debug_print_nbyte_little_endian(io_cap, (const UINT8 *)"peer_io_cap", 3);
            smp_debug_print_nbyte_little_endian((UINT8 *)p_cb->tk, (const UINT8 *)"local_tk", 16);
            bt_crypto_f6(p_cb->mackey, p_cb->rrand, p_cb->rand, p_cb->tk, io_cap, r_addr, addr, rdhk_check_calc);
            smp_debug_print_nbyte_little_endian((UINT8 *)rdhk_check_calc, (const UINT8 *)"peer_dhk_check", 16);
        }
        else {
            io_cap[0] = p_cb->loc_io_caps;
            io_cap[1] = p_cb->loc_oob_flag;
            io_cap[2] = p_cb->loc_auth_req;
            smp_debug_print_nbyte_little_endian(io_cap, (const UINT8 *)"local_io_cap", 3);
            smp_debug_print_nbyte_little_endian((UINT8 *)p_cb->tk, (const UINT8 *)"local_tk", 16);
            bt_crypto_f6(p_cb->mackey, p_cb->rand, p_cb->rrand, p_cb->tk, io_cap, addr, r_addr, p_cb->dhk_check);
            smp_debug_print_nbyte_little_endian((UINT8 *)p_cb->dhk_check, (const UINT8 *)"local_dhk_check", 16);
       }
    }
    else {
        if(rdhk_check_calc) {
            io_cap[0] = p_cb->peer_io_caps;
            io_cap[1] = p_cb->peer_oob_flag;
            io_cap[2] = p_cb->peer_auth_req;
            smp_debug_print_nbyte_little_endian(io_cap, (const UINT8 *)"peer_io_cap", 3);
            smp_debug_print_nbyte_little_endian((UINT8 *)p_cb->tk, (const UINT8 *)"local_tk", 16);
            smp_debug_print_nbyte_little_endian((UINT8 *)p_cb->mackey, (const UINT8 *)"local_mackey", 16);
            bt_crypto_f6(p_cb->mackey, p_cb->rrand, p_cb->rand, p_cb->tk, io_cap, r_addr, addr, rdhk_check_calc);
            smp_debug_print_nbyte_little_endian(rdhk_check_calc, (const UINT8 *)"peer_dhk_check_calc", 16);
        }
        else {
            io_cap[0] = p_cb->loc_io_caps;
            io_cap[1] = p_cb->loc_oob_flag;
            io_cap[2] = p_cb->loc_auth_req;
            bt_crypto_f6(p_cb->mackey, p_cb->rand, p_cb->rrand, p_cb->tk, io_cap, addr, r_addr, p_cb->dhk_check);
            smp_debug_print_nbyte_little_endian((UINT8 *)p_cb->rdhk_check, (const UINT8 *)"local_dhk_check_calc", 16);
        }
    }
    return TRUE;

}

void smp_generate_test(void)
{
    const UINT8 local_public_key[64] = {
    0xdf,0xd8,0xa3,0xb6,0x8d,0x74,0x43,0x25,0xa9,0xb0,
    0x66,0x20,0xe8,0x5f,0x87,0xf9,0xea,0xab,0x0d,0xcd,
    0x76,0xc5,0x42,0x07,0x35,0x66,0x9e,0xfe,0xcb,0x3e,
    0x40,0x6c,0xe2,0x3d,0x02,0x1a,0x40,0x25,0x75,0xf5,
    0x23,0x74,0x0b,0x17,0xa0,0xe8,0x76,0x32,0xe3,0x96,
    0x64,0xda,0x46,0xad,0x30,0x0a,0x75,0x42,0xed,0xc4,
    0x8b,0x6d,0x66,0x92
};
    const UINT8 peer_public_key[64] = {
    0xe6,0x9d,0x35,0x0e,0x48,0x01,0x03,0xcc,0xdb,0xfd,
    0xf4,0xac,0x11,0x91,0xf4,0xef,0xb9,0xa5,0xf9,0xe9,
    0xa7,0x83,0x2c,0x5e,0x2c,0xbe,0x97,0xf2,0xd2,0x03,
    0xb0,0x20,0x8b,0xd2,0x89,0x15,0xd0,0x8e,0x1c,0x74,
    0x24,0x30,0xed,0x8f,0xc2,0x45,0x63,0x76,0x5c,0x15,
    0x52,0x5a,0xbf,0x9a,0x32,0x63,0x6d,0xeb,0x2a,0x65,
    0x49,0x9c,0x80,0xdc
};

    const UINT8 local_private_key[32] = {
    0x2f,0xe6,0x4e,0x0a,0xcd,0xb2,0x13,0x28,0x09,0x2a,
    0x84,0xd6,0x73,0x25,0x1a,0x95,0xf2,0x49,0x01,0x10,
    0x36,0xf6,0x22,0x04,0xde,0x01,0x5d,0x6f,0x27,0xe7,
    0xe9,0xa7
};

    const UINT8 peer_private_key[32] = {
    0xBD,0x1A,0x3C,0xCD,0xA6,0xB8,0x99,0x58,0x99,0xB7,
    0x40,0xEB,0x7B,0x60,0xFF,0x4A,0x50,0x3F,0x10,0xD2,
    0xE3,0xB3,0xC9,0x74,0x38,0x5F,0xC5,0xA3,0xD4,0xF6,
    0x49,0x3F
};

    UINT8 local_dhkey[32] = {0};
    UINT8 peer_dhkey[32] = {0};
#if 1
    ecdh_shared_secret(peer_public_key,local_private_key,local_dhkey);
    smp_debug_print_nbyte_little_endian((UINT8 *)local_dhkey, (const UINT8 *)"local_DHKEY", 32);
    ecdh_shared_secret(local_public_key,peer_private_key,peer_dhkey);
    smp_debug_print_nbyte_little_endian((UINT8 *)peer_dhkey, (const UINT8 *)"peer_DHKEY", 32);
#endif
}

#endif

/*******************************************************************************
**
** Function         smp_encrypt_data
**
** Description      This function is called to generate passkey.
**
** Returns          void
**
*******************************************************************************/
BOOLEAN smp_encrypt_data (UINT8 *key, UINT8 key_len,
                          UINT8 *plain_text, UINT8 pt_len,
                          tSMP_ENC *p_out)
{
    aes_context     ctx;
    UINT8           *p_start = NULL;
    UINT8           *p = NULL;
    UINT8           *p_rev_data = NULL;    /* input data in big endilan format */
    UINT8           *p_rev_key = NULL;     /* input key in big endilan format */
    UINT8           *p_rev_output = NULL;  /* encrypted output in big endilan format */

    SMP_TRACE_DEBUG ("smp_encrypt_data");
    if ( (p_out == NULL ) || (key_len != SMP_ENCRYT_KEY_SIZE) )
    {
        BTM_TRACE_ERROR ("smp_encrypt_data Failed");
        return(FALSE);
    }

    if ((p_start = (UINT8 *)GKI_getbuf((SMP_ENCRYT_DATA_SIZE*4))) == NULL)
    {
        BTM_TRACE_ERROR ("smp_encrypt_data Failed unable to allocate buffer");
        return(FALSE);
    }

    if (pt_len > SMP_ENCRYT_DATA_SIZE)
        pt_len = SMP_ENCRYT_DATA_SIZE;

    memset(p_start, 0, SMP_ENCRYT_DATA_SIZE * 4);
    p = p_start;
    ARRAY_TO_STREAM (p, plain_text, pt_len); /* byte 0 to byte 15 */
    p_rev_data = p = p_start + SMP_ENCRYT_DATA_SIZE; /* start at byte 16 */
    REVERSE_ARRAY_TO_STREAM (p, p_start, SMP_ENCRYT_DATA_SIZE);  /* byte 16 to byte 31 */
    p_rev_key = p; /* start at byte 32 */
    REVERSE_ARRAY_TO_STREAM (p, key, SMP_ENCRYT_KEY_SIZE); /* byte 32 to byte 47 */

    smp_debug_print_nbyte_little_endian(key, (const UINT8 *)"Key", SMP_ENCRYT_KEY_SIZE);
    smp_debug_print_nbyte_little_endian(p_start, (const UINT8 *)"Plain text", SMP_ENCRYT_DATA_SIZE);
    p_rev_output = p;
    aes_set_key(p_rev_key, SMP_ENCRYT_KEY_SIZE, &ctx);
    aes_encrypt(p_rev_data, p, &ctx);  /* outputs in byte 48 to byte 63 */

    p = p_out->param_buf;
    REVERSE_ARRAY_TO_STREAM (p, p_rev_output, SMP_ENCRYT_DATA_SIZE);
    smp_debug_print_nbyte_little_endian(p_out->param_buf, (const UINT8 *)"Encrypted text", SMP_ENCRYT_KEY_SIZE);

    p_out->param_len = SMP_ENCRYT_KEY_SIZE;
    p_out->status = HCI_SUCCESS;
    p_out->opcode =  HCI_BLE_ENCRYPT;

    GKI_freebuf(p_start);

    return(TRUE);
}


/*******************************************************************************
**
** Function         smp_generate_passkey
**
** Description      This function is called to generate passkey.
**
** Returns          void
**
*******************************************************************************/
void smp_generate_passkey(tSMP_CB *p_cb, tSMP_INT_DATA *p_data)
{
    UNUSED(p_data);

    SMP_TRACE_DEBUG ("smp_generate_passkey");
    p_cb->rand_enc_proc = SMP_GEN_TK;

    /* generate MRand or SRand */
    if (!btsnd_hcic_ble_rand((void *)smp_rand_back))
        smp_rand_back(NULL);
}
/*******************************************************************************
**
** Function         smp_proc_passkey
**
** Description      This function is called to process a passkey.
**
** Returns          void
**
*******************************************************************************/
void smp_proc_passkey(tSMP_CB *p_cb , tBTM_RAND_ENC *p)
{
    UINT8   *tt = p_cb->tk;
    tSMP_KEY    key;
    UINT32  passkey; /* 19655 test number; */
    UINT8 *pp = p->param_buf;

    SMP_TRACE_DEBUG ("smp_proc_passkey ");
    STREAM_TO_UINT32(passkey, pp);
    passkey &= ~SMP_PASSKEY_MASK;

    /* truncate by maximum value */
    while (passkey > BTM_MAX_PASSKEY_VAL)
        passkey >>= 1;
    SMP_TRACE_ERROR("Passkey generated = %d", passkey);

    /* save the TK */
    memset(p_cb->tk, 0, BT_OCTET16_LEN);
    UINT32_TO_STREAM(tt, passkey);

    key.key_type = SMP_KEY_TYPE_TK;
    key.p_data  = p_cb->tk;

    if (p_cb->p_callback)
    {
        (*p_cb->p_callback)(SMP_PASSKEY_NOTIF_EVT, p_cb->pairing_bda, (tSMP_EVT_DATA *)&passkey);
    }
#ifdef BLUETOOTH_RTK_SC
    if(p_cb->sec_con) {
        UINT8   int_evt = 0;
        UINT8   failure = SMP_PAIR_AUTH_FAIL;
        tSMP_INT_DATA   *p_data = NULL;
    /* if it is secure connections, we need to generate public key*/
        if(smp_generate_pulic_key(p_cb->local_pk, p_cb->local_sk)) {
            key.key_type = SMP_KEY_TYPE_PK;
            key.p_data = p_cb->local_pk;
            p_data = (tSMP_INT_DATA *)&key;
            p_cb->cfm_proc_times = 0;
            int_evt = SMP_PK_READY_EVT;
        }
        else {
            failure = SMP_PAIR_AUTH_FAIL;
            p_data = (tSMP_INT_DATA *)&failure;
            int_evt = SMP_AUTH_CMPL_EVT;
        }
        smp_sm_event(p_cb, int_evt, p_data);
        return;
    }
#endif
    smp_sm_event(p_cb, SMP_KEY_READY_EVT, (tSMP_INT_DATA *)&key);
}


/*******************************************************************************
**
** Function         smp_generate_stk
**
** Description      This function is called to generate STK calculated by running
**                  AES with the TK value as key and a concatenation of the random
**                  values.
**
** Returns          void
**
*******************************************************************************/
void smp_generate_stk (tSMP_CB *p_cb, tSMP_INT_DATA *p_data)
{
    BT_OCTET16      ptext;
    UINT8           *p = ptext;
    tSMP_ENC        output;
    tSMP_STATUS     status = SMP_PAIR_FAIL_UNKNOWN;
    UNUSED(p_data);

#ifdef BLUETOOTH_RTK_SC
    BT_OCTET16      temp_dhk = {0};
    SMP_TRACE_DEBUG ("smp_generate_stk  sc_state = %d", p_cb->sc_state);
    if(p_cb->sec_con) {
        if(p_cb->sc_state == SMP_SC_FINISH_STATE) {
            tSMP_KEY    key;
            key.key_type = SMP_KEY_TYPE_STK;
            key.p_data   = p_cb->ltk;
            smp_sm_event(p_cb, SMP_KEY_READY_EVT, &key);
            return;
        }
        SMP_TRACE_DEBUG ("smp generate sc Mackey|LTK ");
        if (!smp_generate_mac_ltk(p_cb))
        {
            SMP_TRACE_ERROR("smp_generate_stk failed");
            smp_sm_event(p_cb, SMP_AUTH_CMPL_EVT, &status);
        }
        else
        {
            p_cb->sc_state = SMP_SC_LTK_MACK_STATE;
            smp_generate_dhkey_check(p_cb,p_cb->role, NULL);
            if(p_cb->role == HCI_ROLE_MASTER) {
                smp_sm_event(p_cb, SMP_DHK_CHECK_EVT, NULL);
            }
            else {
                SMP_TRACE_DEBUG("smp_generate_stk last receive cmd code = %d",p_cb->rcvd_cmd_code);
                if(p_cb->rcvd_cmd_code == SMP_OPCODE_PAIRING_DHK_CHECK && memcmp(p_cb->rdhk_check, temp_dhk, 16)) {
                    p_cb->sc_state = SMP_SC_DHK_CHECK_STATE;
                    smp_comp_dhk_check(p_cb,NULL);
                }
            }
        }
        return;
    }
#endif

    SMP_TRACE_DEBUG ("smp_generate_stk ");

    memset(p, 0, BT_OCTET16_LEN);
    if (p_cb->role == HCI_ROLE_MASTER)
    {
        memcpy(p, p_cb->rand, BT_OCTET8_LEN);
        memcpy(&p[BT_OCTET8_LEN], p_cb->rrand, BT_OCTET8_LEN);
    }
    else
    {
        memcpy(p, p_cb->rrand, BT_OCTET8_LEN);
        memcpy(&p[BT_OCTET8_LEN], p_cb->rand, BT_OCTET8_LEN);
    }

    /* generate STK = Etk(rand|rrand)*/
    if (!SMP_Encrypt( p_cb->tk, BT_OCTET16_LEN, ptext, BT_OCTET16_LEN, &output))
    {
        SMP_TRACE_ERROR("smp_generate_stk failed");
        smp_sm_event(p_cb, SMP_AUTH_CMPL_EVT, &status);
    }
    else
    {
        smp_process_stk(p_cb, &output);
    }

}
/*******************************************************************************
**
** Function         smp_generate_confirm
**
** Description      This function is called to start the second pairing phase by
**                  start generating initializer random number.
**
**
** Returns          void
**
*******************************************************************************/
void smp_generate_confirm (tSMP_CB *p_cb, tSMP_INT_DATA *p_data)
{
    UNUSED(p_data);

    SMP_TRACE_DEBUG ("smp_generate_confirm");
    p_cb->rand_enc_proc = SMP_GEN_SRAND_MRAND;
    /* generate MRand or SRand */
    if (!btsnd_hcic_ble_rand((void *)smp_rand_back))
        smp_rand_back(NULL);
}
/*******************************************************************************
**
** Function         smp_genenrate_rand_cont
**
** Description      This function is called to generate another 64 bits random for
**                  MRand or Srand.
**
** Returns          void
**
*******************************************************************************/
void smp_genenrate_rand_cont(tSMP_CB *p_cb, tSMP_INT_DATA *p_data)
{
    UNUSED(p_data);

    SMP_TRACE_DEBUG ("smp_genenrate_rand_cont ");
    p_cb->rand_enc_proc = SMP_GEN_SRAND_MRAND_CONT;
    /* generate 64 MSB of MRand or SRand */

    if (!btsnd_hcic_ble_rand((void *)smp_rand_back))
        smp_rand_back(NULL);
}
/*******************************************************************************
**
** Function         smp_generate_ltk
**
** Description      This function is called to calculate LTK, starting with DIV
**                  generation.
**
**
** Returns          void
**
*******************************************************************************/
void smp_generate_ltk(tSMP_CB *p_cb, tSMP_INT_DATA *p_data)
{
    BOOLEAN     div_status;
    UNUSED(p_data);

    SMP_TRACE_DEBUG ("smp_generate_ltk ");

    div_status = btm_get_local_div(p_cb->pairing_bda, &p_cb->div);

    if (div_status)
    {
        smp_genenrate_ltk_cont(p_cb, NULL);
    }
    else
    {
        SMP_TRACE_DEBUG ("Generate DIV for LTK");
        p_cb->rand_enc_proc = SMP_GEN_DIV_LTK;
        /* generate MRand or SRand */
        if (!btsnd_hcic_ble_rand((void *)smp_rand_back))
            smp_rand_back(NULL);
    }
}


/*******************************************************************************
**
** Function         smp_compute_csrk
**
** Description      This function is called to calculate CSRK
**
**
** Returns          void
**
*******************************************************************************/
void smp_compute_csrk(tSMP_CB *p_cb, tSMP_INT_DATA *p_data)
{
    BT_OCTET16  er;
    UINT8       buffer[4]; /* for (r || DIV)  r=1*/
    UINT16      r=1;
    UINT8       *p=buffer;
    tSMP_ENC    output;
    tSMP_STATUS   status = SMP_PAIR_FAIL_UNKNOWN;
    UNUSED(p_data);

    SMP_TRACE_DEBUG ("smp_compute_csrk div=%x", p_cb->div);
    BTM_GetDeviceEncRoot(er);
    /* CSRK = d1(ER, DIV, 1) */
    UINT16_TO_STREAM(p, p_cb->div);
    UINT16_TO_STREAM(p, r);

    if (!SMP_Encrypt(er, BT_OCTET16_LEN, buffer, 4, &output))
    {
        SMP_TRACE_ERROR("smp_generate_csrk failed");
        smp_sm_event(p_cb, SMP_AUTH_CMPL_EVT, &status);
    }
    else
    {
        memcpy((void *)p_cb->csrk, output.param_buf, BT_OCTET16_LEN);
        smp_send_csrk_info(p_cb, NULL);
    }
}

/*******************************************************************************
**
** Function         smp_generate_csrk
**
** Description      This function is called to calculate LTK, starting with DIV
**                  generation.
**
**
** Returns          void
**
*******************************************************************************/
void smp_generate_csrk(tSMP_CB *p_cb, tSMP_INT_DATA *p_data)
{
    BOOLEAN     div_status;
    UNUSED(p_data);

    SMP_TRACE_DEBUG ("smp_generate_csrk");

    div_status = btm_get_local_div(p_cb->pairing_bda, &p_cb->div);
    if (div_status)
    {
        smp_compute_csrk(p_cb, NULL);
    }
    else
    {
        SMP_TRACE_DEBUG ("Generate DIV for CSRK");
        p_cb->rand_enc_proc = SMP_GEN_DIV_CSRK;
        if (!btsnd_hcic_ble_rand((void *)smp_rand_back))
            smp_rand_back(NULL);
    }
}


/*******************************************************************************
** Function         smp_concatenate_peer
**                  add pairing command sent from local device into p1.
*******************************************************************************/
void smp_concatenate_local( tSMP_CB *p_cb, UINT8 **p_data, UINT8 op_code)
{
    UINT8   *p = *p_data;

    SMP_TRACE_DEBUG ("smp_concatenate_local ");
    UINT8_TO_STREAM(p, op_code);
    UINT8_TO_STREAM(p, p_cb->loc_io_caps);
    UINT8_TO_STREAM(p, p_cb->loc_oob_flag);
    UINT8_TO_STREAM(p, p_cb->loc_auth_req);
    UINT8_TO_STREAM(p, p_cb->loc_enc_size);
    UINT8_TO_STREAM(p, p_cb->loc_i_key);
    UINT8_TO_STREAM(p, p_cb->loc_r_key);

    *p_data = p;
}
/*******************************************************************************
** Function         smp_concatenate_peer
**                  add pairing command received from peer device into p1.
*******************************************************************************/
void smp_concatenate_peer( tSMP_CB *p_cb, UINT8 **p_data, UINT8 op_code)
{
    UINT8   *p = *p_data;

    SMP_TRACE_DEBUG ("smp_concatenate_peer ");
    UINT8_TO_STREAM(p, op_code);
    UINT8_TO_STREAM(p, p_cb->peer_io_caps);
    UINT8_TO_STREAM(p, p_cb->peer_oob_flag);
    UINT8_TO_STREAM(p, p_cb->peer_auth_req);
    UINT8_TO_STREAM(p, p_cb->peer_enc_size);
    UINT8_TO_STREAM(p, p_cb->peer_i_key);
    UINT8_TO_STREAM(p, p_cb->peer_r_key);

    *p_data = p;
}
/*******************************************************************************
**
** Function         smp_gen_p1_4_confirm
**
** Description      Generate Confirm/Compare Step1:
**                  p1 = pres || preq || rat' || iat'
**
** Returns          void
**
*******************************************************************************/
void smp_gen_p1_4_confirm( tSMP_CB *p_cb, BT_OCTET16 p1)
{
    UINT8 *p = (UINT8 *)p1;
    tBLE_ADDR_TYPE    addr_type = 0;
    BD_ADDR           remote_bda;

    SMP_TRACE_DEBUG ("smp_gen_p1_4_confirm");

    if (!BTM_ReadRemoteConnectionAddr(p_cb->pairing_bda, remote_bda, &addr_type))
    {
        SMP_TRACE_ERROR("can not generate confirm for unknown device");
        return;
    }

    BTM_ReadConnectionAddr( p_cb->pairing_bda, p_cb->local_bda, &p_cb->addr_type);

    if (p_cb->role == HCI_ROLE_MASTER)
    {
        /* LSB : rat': initiator's(local) address type */
        UINT8_TO_STREAM(p, p_cb->addr_type);
        /* LSB : iat': responder's address type */
        UINT8_TO_STREAM(p, addr_type);
        /* concatinate preq */
        smp_concatenate_local(p_cb, &p, SMP_OPCODE_PAIRING_REQ);
        /* concatinate pres */
        smp_concatenate_peer(p_cb, &p, SMP_OPCODE_PAIRING_RSP);
    }
    else
    {
        /* LSB : iat': initiator's address type */
        UINT8_TO_STREAM(p, addr_type);
        /* LSB : rat': responder's(local) address type */
        UINT8_TO_STREAM(p, p_cb->addr_type);
        /* concatinate preq */
        smp_concatenate_peer(p_cb, &p, SMP_OPCODE_PAIRING_REQ);
        /* concatinate pres */
        smp_concatenate_local(p_cb, &p, SMP_OPCODE_PAIRING_RSP);
    }
#if SMP_DEBUG == TRUE
    SMP_TRACE_DEBUG("p1 = pres || preq || rat' || iat'");
    smp_debug_print_nbyte_little_endian ((UINT8 *)p1, (const UINT8 *)"P1", 16);
#endif
}
/*******************************************************************************
**
** Function         smp_gen_p2_4_confirm
**
** Description      Generate Confirm/Compare Step2:
**                  p2 = padding || ia || ra
**
** Returns          void
**
*******************************************************************************/
void smp_gen_p2_4_confirm( tSMP_CB *p_cb, BT_OCTET16 p2)
{
    UINT8       *p = (UINT8 *)p2;
    BD_ADDR     remote_bda;
    tBLE_ADDR_TYPE  addr_type = 0;

    if (!BTM_ReadRemoteConnectionAddr(p_cb->pairing_bda, remote_bda, &addr_type))
    {
        SMP_TRACE_ERROR("can not generate confirm p2 for unknown device");
        return;
    }

    SMP_TRACE_DEBUG ("smp_gen_p2_4_confirm");

    memset(p, 0, sizeof(BT_OCTET16));

    if (p_cb->role == HCI_ROLE_MASTER)
    {
        /* LSB ra */
        BDADDR_TO_STREAM(p, remote_bda);
        /* ia */
        BDADDR_TO_STREAM(p, p_cb->local_bda);
    }
    else
    {
        /* LSB ra */
        BDADDR_TO_STREAM(p, p_cb->local_bda);
        /* ia */
        BDADDR_TO_STREAM(p, remote_bda);
    }
#if SMP_DEBUG == TRUE
    SMP_TRACE_DEBUG("p2 = padding || ia || ra");
    smp_debug_print_nbyte_little_endian(p2, (const UINT8 *)"p2", 16);
#endif
}
/*******************************************************************************
**
** Function         smp_calculate_comfirm
**
** Description      This function is called to calculate Confirm value.
**
** Returns          void
**
*******************************************************************************/
void smp_calculate_comfirm (tSMP_CB *p_cb, BT_OCTET16 rand, BD_ADDR bda)
{
    BT_OCTET16      p1;
    tSMP_ENC       output;
    tSMP_STATUS     status = SMP_PAIR_FAIL_UNKNOWN;
    UNUSED(bda);

    SMP_TRACE_DEBUG ("smp_calculate_comfirm ");
    /* generate p1 = pres || preq || rat' || iat' */
    smp_gen_p1_4_confirm(p_cb, p1);

    /* p1 = rand XOR p1 */
    smp_xor_128(p1, rand);

    smp_debug_print_nbyte_little_endian ((UINT8 *)p1, (const UINT8 *)"P1' = r XOR p1", 16);

    /* calculate e(k, r XOR p1), where k = TK */
    if (!SMP_Encrypt(p_cb->tk, BT_OCTET16_LEN, p1, BT_OCTET16_LEN, &output))
    {
        SMP_TRACE_ERROR("smp_generate_csrk failed");
        smp_sm_event(p_cb, SMP_AUTH_CMPL_EVT, &status);
    }
    else
    {
        smp_calculate_comfirm_cont(p_cb, &output);
    }
}
/*******************************************************************************
**
** Function         smp_calculate_comfirm_cont
**
** Description      This function is called when SConfirm/MConfirm is generated
**                  proceed to send the Confirm request/response to peer device.
**
** Returns          void
**
*******************************************************************************/
static void smp_calculate_comfirm_cont(tSMP_CB *p_cb, tSMP_ENC *p)
{
    BT_OCTET16    p2;
    tSMP_ENC      output;
    tSMP_STATUS     status = SMP_PAIR_FAIL_UNKNOWN;

    SMP_TRACE_DEBUG ("smp_calculate_comfirm_cont ");
#if SMP_DEBUG == TRUE
    SMP_TRACE_DEBUG("Confirm step 1 p1' = e(k, r XOR p1)  Generated");
    smp_debug_print_nbyte_little_endian (p->param_buf, (const UINT8 *)"C1", 16);
#endif

    smp_gen_p2_4_confirm(p_cb, p2);

    /* calculate p2 = (p1' XOR p2) */
    smp_xor_128(p2, p->param_buf);
    smp_debug_print_nbyte_little_endian ((UINT8 *)p2, (const UINT8 *)"p2' = C1 xor p2", 16);

    /* calculate: Confirm = E(k, p1' XOR p2) */
    if (!SMP_Encrypt(p_cb->tk, BT_OCTET16_LEN, p2, BT_OCTET16_LEN, &output))
    {
        SMP_TRACE_ERROR("smp_calculate_comfirm_cont failed");
        smp_sm_event(p_cb, SMP_AUTH_CMPL_EVT, &status);
    }
    else
    {
        switch (p_cb->rand_enc_proc)
        {
            case SMP_GEN_CONFIRM:
                smp_process_confirm(p_cb, &output);
                break;

            case SMP_GEN_COMPARE:
                smp_process_compare(p_cb, &output);
                break;
        }
    }
}
/*******************************************************************************
**
** Function         smp_genenrate_confirm
**
** Description      This function is called when a 48 bits random number is generated
**                  as SRand or MRand, continue to calculate Sconfirm or MConfirm.
**
** Returns          void
**
*******************************************************************************/
static void smp_genenrate_confirm(tSMP_CB *p_cb, tSMP_INT_DATA *p_data)
{
    UNUSED(p_data);

    SMP_TRACE_DEBUG ("smp_genenrate_confirm ");
    p_cb->rand_enc_proc = SMP_GEN_CONFIRM;

    smp_debug_print_nbyte_little_endian ((UINT8 *)p_cb->rand,  (const UINT8 *)"local rand", 16);

#ifdef BLUETOOTH_RTK_SC
    if((p_cb->model == SMP_MODEL_PASSKEY || p_cb->model == SMP_MODEL_KEY_NOTIF)&& p_cb->sec_con) {
        SMP_TRACE_DEBUG ("smp genenrate sc passkey confirm ");
        smp_sc_calculate_passkey_comfirm(p_cb);
        return;
    }
#endif

    smp_calculate_comfirm(p_cb, p_cb->rand, p_cb->pairing_bda);
}
/*******************************************************************************
**
** Function         smp_generate_compare
**
** Description      This function is called to generate SConfirm for Slave device,
**                  or MSlave for Master device. This function can be also used for
**                  generating Compare number for confirm value check.
**
** Returns          void
**
*******************************************************************************/
void smp_generate_compare (tSMP_CB *p_cb, tSMP_INT_DATA *p_data)
{
    UNUSED(p_data);

    SMP_TRACE_DEBUG ("smp_generate_compare ");
    p_cb->rand_enc_proc = SMP_GEN_COMPARE;

    smp_debug_print_nbyte_little_endian ((UINT8 *)p_cb->rrand,  (const UINT8 *)"peer rand", 16);

#ifdef BLUETOOTH_RTK_SC
    if(p_cb->sec_con) {
        if(p_cb->model == SMP_MODEL_ENC_ONLY || p_cb->model == SMP_MODEL_NUM_COMP) {
            if(smp_sc_calculate_comfirm(p_cb)) {
                SMP_TRACE_DEBUG ("smp_generate_compare sc confirm OK!");
                smp_sm_event(p_cb, SMP_USER_CONFIRM_EVT, NULL);
            }
        }
        else {
            smp_sc_calculate_passkey_comfirm(p_cb);
        }
        return;
    }
#endif

    smp_calculate_comfirm(p_cb, p_cb->rrand, p_cb->local_bda);
}
/*******************************************************************************
**
** Function         smp_process_confirm
**
** Description      This function is called when SConfirm/MConfirm is generated
**                  proceed to send the Confirm request/response to peer device.
**
** Returns          void
**
*******************************************************************************/
static void smp_process_confirm(tSMP_CB *p_cb, tSMP_ENC *p)
{
    tSMP_KEY    key;

    SMP_TRACE_DEBUG ("smp_process_confirm ");
#if SMP_CONFORMANCE_TESTING == TRUE
    if (p_cb->enable_test_confirm_val)
    {
        BTM_TRACE_DEBUG ("Use confirm value from script");
        memcpy(p_cb->confirm, p_cb->test_confirm, BT_OCTET16_LEN);
    }
    else
        memcpy(p_cb->confirm, p->param_buf, BT_OCTET16_LEN);
#else
    memcpy(p_cb->confirm, p->param_buf, BT_OCTET16_LEN);
#endif


#if (SMP_DEBUG == TRUE)
    SMP_TRACE_DEBUG("Confirm  Generated");
    smp_debug_print_nbyte_little_endian ((UINT8 *)p_cb->confirm,  (const UINT8 *)"Confirm", 16);
#endif

    key.key_type = SMP_KEY_TYPE_CFM;
    key.p_data = p->param_buf;

    smp_sm_event(p_cb, SMP_KEY_READY_EVT, &key);
}
/*******************************************************************************
**
** Function         smp_process_compare
**
** Description      This function is called when Compare is generated using the
**                  RRand and local BDA, TK information.
**
** Returns          void
**
*******************************************************************************/
static void smp_process_compare(tSMP_CB *p_cb, tSMP_ENC *p)
{
    tSMP_KEY    key;

    SMP_TRACE_DEBUG ("smp_process_compare ");
#if (SMP_DEBUG == TRUE)
    SMP_TRACE_DEBUG("Compare Generated");
    smp_debug_print_nbyte_little_endian (p->param_buf,  (const UINT8 *)"Compare", 16);
#endif
    key.key_type = SMP_KEY_TYPE_CMP;
    key.p_data   = p->param_buf;

    smp_sm_event(p_cb, SMP_KEY_READY_EVT, &key);
}

/*******************************************************************************
**
** Function         smp_process_stk
**
** Description      This function is called when STK is generated
**                  proceed to send the encrypt the link using STK.
**
** Returns          void
**
*******************************************************************************/
static void smp_process_stk(tSMP_CB *p_cb, tSMP_ENC *p)
{
    tSMP_KEY    key;

    SMP_TRACE_DEBUG ("smp_process_stk ");
#if (SMP_DEBUG == TRUE)
    SMP_TRACE_ERROR("STK Generated");
#endif
    smp_mask_enc_key(p_cb->loc_enc_size, p->param_buf);

    key.key_type = SMP_KEY_TYPE_STK;
    key.p_data   = p->param_buf;

    smp_sm_event(p_cb, SMP_KEY_READY_EVT, &key);
}

/*******************************************************************************
**
** Function         smp_genenrate_ltk_cont
**
** Description      This function is to calculate LTK = d1(ER, DIV, 0)= e(ER, DIV)
**
** Returns          void
**
*******************************************************************************/
static void smp_genenrate_ltk_cont(tSMP_CB *p_cb, tSMP_INT_DATA *p_data)
{
    BT_OCTET16  er;
    tSMP_ENC    output;
    tSMP_STATUS     status = SMP_PAIR_FAIL_UNKNOWN;
    UNUSED(p_data);

    SMP_TRACE_DEBUG ("smp_genenrate_ltk_cont ");
    BTM_GetDeviceEncRoot(er);

    /* LTK = d1(ER, DIV, 0)= e(ER, DIV)*/
    if (!SMP_Encrypt(er, BT_OCTET16_LEN, (UINT8 *)&p_cb->div,
                     sizeof(UINT16), &output))
    {
        SMP_TRACE_ERROR("smp_genenrate_ltk_cont failed");
        smp_sm_event(p_cb, SMP_AUTH_CMPL_EVT, &status);
    }
    else
    {
        /* mask the LTK */
        smp_mask_enc_key(p_cb->loc_enc_size, output.param_buf);
        memcpy((void *)p_cb->ltk, output.param_buf, BT_OCTET16_LEN);
        smp_generate_rand_vector(p_cb, NULL);
    }

}

/*******************************************************************************
**
** Function         smp_generate_y
**
** Description      This function is to proceed generate Y = E(DHK, Rand)
**
** Returns          void
**
*******************************************************************************/
static void smp_generate_y(tSMP_CB *p_cb, tSMP_INT_DATA *p)
{
    BT_OCTET16  dhk;
    tSMP_ENC   output;
    tSMP_STATUS     status = SMP_PAIR_FAIL_UNKNOWN;
    UNUSED(p);

    SMP_TRACE_DEBUG ("smp_generate_y ");
    BTM_GetDeviceDHK(dhk);

    if (!SMP_Encrypt(dhk, BT_OCTET16_LEN, p_cb->enc_rand,
                     BT_OCTET8_LEN, &output))
    {
        SMP_TRACE_ERROR("smp_generate_y failed");
        smp_sm_event(p_cb, SMP_AUTH_CMPL_EVT, &status);
    }
    else
    {
        smp_process_ediv(p_cb, &output);
    }
}
/*******************************************************************************
**
** Function         smp_generate_rand_vector
**
** Description      This function is called when LTK is generated, send state machine
**                  event to SMP.
**
** Returns          void
**
*******************************************************************************/
static void smp_generate_rand_vector (tSMP_CB *p_cb, tSMP_INT_DATA *p)
{
    UNUSED(p);

    /* generate EDIV and rand now */
    /* generate random vector */
    SMP_TRACE_DEBUG ("smp_generate_rand_vector ");
    p_cb->rand_enc_proc = SMP_GEN_RAND_V;
    if (!btsnd_hcic_ble_rand((void *)smp_rand_back))
        smp_rand_back(NULL);

}
/*******************************************************************************
**
** Function         smp_genenrate_smp_process_edivltk_cont
**
** Description      This function is to calculate EDIV = Y xor DIV
**
** Returns          void
**
*******************************************************************************/
static void smp_process_ediv(tSMP_CB *p_cb, tSMP_ENC *p)
{
    tSMP_KEY    key;
    UINT8 *pp= p->param_buf;
    UINT16  y;

    SMP_TRACE_DEBUG ("smp_process_ediv ");
    STREAM_TO_UINT16(y, pp);

    /* EDIV = Y xor DIV */
    p_cb->ediv = p_cb->div ^ y;
    /* send LTK ready */
    SMP_TRACE_ERROR("LTK ready");
    key.key_type = SMP_KEY_TYPE_LTK;
    key.p_data   = p->param_buf;

    smp_sm_event(p_cb, SMP_KEY_READY_EVT, &key);
}

/*******************************************************************************
**
** Function         smp_rand_back
**
** Description      This function is to process the rand command finished,
**                  process the random/encrypted number for further action.
**
** Returns          void
**
*******************************************************************************/
static void smp_rand_back(tBTM_RAND_ENC *p)
{
    tSMP_CB *p_cb = &smp_cb;
    UINT8   *pp = p->param_buf;
    UINT8   failure = SMP_PAIR_FAIL_UNKNOWN;
    UINT8   state = p_cb->rand_enc_proc & ~0x80;

    SMP_TRACE_DEBUG ("smp_rand_back state=0x%x", state);
    if (p && p->status == HCI_SUCCESS)
    {
        switch (state)
        {

            case SMP_GEN_SRAND_MRAND:
                memcpy((void *)p_cb->rand, p->param_buf, p->param_len);
                smp_genenrate_rand_cont(p_cb, NULL);
                break;

            case SMP_GEN_SRAND_MRAND_CONT:
                memcpy((void *)&p_cb->rand[8], p->param_buf, p->param_len);
#ifdef BLUETOOTH_RTK_SC
                if(p_cb->role == HCI_ROLE_MASTER && p_cb->sec_con && (p_cb->model == SMP_MODEL_ENC_ONLY ||
                    p_cb->model == SMP_MODEL_NUM_COMP)) {
                    smp_debug_print_nbyte_little_endian ((UINT8 *)p_cb->rand,  (const UINT8 *)"local rand", 16);
                    smp_sm_event(p_cb, SMP_KEY_READY_EVT, NULL);
                    break;
                }
                else if(p_cb->role == HCI_ROLE_SLAVE && p_cb->sec_con && (p_cb->model == SMP_MODEL_ENC_ONLY ||
                    p_cb->model == SMP_MODEL_NUM_COMP)) {
                    smp_sc_calculate_comfirm(p_cb);
                    smp_sm_event(p_cb, SMP_CONFIRM_EVT, NULL);
                    break;
                }
#endif
                smp_genenrate_confirm(p_cb, NULL);
                break;

            case SMP_GEN_DIV_LTK:
                STREAM_TO_UINT16(p_cb->div, pp);
                smp_genenrate_ltk_cont(p_cb, NULL);
                break;

            case SMP_GEN_DIV_CSRK:
                STREAM_TO_UINT16(p_cb->div, pp);
                smp_compute_csrk(p_cb, NULL);
                break;

            case SMP_GEN_TK:
                smp_proc_passkey(p_cb, p);
                break;

            case SMP_GEN_RAND_V:
                memcpy(p_cb->enc_rand, p->param_buf, BT_OCTET8_LEN);
                smp_generate_y(p_cb, NULL);
                break;

        }

        return;
    }

    SMP_TRACE_ERROR("smp_rand_back Key generation failed: (%d)", p_cb->rand_enc_proc);

    smp_sm_event(p_cb, SMP_AUTH_CMPL_EVT, &failure);

}
#endif

