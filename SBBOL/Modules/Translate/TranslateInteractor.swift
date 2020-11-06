//
//  TranslateInteractor.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation

final class TranslateInteractor {

    // MARK: - Constants

    // MARK: - Properties

    private let model: TranslateInputModel
    private let translateAPIService: TranslateAPIService = AzureTranslateAPIService()
    private let languageAPIService: LanguageAPIService = AzureLanguageAPIService()

    // MARK: - Construction

    init(model: TranslateInputModel) {
        self.model = model
    }

    // MARK: - Functions
}

extension TranslateInteractor: TranslatePresenterToInteractor {

    func translate(text: String, to: String, completion: @escaping (Result<[AzureTranslateResponse], Error>) -> Void) {
        translateAPIService.translate(text: text, to: to, completion: completion)
    }

    func fetch(completion: @escaping (Result<AzureLanguageResponse, Error>) -> Void) {
        languageAPIService.fetch(completion: completion)
    }
}
