import Foundation
struct ErrorResponseJSON: Codable, LocalizedError {
    let message: String
    let status: String
    
    var errorDescription: String? {
        return message
    }
}
