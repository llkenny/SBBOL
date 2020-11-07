//
//  RootInteractor.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation

final class RootInteractor {

    // MARK: - Constants

    private let model: RootInputModel
    private let languageAPIService: LanguageAPIService = AzureLanguageAPIService()

    // MARK: - Construction

    init(model: RootInputModel) {
        self.model = model
    }

    // MARK: - Functions
}

extension RootInteractor: RootPresenterToInteractor {

    func fetchLanguages(completion: @escaping (Result<AzureLanguageResponse, Error>) -> Void) {
        languageAPIService.fetch(completion: completion)
    }
}
