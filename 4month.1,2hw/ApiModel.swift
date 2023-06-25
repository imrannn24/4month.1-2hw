//
//  ApiModel.swift
//  4month.1,2hw
//
//  Created by imran on 26.06.2023.
//

import Foundation

import Foundation

class ApiManager{
    
    static let shared = ApiManager()
    
    func requestData(completition: @escaping (Result<ProductsModel,Error>) -> Void) {
        
        guard let url = URL(string: "https://dummyjson.com/products") else {return}
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else {return}
            
            do {
                let value = try JSONDecoder().decode(ProductsModel.self, from: data)
                completition(.success(value))
            } catch {
                completition(.failure(error))
            }
        }
        task.resume()
    }
}
