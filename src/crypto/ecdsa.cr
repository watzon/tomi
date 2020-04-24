require "openssl"

lib LibCrypto
  type ECDSA_SIG = Void*
  type ECDSA_METHOD = Void*

  fun ecdsa_sig_new = ECDSA_SIG_new : ECDSA_SIG*
  fun ecdsa_sig_free = ECDSA_SIG_free(sig : ECDSA_SIG*)
  fun i2d_ecdsa_sig = i2d_ECDSA_SIG(sig : ECDSA_SIG*, pp : UInt8**) : LibC::Int
  fun d2i_ecdsa_sig = d2i_ECDSA_SIG(sig : ECDSA_SIG**, pp : UInt8**, len : LibC::Long) : ECDSA_SIG*

  fun ecdsa_do_sign = ECDSA_do_sign(digest : UInt8*, digestlen : LibC::Int, eckey : EC_KEY*) : ECDSA_SIG*
  # fun ecdsa_do_sign_ex = ECDSA_do_sign_ex(digest : UInt8*, digestlen : LibC::Int, kinv : Bignum*, rp : Bignum* eckey : EC_KEY*) : ECDSA_SIG*
  fun ecdsa_do_verify = ECDSA_do_verify(digest : UInt8*, digestlen : LibC::Int, sig : ECDSA_SIG*, eckey : EC_KEY*) : LibC::Int
  # fun ecdsa_sign_setup = ECDSA_sign_setup(eckey : EC_KEY*, ctx : BnCtx*, kinv : Bignum**, rp : Bignum**) : LibC::Int
  fun ecdsa_sign = ECDSA_sign(type : LibC::Int, digest : UInt8*, digestlen : LibC::Int, sig : UInt8*, siglen : LibC::Int, eckey : EC_KEY*) : LibC::Int
  # fun ecdsa_sign_ex = ECDSA_sign_ex(type : LibC::Int, digest : UInt8*, digestlen : LibC::Int, sig : UInt8*, siglen : LibC::UInt8, kinv : Bignum*,  rp : Bignum*, eckey : EC_KEY*) : LibC::Int
  fun ecdsa_verify = ECDSA_verify(type : Int32, digest : UInt8*, digestlen : LibC::Int, sig : UInt8*, siglen : LibC::Int, eckey : EC_KEY*) : LibC::Int
  fun ecdsa_size = ECDSA_size(eckey : EC_KEY*) : LibC::Int

  fun ecdsa_openssl = ECDSA_OpenSSL : ECDSA_METHOD*
  fun ecdsa_set_default_method = ECDSA_set_default_method(method : ECDSA_METHOD*)
  fun ecdsa_get_default_method = ECDSA_get_default_method : ECDSA_METHOD*
  fun ecdsa_set_method = ECDSA_set_method(eckey : EC_KEY*, method : ECDSA_METHOD*) : LibC::Int

  # fun ecdsa_get_ex_new_index = ECDSA_get_ex_new_index(argl : LibC::Long, argp : Void*, new_func : CryptoExNew*, dup_func : CryptoExDup*, free_func : CryptoExFree*) : LibC::Int
  # fun ecdsa_set_ex_data = ECDSA_set_ex_data(d : EC_KEY*, idx : LibC::Int, arg : Void*) : LibC::Int
  fun ecdsa_get_ex_data = ECDSA_get_ex_data(d : EC_KEY*, idx : LibC::Int) : Void*
end
