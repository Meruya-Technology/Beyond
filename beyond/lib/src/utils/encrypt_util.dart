import 'package:encrypt/encrypt.dart';

class EncryptUtil {
  static String encrypt(
    String text, {
    Algorithm? algorithm,
    required String secretKey,
  }) {
    final encrypter = Encrypter(
      algorithm ?? AES(Key.fromBase64(secretKey)),
    );
    return encrypter.encrypt(text, iv: IV.fromLength(16)).base64;
  }
}
