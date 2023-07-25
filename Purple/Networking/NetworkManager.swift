//
//  NetworkManager.swift
//  Purple
//
//  Created by Work on 25.07.2023.
//

import Apollo
import SwiftUI
import RickAndMortyAPI
import UIKit

class NetworkManager{
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString,UIImage>()
    
    private init(){}
    
    private lazy var apollo =  ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
    
    func executeQuery<Query:GraphQLQuery>(query:Query, completion: @escaping(Result<Query.Data?,NetworkError>)->Void){
        
        apollo.fetch(query: query){result in
            
            switch result{
                    
                case .success(let graphQLResult):
                    if let data = graphQLResult.data{
                        completion(.success(data))
                    }else {
                        completion(.failure(.noData))
                    }
                    
                case .failure(let error):
                    completion(.failure(.apiError(error)))
            }
        }
    }
    
    func downloadImage(fromURLString urlString:String,completed: @escaping(UIImage?)->Void){
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey){ //cache de var olup olmadığını kontrol eder..
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
    
}
