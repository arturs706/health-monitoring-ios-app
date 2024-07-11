import Foundation

struct SocialLoginRequest: Codable, Equatable {
    let social_id: String
    let email: String
    let full_name: String
}
