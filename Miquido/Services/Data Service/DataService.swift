//
//  DataService.swift
//  Miquido
//
//  Created by KL on 09/08/2021.
//

import Foundation

protocol DataServiceProtocol: AnyObject {
    func fetchData(completion: @escaping (Result<ListData, ErrorResult>) -> ())
}

final class DataService: DataServiceProtocol {
    
    private enum Constants {
        static let endpoint = "https://reqres.in/api/users"
    }
    
    func fetchData(completion: @escaping (Result<ListData, ErrorResult>) -> ()) {
        guard let url = URL(string: Constants.endpoint) else {
            completion(.failure(.url))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                if let err = error as? URLError, err.code == .notConnectedToInternet {
                    completion(.failure(.noInternet))
                } else {
                    completion(.failure(.network))
                }
                return
            }

            else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                completion(.failure(.statusCode))
                return
            }

            guard let data = data else {
                completion(.failure(.other))
                return
            }
            
            do {
                let responseData = try JSONDecoder().decode(ListData.self, from: data)
                completion(.success(responseData))
            } catch {
                completion(.failure(.parse))
            }
        }.resume()
    }
}
