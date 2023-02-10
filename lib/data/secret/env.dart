import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'assets/app/.env')
abstract class Env {
  @EnviedField(obfuscate: true)
  static final clientId = _Env.clientId;
  @EnviedField(obfuscate: true)
  static final clientSecret = _Env.clientSecret;
}
