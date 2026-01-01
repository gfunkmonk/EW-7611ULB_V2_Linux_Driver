#ifndef _CRYPTO_H_
#define _CRYPTO_H_

#include <stdbool.h>
#include <stdint.h>

/*bt encryption functions*/

/*===========legacy================================*/
/*aes-128*/
void bt_crypto_e(const uint8_t key[16],
                 const uint8_t plaintext[16], uint8_t encrypted[16]);

/*used to create 24 bit hash used in random address creation and resolution*/
void bt_crypto_ah(const uint8_t k[16],
                  const uint8_t r[3], uint8_t hash[3]);

/*used to generate confirm values*/
void bt_crypto_c1(const uint8_t k[16],
                  const uint8_t r[16], const uint8_t pres[7],
                  const uint8_t preq[7], uint8_t iat,
                  const uint8_t ia[6], uint8_t rat,
                  const uint8_t ra[6], uint8_t res[16]);

/* used to generate STK*/
void bt_crypto_s1(const uint8_t k[16],
                  const uint8_t r1[16], const uint8_t r2[16],
                  uint8_t res[16]);

/*===========secure connection================================*/
/*used to generate confirm values*/
void bt_crypto_f4(uint8_t u[32], uint8_t v[32],
                  uint8_t x[16], uint8_t z, uint8_t res[16]);

/*used to generate LTK and MacKey*/
void bt_crypto_f5(uint8_t w[32], uint8_t n1[16],
                  uint8_t n2[16], uint8_t a1[7], uint8_t a2[7],
                  uint8_t mackey[16], uint8_t ltk[16]);

/*used to generate check values during authentication stage 2*/
void bt_crypto_f6(uint8_t w[16], uint8_t n1[16],
                  uint8_t n2[16], uint8_t r[16], uint8_t io_cap[3],
                  uint8_t a1[7], uint8_t a2[7], uint8_t res[16]);

/*used to generate numeric comparison values during authentication stage 1*/
void bt_crypto_g2(uint8_t u[32], uint8_t v[32],
                  uint8_t x[16], uint8_t y[16], uint32_t *val);

/*used to convert keys of a given size from one key type to another key type with equivalent strength*/
void bt_crypto_h6(uint8_t key[16], uint8_t keyid[4], uint8_t res[16]);

/*used to generate  values*/
bool bt_crypto_sign_att(const uint8_t key[16],
                        const uint8_t *m, uint16_t m_len,
                        uint32_t sign_cnt, uint8_t signature[12]);
#endif
