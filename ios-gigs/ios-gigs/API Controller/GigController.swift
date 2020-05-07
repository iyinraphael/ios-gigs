//
//  GigController.swift
//  ios-gigs
//
//  Created by Iyin Raphael on 5/6/20.
//  Copyright © 2020 Iyin Raphael. All rights reserved.
//

import Foundation


class GigController {
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
    }
    enum NetworkError: Error {
        case noData, failedSignUp
    }
    
    //MARK: - Propeties
    var bearer: Bearer?
    private let baseURL = URL(string: "https://lambdagigapi.herokuapp.com/api")!
    let jsonEncoder = JSONEncoder()
    
    //MARK: - Methods
    func signUp(with user: User, completion: @escaping (Result<Bool, NetworkError>) -> Void) {
        
        let signUpURL = baseURL.appendingPathComponent("/users/signup")
        var request = URLRequest(url: signUpURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try jsonEncoder.encode(user)
            request.httpBody = jsonData
            
            let dataTask = URLSession.shared.dataTask(with: request) { _, response, error in
                if let error = error {
                    print("Sign up failed: \(error)")
                    completion(.failure(.failedSignUp))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    print("Sign faliled")
                    return
                }
             completion(.success(true))
            }
            dataTask.resume()
            
        } catch {
            print("Error occured while trying to send data: \(error)")
            completion(.failure(.failedSignUp))
        }
        
    }
    
    
    
    
    
}
