import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  static let methodChannelName: String = "com.ensembleui.host.platform"
  var methodChannel: FlutterMethodChannel?
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    methodChannel =  FlutterMethodChannel(name: AppDelegate.methodChannelName, binaryMessenger: controller.binaryMessenger)
    GMSServices.provideAPIKey("AIzaSyD8vwvoaEPEgYemp1EkIETetJMvyS4Ptqk")
    GeneratedPluginRegistrant.register(with: self)
      
    // MARK: Get keychain values from Ensemble to Host
    // let name = KeychainService().read(key: "name", groupId: nil, accountName: nil, synchronizable: nil).value
    // print("name: \(name)")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
  override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    // Calling flutter method "urlOpened" from iOS
    methodChannel?.invokeMethod("urlOpened", arguments: url.absoluteString)
    return true
  }
}
