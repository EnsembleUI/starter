import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    static let methodChannelName: String = "com.ensembleui.host.platform"
    static let saveToKeychainMethod: String = "saveToKeychain"
    static let clearKeychainMethod: String = "clearKeychain"
      
    var methodChannel: FlutterMethodChannel?
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        methodChannel =  FlutterMethodChannel(name: AppDelegate.methodChannelName, binaryMessenger: controller.binaryMessenger)
        methodChannel?.setMethodCallHandler({
          (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            let args = call.arguments as? [String : Any]
            
            switch call.method {
              case AppDelegate.saveToKeychainMethod:
                self.saveToKeychain(arguments: args)
                break
              case AppDelegate.clearKeychainMethod:
                self.clearKeychain(arguments: args);
              default:
                result(FlutterMethodNotImplemented)
              }
        })
          
        GMSServices.provideAPIKey("AIzaSyD8vwvoaEPEgYemp1EkIETetJMvyS4Ptqk")
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        invokeDeepLink(url: url)
        return true
    }
    
    private func saveToKeychain(arguments: [String: Any]?) {
        guard let args = arguments else { return }
        guard args["key"] is String else { return }
        guard let data = args["data"] as? String else { return }
        guard let dataObj = data.data(using: .utf8) else { return }
                
        // Store value to keychain
    }
    
    private func clearKeychain(arguments: [String: Any]?) {
        guard let args = arguments else { return }
        guard args["key"] is String else { return }
                
        // Remove value from keychain
    }
    
    private func invokeDeepLink(url: URL) {
        // Calling flutter method "urlOpened" from iOS
        methodChannel?.invokeMethod("urlOpened", arguments: url.absoluteString)
    }
}
