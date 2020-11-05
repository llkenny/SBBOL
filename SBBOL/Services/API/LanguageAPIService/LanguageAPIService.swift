//
//  LanguageAPIService.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 05.11.2020.
//

protocol LanguageAPIService {

    /// Getting a dictionary of supported languages
    /// - Parameter completion: Supported languages or error
    func fetch(completion: @escaping (Result<AzureLanguageResponse, Error>) -> Void)
}
