lib LibCrypto
  type EC_POINT = Void*
  type EC_GROUP = Void*

  enum PointConversionForm
    Compressed = 2
    Uncompressed = 4
    Hybrid = 6
  end

  # EC_POINT *EC_POINT_new(const EC_GROUP *group);
  # void EC_POINT_free(EC_POINT *point);
  # void EC_POINT_clear_free(EC_POINT *point);
  # int EC_POINT_copy(EC_POINT *dst, const EC_POINT *src);
  # EC_POINT *EC_POINT_dup(const EC_POINT *src, const EC_GROUP *group);
  # const EC_METHOD *EC_POINT_method_of(const EC_POINT *point);
  # int EC_POINT_set_to_infinity(const EC_GROUP *group, EC_POINT *point);
  # int EC_POINT_set_Jprojective_coordinates_GFp(const EC_GROUP *group, EC_POINT *p,
  #       const BIGNUM *x, const BIGNUM *y, const BIGNUM *z, BN_CTX *ctx);
  # int EC_POINT_get_Jprojective_coordinates_GFp(const EC_GROUP *group,
  #       const EC_POINT *p, BIGNUM *x, BIGNUM *y, BIGNUM *z, BN_CTX *ctx);
  # int EC_POINT_set_affine_coordinates_GFp(const EC_GROUP *group, EC_POINT *p,
  #       const BIGNUM *x, const BIGNUM *y, BN_CTX *ctx);
  # int EC_POINT_get_affine_coordinates_GFp(const EC_GROUP *group,
  #       const EC_POINT *p, BIGNUM *x, BIGNUM *y, BN_CTX *ctx);
  # int EC_POINT_set_compressed_coordinates_GFp(const EC_GROUP *group, EC_POINT *p,
  #       const BIGNUM *x, int y_bit, BN_CTX *ctx);
  # int EC_POINT_set_affine_coordinates_GF2m(const EC_GROUP *group, EC_POINT *p,
  #       const BIGNUM *x, const BIGNUM *y, BN_CTX *ctx);
  # int EC_POINT_get_affine_coordinates_GF2m(const EC_GROUP *group,
  #       const EC_POINT *p, BIGNUM *x, BIGNUM *y, BN_CTX *ctx);
  # int EC_POINT_set_compressed_coordinates_GF2m(const EC_GROUP *group, EC_POINT *p,
  #       const BIGNUM *x, int y_bit, BN_CTX *ctx);
  # size_t EC_POINT_point2oct(const EC_GROUP *group, const EC_POINT *p,
  #       point_conversion_form_t form,
  #       unsigned char *buf, size_t len, BN_CTX *ctx);
  # int EC_POINT_oct2point(const EC_GROUP *group, EC_POINT *p,
  #       const unsigned char *buf, size_t len, BN_CTX *ctx);
  # fun ec_point_point2bn = EC_POINT_point2bn(group : EC_GROUP*, point : EC_POINT*, form : Void*, bn : Bignum*, ctx : BnCtx*) : Bignum*
  # EC_POINT *EC_POINT_bn2point(const EC_GROUP *, const BIGNUM *,
  #       EC_POINT *, BN_CTX *);
  fun ec_point_point2hex = EC_POINT_point2hex(group : EC_GROUP, point : EC_POINT, convert_form : PointConversionForm, ctx : BnCtx*) : UInt8*
  # EC_POINT *EC_POINT_hex2point(const EC_GROUP *, const char *,
  #       EC_POINT *, BN_CTX *);
end
