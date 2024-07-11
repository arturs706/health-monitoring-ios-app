import Foundation

class RegisterViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    // Add any other properties or methods as needed
    
    func register() {
        // Perform registration logic here
        // You may validate input data and perform registration API call
    }
}
