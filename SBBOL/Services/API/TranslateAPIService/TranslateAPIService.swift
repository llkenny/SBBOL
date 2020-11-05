//
//  TranslateAPIService.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 05.11.2020.
//

protocol TranslateAPIService {

    /// Text translation
    /// - Parameters:
    ///   - text: Text to translate
    ///   - to: Destination language code
    ///   - completion: Translation or error
    func translate(text: String, to: String, completion: @escaping (Result<[AzureTranslateResponse], Error>) -> Void)
}
