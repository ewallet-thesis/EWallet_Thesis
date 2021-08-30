import 'package:encrypt/encrypt.dart' as Keys;

//   Flutter encryption
String encrypt(String text) {
  final keys = Keys.Key.fromUtf8('MySecretKeyForEncryptionAndDecry');
  final iv = Keys.IV.fromUtf8('helloworldhellow');

  final encrypter = Keys.Encrypter(Keys.AES(keys, mode: Keys.AESMode.cbc));
  final encrypted = encrypter.encrypt(text, iv: iv);
  return encrypted.base64;
}

//Flutter decryption
String decrypt(String text) {
  final keys = Keys.Key.fromUtf8('MySecretKeyForEncryptionAndDecry');
  final iv = Keys.IV.fromUtf8('helloworldhellow');

  final encrypter = Keys.Encrypter(Keys.AES(keys, mode: Keys.AESMode.cbc));
  final decrypted = encrypter.decrypt(Keys.Encrypted.fromBase64(text), iv: iv);
  return decrypted;
}
