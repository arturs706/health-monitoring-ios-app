import UIKit
import FBSDKCoreKit
import GoogleSignIn

class AppDelegate: UIResponder, UIApplicationDelegate {
func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
) -> Bool {
    ApplicationDelegate.shared.application(
        application,
        didFinishLaunchingWithOptions: launchOptions
    )


    return true
}
      
func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    if ApplicationDelegate.shared.application(app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation]) {
        return true
    }
    
    let handled = GIDSignIn.sharedInstance.handle(url)
    if handled {
        return true
    }
            
    return false
}
    
}
