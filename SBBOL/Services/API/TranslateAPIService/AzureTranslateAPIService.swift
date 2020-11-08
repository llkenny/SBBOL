//
//  AzureTranslateAPIService.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 05.11.2020.
//

import Foundation

///  Translate service for Microsoft Azure
final class AzureTranslateAPIService: APIService, TranslateAPIService {

    init(session: URLSession = APISettings.defaultSession) {
        super.init(session: session, path: "https://api.cognitive.microsofttranslator.com/translate")
    }

    /// Text translation
    /// - Parameters:
    ///   - text: Text to translate
    ///   - from: Source language code
    ///   - to: Destination language code
    ///   - completion: Translation or error
    func translate(text: String, from: String?, to: String, completion: @escaping (Result<[AzureTranslateResponse], Error>) -> Void) {
        var queryItems = [URLQueryItem(name: "to", value: to),
                          URLQueryItem(name: "api-version", value: "3.0")]

        if let from = from, !from.isEmpty {
            queryItems.append(URLQueryItem(name: "from", value: from))
        }

        let headers = ["Content-Type": "application/json",
                       "Ocp-Apim-Subscription-Key": APISettings.azureTranslateToken]

        let requestData = AzureTranslateRequestData(text: text)
        do {
            let httpBody = try JSONEncoder().encode([requestData]) // array not single element
            perform(httpMethod: "POST", httpBody: httpBody, headers: headers, queryItems: queryItems, completion: completion)
        } catch {
            completion(.failure(APIError.encoding))
            return
        }
    }
}
