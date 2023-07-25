//
//  NetworkManager.swift
//  Purple
//
//  Created by Work on 25.07.2023.
//

import Apollo
import SwiftUI
import RickAndMortyAPI

class NetworkManager{
    
    static let shared = NetworkManager()
    
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
    
}
