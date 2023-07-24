import 'package:ensemble/framework/stub/camera_manager.dart';
import 'package:ensemble/module/auth_module.dart';
import 'package:get_it/get_it.dart';

// Uncomment to enable Auth service
// import 'package:ensemble_auth/module/auth_module.dart';

// Uncomment to enable camera services
// import 'package:ensemble_camera/camera_manager.dart';


/// TODO: This class should be generated to enable selected Services
class EnsembleModules {
  static final EnsembleModules _instance = EnsembleModules._internal();
  EnsembleModules._internal();
  factory EnsembleModules() {
    return _instance;
  }

  // capabilities
  static const useCamera = false;

  // optional modules
  static const useAuth = false;

  void init() {

    if (useCamera) {
      // Uncomment to enable camera service
      // GetIt.I.registerSingleton<CameraManager>(CameraManagerImpl());
    } else {
      GetIt.I.registerSingleton<CameraManager>(CameraManagerStub());
    }


    if (useAuth) {
      // Uncomment to enable Auth service
      // AuthModuleImpl().init();
    } else {
      AuthModuleStub().init();
    }

  }


}