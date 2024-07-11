// ApiService.swift
import Foundation

protocol ApiService {
    func login(email: String, password: String, completion: @escaping (Result<LoginResponse, ErrorResponseJSON>) -> Void)
    func googlelogin(social_id: String, email: String, full_name: String, completion: @escaping (Result<LoginResponse, ErrorResponseJSON>) -> Void)
    func facebooklogin(social_id: String, email: String, full_name: String, completion: @escaping (Result<LoginResponse, ErrorResponseJSON>) -> Void)
}
