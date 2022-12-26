import 'package:beyond/beyond.dart';
import 'package:encrypt/encrypt.dart';
import 'package:get_it/get_it.dart';

class EncryptUtil {
  static final _env = GetIt.instance<Env>();

  static String encrypt(
    String text, {
    Algorithm? algorithm,
  }) {
    final encrypter = Encrypter(
      algorithm ??
          AES(
            Key.fromBase64(_env.secretKey),
          ),
    );
    return encrypter.encrypt(text, iv: IV.fromLength(16)).base64;
  }
}
