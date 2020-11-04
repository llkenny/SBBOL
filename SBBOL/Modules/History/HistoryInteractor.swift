//
//  HistoryInteractor.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation

final class HistoryInteractor {

    // MARK: - Constants

    private let model: HistoryInputModel

    // MARK: - Construction

    init(model: HistoryInputModel) {
        self.model = model
    }

    // MARK: - Functions
}

extension HistoryInteractor: HistoryPresenterToInteractor {
}
