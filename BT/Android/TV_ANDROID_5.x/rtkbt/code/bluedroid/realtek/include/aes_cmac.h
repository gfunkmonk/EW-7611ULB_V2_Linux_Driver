#ifndef _AES_CMAC_H_
#define _AES_CMAC_H_

#define AES_128(key, IN, OUT)     AES128_encrypt(IN, key, OUT)

/*aes_cmac function*/
void AES_CMAC_RTK(unsigned char *key, unsigned char *input,
              int length, unsigned char *mac);
void generate_subkey(unsigned char *key, unsigned char *K1, unsigned
                     char *K2);

#endif
