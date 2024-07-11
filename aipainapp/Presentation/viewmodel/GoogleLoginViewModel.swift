import Foundation
import GoogleSignIn

class GoogleLoginViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var userEmail: String? = nil
    @Published var loginError: String? = nil

    private let googleLoginRepository: GoogleLoginRepository

    init(googleLoginRepository: GoogleLoginRepository) {
        self.googleLoginRepository = googleLoginRepository
    }

    func handleLogin() {
        if let rootViewController = UIApplication.shared.windows.first?.rootViewController {
            GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { signInResult, error in
                DispatchQueue.main.async {
                    guard let result = signInResult else {
                        self.loginError = "Sign in error: \(error?.localizedDescription ?? "Unknown error")"
                        return
                    }

                    let id = result.user.userID ?? ""
                    let email = result.user.profile?.email ?? ""
                    let givenname = result.user.profile?.givenName ?? ""
                    let familyname = result.user.profile?.familyName ?? ""
                    let fullname = givenname + familyname
                    let social_id = String(id)

                    self.googleLoginRepository.googlelogin(social_id: social_id, email: email, full_name: fullname) { result in
                        switch result {
                        case .success(let response):
                            DispatchQueue.main.async {
                                self.isLoggedIn = true
                                self.userEmail = email
                            }
                            print("Google login success: \(response)")
                        case .failure(let error):
                            DispatchQueue.main.async {
                                self.loginError = "Google login failed: \(error.localizedDescription)"
                            }
                            print("Google login failed: \(error)")
                        }
                    }
                }
            }
        } else {
            DispatchQueue.main.async {
                self.loginError = "Root view controller not available."
            }
        }
    }
}
