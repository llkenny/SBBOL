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
    ///   - to: Destination language code
    ///   - completion: Translation or error
    func translate(text: String, to: String, completion: @escaping (Result<[AzureTranslateResponse], Error>) -> Void) {
        let queryItems = [URLQueryItem(name: "to", value: to),
                          URLQueryItem(name: "api-version", value: "3.0")]

        let requestData = AzureTranslateRequestData(text: text)
        do {
            let httpBody = try JSONEncoder().encode([requestData]) // array not single element
            perform(httpMethod: "POST", httpBody: httpBody, auth: true, queryItems: queryItems, completion: completion)
        } catch {
            completion(.failure(APIError.encoding))
            return
        }
    }
}
