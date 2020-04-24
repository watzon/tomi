require "openssl"

lib LibCrypto
  type EX_GROUP = Void*

  fun ec_key_new_ex = EC_KEY_new_ex(ctx : LibSSL::SSLContext*) : EC_KEY
  fun ec_key_new = EC_KEY_new : EC_KEY
  # int EC_KEY_get_flags(const EC_KEY *key);
  # void EC_KEY_set_flags(EC_KEY *key, int flags);
  # void EC_KEY_clear_flags(EC_KEY *key, int flags);
  # fun ec_key_new_by_curve_name = EC_KEY_new_by_curve_name(nid : LibC::Int) : EC_KEY*
  # EC_KEY *EC_KEY_copy(EC_KEY *dst, const EC_KEY *src);
  # EC_KEY *EC_KEY_dup(const EC_KEY *src);
  # int EC_KEY_up_ref(EC_KEY *key);
  # ENGINE *EC_KEY_get0_engine(const EC_KEY *eckey);
  fun ec_key_get_group = EC_KEY_get0_group(key : EC_KEY) : EC_GROUP
  # int EC_KEY_set_group(EC_KEY *key, const EC_GROUP *group);
  fun ec_key_get_private_key = EC_KEY_get0_private_key(key : EC_KEY) : Bignum*
  # int EC_KEY_set_private_key(EC_KEY *key, const BIGNUM *prv);
  fun ec_key_get_public_key = EC_KEY_get0_public_key(key : EC_KEY) : EC_POINT
  # int EC_KEY_set_public_key(EC_KEY *key, const EC_POINT *pub);
  # point_conversion_form_t EC_KEY_get_conv_form(const EC_KEY *key);
  # void EC_KEY_set_conv_form(EC_KEY *eckey, point_conversion_form_t cform);
  # void EC_KEY_set_asn1_flag(EC_KEY *eckey, int asn1_flag);
  # int EC_KEY_precompute_mult(EC_KEY *key, BN_CTX *ctx);
  fun ec_key_generate_key = EC_KEY_generate_key(key : EC_KEY) : LibC::Int
  # int EC_KEY_check_key(const EC_KEY *key);
  # int EC_KEY_set_public_key_affine_coordinates(EC_KEY *key, BIGNUM *x, BIGNUM *y);
  # const EC_KEY_METHOD *EC_KEY_get_method(const EC_KEY *key);
  # int EC_KEY_set_method(EC_KEY *key, const EC_KEY_METHOD *meth);

  # int EC_KEY_oct2key(EC_KEY *eckey, const unsigned char *buf, size_t len, BN_CTX *ctx);
  # size_t EC_KEY_key2buf(const EC_KEY *eckey, point_conversion_form_t form,
  #                       unsigned char **pbuf, BN_CTX *ctx);

  # int EC_KEY_oct2priv(EC_KEY *eckey, const unsigned char *buf, size_t len);
  # size_t EC_KEY_priv2oct(const EC_KEY *eckey, unsigned char *buf, size_t len);

  # size_t EC_KEY_priv2buf(const EC_KEY *eckey, unsigned char **pbuf);

  # void EC_KEY_free(EC_KEY *key);
  # EC_KEY *EC_KEY_new_by_curve_name_ex(OPENSSL_CTX *ctx, int nid);
end
