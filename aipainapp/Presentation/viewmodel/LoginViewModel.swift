import Combine
import Foundation

class LoginViewModel: ObservableObject {
    @Published var username: String? = nil
    @Published var password: String? = nil
    @Published var passwordVisibility: Bool = false
    @Published var loginResponse: LoginResponse?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    private let loginRepository: LoginRepository
    private var cancellables = Set<AnyCancellable>()

    init(loginRepository: LoginRepository) {
        self.loginRepository = loginRepository
    }

    func togglePasswordVisibility() {
        passwordVisibility.toggle()
    }

    func login() {
        guard let username = username, let password = password else {
            errorMessage = "Please enter a username and password."
            return
        }

        isLoading = true
        errorMessage = nil
        loginResponse = nil

        loginRepository.login(email: username, password: password) { [weak self] result in
            guard let self = self else { return }

            DispatchQueue.main.async {
                self.isLoading = false

                switch result {
                case .success(let response):
                    self.loginResponse = response
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
