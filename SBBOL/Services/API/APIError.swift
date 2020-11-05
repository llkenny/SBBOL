//
//  APIError.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 05.11.2020.
//

import Foundation

enum APIError: LocalizedError {
    case path,
         service(error: Error),
         network,
         encoding,
         decoding

    var errorDescription: String? {
        switch self {
        case .path, .encoding:
            return "App error. Please contact support."
        case .network, .service:
            return "Service error. Please try again later."
        case .decoding:
            return "Data error. Please try again later."
        }
    }
}
