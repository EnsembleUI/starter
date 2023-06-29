import 'package:ensemble/framework/placeholder/camera_manager.dart';
import 'package:ensemble/framework/widget/camera_manager_impl.dart';
import 'package:get_it/get_it.dart';

/// TODO: This class should be generated to enable selected Services
class EnsembleServices {
  static final EnsembleServices _instance = EnsembleServices._internal();
  EnsembleServices._internal();
  factory EnsembleServices() {
    return _instance;
  }

  void init() {
    initServices(useCamera: false, useLocation: false);
  }

  /// tree-shaking will remove the un-used manager implementation.
  void initServices({required bool useCamera, required bool useLocation}) {
    if (useCamera) {
      GetIt.I.registerSingleton<CameraManager>(CameraManagerImpl());
    } else {
      GetIt.I.registerSingleton<CameraManager>(CameraManagerPlaceholder());
    }

    if (useLocation) {

    } else {

    }
  }


}