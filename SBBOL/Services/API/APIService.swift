//
//  APIService.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 05.11.2020.
//

import Foundation

/// Base class for API services
class APIService {

    private let session: URLSession
    private let path: String

    init(session: URLSession = APISettings.defaultSession, path: String) {
        self.session = session
        self.path = path
    }

    /// Perform request
    /// - Parameters:
    ///   - httpMethod: HTTP method
    ///   - httpBody: HTTP body
    ///   - auth: Is authorization required
    ///   - queryItems: Query items
    ///   - completion: Result with Decodable value or error
    func perform<T>(httpMethod: String = "GET",
                    httpBody: Data? = nil,
                    auth: Bool = false,
                    queryItems: [URLQueryItem] = [],
                    completion: @escaping (Result<T, Error>) -> Void) where T: Decodable {
        var components = URLComponents(string: path)
        components?.queryItems = queryItems
        guard let url = components?.url else {
            completion(.failure(APIError.path))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.setDefaultAzureHeaders(auth: auth)
        request.httpBody = httpBody

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
            guard let decoding = try? JSONDecoder().decode(T.self, from: data) else {
                completion(.failure(APIError.decoding))
                return
            }
            completion(.success(decoding))
        }.resume()
    }
}
