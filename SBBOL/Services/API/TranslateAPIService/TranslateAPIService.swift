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
    ///   - from: Source language code
    ///   - to: Destination language code
    ///   - completion: Translation or error
    func translate(text: String, from: String?, to: String, completion: @escaping (Result<[AzureTranslateResponse], Error>) -> Void)
}
