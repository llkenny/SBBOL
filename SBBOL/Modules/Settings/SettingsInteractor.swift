//
//  SettingsInteractor.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation

final class SettingsInteractor {

    // MARK: - Constants

    private let model: SettingsInputModel

    // MARK: - Construction

    init(model: SettingsInputModel) {
        self.model = model
    }

    // MARK: - Functions
}

extension SettingsInteractor: SettingsPresenterToInteractor {
}
