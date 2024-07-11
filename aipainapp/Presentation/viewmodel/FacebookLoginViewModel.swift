import Foundation
import FBSDKLoginKit

class FacebookLoginViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var userName: String? = nil
    @Published var userID: String? = nil
    @Published var userEmail: String? = nil
    @Published var loginError: String? = nil

    private let loginManager = LoginManager()
    
    private let facebookLoginRepository: FacebookLoginRepository

    init(facebookLoginRepository: FacebookLoginRepository) {
        self.facebookLoginRepository = facebookLoginRepository
    }
    

    func handleLogin() {
        loginManager.logIn(permissions: ["public_profile", "email"], from: nil) { result, error in
            if let error = error {
                self.loginError = "Failed to login: \(error.localizedDescription)"
                return
            }

            guard let result = result, !result.isCancelled else {
                self.loginError = "User cancelled login."
                return
            }

            if let token = AccessToken.current {
                self.handleLoginResult(token.tokenString)
            }
        }
    }

    func handleLoginResult(_ accessToken: String) {
        fetchUserProfile()
    }

    func fetchUserProfile() {
        GraphRequest(graphPath: "me", parameters: ["fields": "id, name, email"]).start { _, result, error in
            if let error = error {
                self.loginError = "Failed to fetch user profile: \(error.localizedDescription)"
                return
            }

            if let result = result as? [String: Any],
               let social_id = result["id"] as? String,
               let fullname = result["name"] as? String,
               let email = result["email"] as? String {
            
                self.facebookLoginRepository.facebooklogin(social_id: social_id, email: email, full_name: fullname) { result in
                    switch result {
                    case .success(let response):
                        DispatchQueue.main.async {
                            self.isLoggedIn = true
                            self.userEmail = email
                        }
                        print("Faceboook login success: \(response)")
                    case .failure(let error):
                        DispatchQueue.main.async {
                            self.loginError = "Facebook login failed: \(error.localizedDescription)"
                        }
                        print("Facebook login failed: \(error)")
                    }
                }

            }
        }
    }

    func logout() {
        loginManager.logOut()
        DispatchQueue.main.async {
            self.isLoggedIn = false
            self.userID = nil
            self.userName = nil
            self.userEmail = nil
            self.loginError = nil
        }
    }
}
