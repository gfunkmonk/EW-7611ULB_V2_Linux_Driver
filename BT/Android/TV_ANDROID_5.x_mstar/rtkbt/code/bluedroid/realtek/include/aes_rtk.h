#ifndef _AES_H
#define _AES_H

#include "data_types.h"
#define USE_AES 0
typedef struct
{
    uint32_t erk[64];     /* encryption round keys */
    uint32_t drk[64];     /* decryption round keys */
    int nr;             /* number of rounds */
}
aes_context;

int  aes_set_key_RTK( aes_context *ctx, uint8_t *key, int nbits );
void aes_encrypt_RTK( aes_context *ctx, uint8_t input[16], uint8_t output[16] );
void aes_decrypt_RTK( aes_context *ctx, uint8_t input[16], uint8_t output[16] );

#endif /* aes.h */
