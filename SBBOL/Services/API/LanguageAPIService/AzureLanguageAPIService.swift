//
//  AzureLanguageAPIService.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 05.11.2020.
//

import Foundation

/// Language service for Microsoft Azure
final class AzureLanguageAPIService: APIService, LanguageAPIService {

    init(session: URLSession = APISettings.defaultSession) {
        super.init(session: session, path: "https://api.cognitive.microsofttranslator.com/languages")
    }

    /// Getting a dictionary of supported languages
    /// - Parameter completion: Supported languages or error
    func fetch(completion: @escaping (Result<AzureLanguageResponse, Error>) -> Void) {
        let queryItems = [URLQueryItem(name: "scope", value: "translation"),
                          URLQueryItem(name: "api-version", value: "3.0")]

        let headers = ["Content-Type": "application/json"]

        perform(headers: headers, queryItems: queryItems, completion: completion)
    }
}
