//
//  AzureTranslateAPIService.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 05.11.2020.
//

import Foundation

///  Translate service for Microsoft Azure
final class AzureTranslateAPIService: TranslateAPIService {

    private let session: URLSession
    private let path = "https://api.cognitive.microsofttranslator.com/translate"

    init(session: URLSession = APISettings.defaultSession) {
        self.session = session
    }

    /// Text translation
    /// - Parameters:
    ///   - text: Text to translate
    ///   - to: Destination language code
    ///   - completion: Translation or error
    func translate(text: String, to: String, completion: @escaping (Result<[AzureTranslateResponse], Error>) -> Void) {
        var components = URLComponents(string: path)
        components?.queryItems = [URLQueryItem(name: "to", value: to),
                                  URLQueryItem(name: "api-version", value: "3.0")]
        guard let url = components?.url else {
            completion(.failure(APIError.path))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setDefaultAzureHeaders(auth: true)

        let requestData = AzureTranslateRequestData(text: text)
        do {
            request.httpBody = try JSONEncoder().encode([requestData]) // array not single element
        } catch {
            completion(.failure(APIError.encoding))
            return
        }

        session.dataTask(with: request) { (data, response, error) in
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
            guard let decoding = try? JSONDecoder().decode([AzureTranslateResponse].self, from: data) else {
                completion(.failure(APIError.decoding))
                return
            }
            completion(.success(decoding))
        }.resume()
    }
}
