import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
/// This class serves as the **interface** to access all environment variables
/// The actual values are securely loaded from the .env file
/// and injected by the 'envied' package.
abstract class Env {
  @EnviedField(varName: 'WEATHERKEY')
  /// visualCrossing API KEY
  static const String visualCrossingApiKey = _Env.visualCrossingApiKey;
}
