//
//  AzureLanguageAPIService.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 05.11.2020.
//

import Foundation

/// Language service for Microsoft Azure
final class AzureLanguageAPIService: LanguageAPIService {

    private let session: URLSession
    private let path = "https://api.cognitive.microsofttranslator.com/languages"

    init(session: URLSession = APISettings.defaultSession) {
        self.session = session
    }

    /// Getting a dictionary of supported languages
    /// - Parameter completion: Supported languages or error
    func fetch(completion: @escaping (Result<AzureLanguageResponse, Error>) -> Void) {
        var components = URLComponents(string: path)
        components?.queryItems = [URLQueryItem(name: "scope", value: "translation"),
                                  URLQueryItem(name: "api-version", value: "3.0")]
        guard let url = components?.url else {
            completion(.failure(APIError.path))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setDefaultAzureHeaders()

        session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(.failure(APIError.service(error: error!)))
                return
            }
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200,
                  let data = data else {
                completion(.failure(APIError.network))
                return
            }
            guard let decoding = try? JSONDecoder().decode(AzureLanguageResponse.self, from: data) else {
                completion(.failure(APIError.decoding))
                return
            }
            completion(.success(decoding))
        }.resume()
    }
}
