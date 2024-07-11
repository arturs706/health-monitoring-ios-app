import SwiftUI
import GoogleSignIn

@main
struct aipainappApp: App {
@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                         GIDSignIn.sharedInstance.handle(url)
                       }
        }
    }
}
