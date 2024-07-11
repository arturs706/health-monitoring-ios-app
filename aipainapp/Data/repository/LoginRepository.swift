import Foundation

protocol LoginRepository {
    func login(email: String, password: String, completion: @escaping (Result<LoginResponse, ErrorResponseJSON>) -> Void)
}

class LoginRepositoryImpl: LoginRepository {
    private let apiService: ApiService
    
    init(apiService: ApiService) {
        self.apiService = apiService
    }
    
    func login(email: String, password: String, completion: @escaping (Result<LoginResponse, ErrorResponseJSON>) -> Void) {
        apiService.login(email: email, password: password) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
