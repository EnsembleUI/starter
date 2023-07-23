import 'package:ensemble/framework/placeholder/auth_context_manager.dart';
import 'package:ensemble/framework/placeholder/oauth_controller.dart';
import 'package:ensemble/framework/placeholder/token_manager.dart';
import 'package:ensemble/widget/stub_widgets.dart';
import 'package:ensemble_auth/OAuthController.dart';
import 'package:ensemble_auth/token_manager.dart';
import 'package:ensemble_starter/generated/module_settings.dart';
// Uncomment to enable camera services
// import 'package:ensemble_camera/camera_manager.dart';
import 'package:get_it/get_it.dart';

// Uncomment to enable Auth
import 'package:ensemble_auth/auth_manager.dart';
import 'package:ensemble_auth/sign_in_with_apple.dart';
import 'package:ensemble_auth/sign_in_with_google.dart';

/// TODO: This class should be generated to enable selected Services
class EnsembleServices {
  static final EnsembleServices _instance = EnsembleServices._internal();
  EnsembleServices._internal();
  factory EnsembleServices() {
    return _instance;
  }

  void init() {
    // Uncomment to enable camera services
    // if (useCamera) {
    //   GetIt.I.registerSingleton<CameraManager>(CameraManagerImpl());
    // } else {
    //   GetIt.I.registerSingleton<CameraManager>(CameraManagerPlaceholder());
    // }

    if (ModuleSettings.useAuth) {
      GetIt.I.registerFactory<AuthContextManagerBase>(() => AuthContextManager());
      GetIt.I.registerFactory<SignInWithGoogleBase>(() => SignInWithGoogle());
      GetIt.I.registerFactory<SignInWithAppleBase>(() => EnsembleSignInWithApple());
      GetIt.I.registerSingleton<TokenManagerBase>(TokenManager());
      GetIt.I.registerFactory<OAuthControllerBase>(() => OAuthController());
    } else {
      GetIt.I.registerFactory<AuthContextManagerBase>(() => AuthContextManagerStub());
      GetIt.I.registerFactory<SignInWithGoogleBase>(() => const SignInWithGoogleStub());
      GetIt.I.registerFactory<SignInWithAppleBase>(() => const SignInWithAppleStub());
      GetIt.I.registerSingleton<TokenManagerBase>(TokenManagerStub());
      GetIt.I.registerFactory<OAuthControllerBase>(() => OAuthControllerStub());
    }
  }


}