//
//  LanguageSelectorInteractor.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 06.11.2020.
//

import Foundation

final class LanguageSelectorInteractor {

    // MARK: - Constants

    private let model: LanguageSelectorInputModel

    // MARK: - Construction

    init(model: LanguageSelectorInputModel) {
        self.model = model
    }

    // MARK: - Functions
}

extension LanguageSelectorInteractor: LanguageSelectorPresenterToInteractor {
}
