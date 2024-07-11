import Foundation

protocol FacebookLoginRepository {
    func facebooklogin(social_id: String, email: String, full_name: String, completion: @escaping (Result<LoginResponse, ErrorResponseJSON>) -> Void)
}

class FacebookLoginRepositoryImpl: FacebookLoginRepository {
    private let apiService: ApiService
    
    init(apiService: ApiService) {
        self.apiService = apiService
    }
    
    func facebooklogin(social_id: String, email: String, full_name: String, completion: @escaping (Result<LoginResponse, ErrorResponseJSON>) -> Void) {
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
