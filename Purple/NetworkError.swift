//
//  NetworkError.swift
//  Purple
//
//  Created by Work on 25.07.2023.
//

import Foundation

enum NetworkError: Error {
    case noData
    case apiError(Error)
}
