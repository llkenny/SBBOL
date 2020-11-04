//
//  TranslateInteractor.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation

final class TranslateInteractor {

    // MARK: - Constants

    private let model: TranslateInputModel

    // MARK: - Construction

    init(model: TranslateInputModel) {
        self.model = model
    }

    // MARK: - Functions
}

extension TranslateInteractor: TranslatePresenterToInteractor {
}
