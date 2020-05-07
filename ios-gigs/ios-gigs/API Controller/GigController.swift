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
        case noData, failedSignUp, failedSignIn, tryAgain, noToken
    }
    
    //MARK: - Propeties
    var bearer: Bearer?
    private let baseURL = URL(string: "https://lambdagigapi.herokuapp.com/api")!
    let jsonEncoder = JSONEncoder()
    let jsonDecoder = JSONDecoder()
    var gigs = [Gig]()
    
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
    
    
    //Login method here
    func signIn(with user: User, completion: @escaping (Result<Bool, NetworkError>) -> Void) {
        
        let signInURL = baseURL.appendingPathComponent("/users/login")
        var request = URLRequest(url: signInURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try jsonEncoder.encode(user)
            request.httpBody = jsonData
            
            let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Sign In failed: \(error)")
                    completion(.failure(.failedSignIn))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    print("Sign In failed")
                    completion(.failure(.failedSignIn))
                    return
                }
                
                guard let data = data else {
                    print("Failed to get data")
                    completion(.failure(.noData))
                    return
                }
                
                do {
                    let bearer = try self.jsonDecoder.decode(Bearer.self, from: data)
                    self.bearer = bearer
                }catch {
                    print("Error occured decoding data: \(error)")
                    completion(.failure(.noData))
                }
                
                
             completion(.success(true))
            }
            dataTask.resume()
            
        } catch {
            print("Error occured while trying to send data: \(error)")
            completion(.failure(.failedSignUp))
        }
        
    }
    
    //Get all Gigs here
    func getAllGigs(completion: @escaping (Result<[Gig], NetworkError>) -> Void) {
        guard let bearer = bearer else {
            print("No token")
            completion(.failure(.noToken))
            return
        }
        
        let getAllURL = baseURL.appendingPathComponent("/gigs/")
        var request = URLRequest(url: getAllURL)
        request.httpMethod = HTTPMethod.get.rawValue
        request.addValue("Bearer \(bearer.token)", forHTTPHeaderField: <#T##String#>)
        
        let dataTask
        
    }
    
    
    
}
