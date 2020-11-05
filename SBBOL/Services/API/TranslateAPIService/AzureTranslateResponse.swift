//
//  AzureTranslateResponse.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 05.11.2020.
//

struct AzureTranslateResponse: Decodable {

    struct Language: Decodable {
        let language: String
        let score: Double
    }

    struct Translation: Decodable {
        let text: String
        let to: String
    }

    let detectedLanguage: Language
    let translations: [Translation]
}
