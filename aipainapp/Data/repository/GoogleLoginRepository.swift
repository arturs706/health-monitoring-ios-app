import Foundation

protocol GoogleLoginRepository {
    func googlelogin(social_id: String, email: String, full_name: String, completion: @escaping (Result<LoginResponse, ErrorResponseJSON>) -> Void)
}

class GoogleLoginRepositoryImpl: GoogleLoginRepository {
    private let apiService: ApiService
    
    init(apiService: ApiService) {
        self.apiService = apiService
    }
    
    func googlelogin(social_id: String, email: String, full_name: String, completion: @escaping (Result<LoginResponse, ErrorResponseJSON>) -> Void) {
        apiService.googlelogin(social_id: social_id, email: email, full_name: full_name) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
