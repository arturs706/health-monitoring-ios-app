import Foundation

class ApiServiceImpl: ApiService {
 
    private let baseURL = URL(string: "http://0.0.0.0:2001/")!
    
    func login(email: String, password: String, completion: @escaping (Result<LoginResponse, ErrorResponseJSON>) -> Void) {
        let endpoint = "api/v1/users/login"
        let requestBody = LoginRequest(email: email, passwd: password)
        performRequest(endpoint: endpoint, requestBody: requestBody, completion: completion)
    }
    
    func googlelogin(social_id: String, email: String, full_name: String, completion: @escaping (Result<LoginResponse, ErrorResponseJSON>) -> Void) {
        let endpoint = "api/v1/users/login/google"
        let requestBody = SocialLoginRequest(social_id: social_id, email: email, full_name: full_name)
        performRequest(endpoint: endpoint, requestBody: requestBody, completion: completion)
    }
    
    func facebooklogin(social_id: String, email: String, full_name: String, completion: @escaping (Result<LoginResponse, ErrorResponseJSON>) -> Void) {
        let endpoint = "api/v1/users/login/faceboook"
        let requestBody = SocialLoginRequest(social_id: social_id, email: email, full_name: full_name)
        performRequest(endpoint: endpoint, requestBody: requestBody, completion: completion)
    }
    
    
    private func performRequest<T: Codable, U: Codable>(endpoint: String, requestBody: T, completion: @escaping (Result<U, ErrorResponseJSON>) -> Void) {
        var request = URLRequest(url: baseURL.appendingPathComponent(endpoint))
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = try? JSONEncoder().encode(requestBody)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(ErrorResponseJSON(message: error.localizedDescription, status: "error")))
                return
            }
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                     print("Received data: \(dataString)")
                 }
            if let data = data {
                do {
                    let responseObj = try JSONDecoder().decode(U.self, from: data)
                    if let errorResponse = responseObj as? ErrorResponseJSON {
                        completion(.failure(errorResponse))
                        return
                    }
                    completion(.success(responseObj))
                } catch {
                    if let errorResponse = try? JSONDecoder().decode(ErrorResponseJSON.self, from: data) {
                        completion(.failure(errorResponse))
                    } else {
                        completion(.failure(ErrorResponseJSON(message: "Decoding failed", status: "error")))
                    }
                }
            } else {
                completion(.failure(ErrorResponseJSON(message: "Invalid response", status: "error")))
            }
        }
        
        task.resume()
    }
}
