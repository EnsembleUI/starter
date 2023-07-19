import 'package:ensemble/framework/placeholder/camera_manager.dart';
// Uncomment to enable camera services
// import 'package:ensemble_camera/camera_manager.dart';

// import 'package:ensemble/util/notification_utils.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:get_it/get_it.dart';

/// TODO: This class should be generated to enable selected Services
class EnsembleServices {
  static final EnsembleServices _instance = EnsembleServices._internal();
  EnsembleServices._internal();
  factory EnsembleServices() {
    return _instance;
  }

  void init() {
    initServices(
        useCamera: false, useLocation: false, useFirebaseMessaging: false);
  }

  void initServices(
      {required bool useCamera,
      required bool useLocation,
      required bool useFirebaseMessaging}) {
    // Uncomment to enable camera services
    // if (useCamera) {
    //   GetIt.I.registerSingleton<CameraManager>(CameraManagerImpl());
    // } else {
    //   GetIt.I.registerSingleton<CameraManager>(CameraManagerPlaceholder());
    // }

    if (useLocation) {
    } else {}

    if (useFirebaseMessaging) {
      // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //   Ensemble.externalDataContext.addAll({
      //     'title': message.notification?.title,
      //     'body': message.notification?.body,
      //   });
      //   notificationUtils.handleRemoteNotification();
      // });

      // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      //   Ensemble.externalDataContext.addAll({
      //     'title': message.notification?.title,
      //     'body': message.notification?.body,
      //   });
      //   notificationUtils.handleRemoteNotificationOpened();
      // });
    }
  }
}
