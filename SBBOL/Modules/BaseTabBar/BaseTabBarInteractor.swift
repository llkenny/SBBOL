//
//  BaseTabBarInteractor.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation

final class BaseTabBarInteractor {

    // MARK: - Constants

    private let model: BaseTabBarInputModel

    // MARK: - Construction

    init(model: BaseTabBarInputModel) {
        self.model = model
    }

    // MARK: - Functions
}

extension BaseTabBarInteractor: BaseTabBarPresenterToInteractor {
}
