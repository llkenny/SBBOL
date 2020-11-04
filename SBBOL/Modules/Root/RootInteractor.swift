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

    // MARK: - Construction

    init(model: RootInputModel) {
        self.model = model
    }

    // MARK: - Functions
}

extension RootInteractor: RootPresenterToInteractor {
}
