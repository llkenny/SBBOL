//
//  SettingsPresenter.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation

final class SettingsPresenter {

    // MARK: - Properties

    private weak var contentViewController: SettingsPresenterToView?
    private weak var router: SettingsPresenterToRouter?
    private weak var interactor: SettingsPresenterToInteractor?
    private weak var delegate: SettingsDelegate?
    private var inputModel: SettingsInputModel

    // MARK: - Construction

    init(contentViewController: SettingsPresenterToView, router: SettingsPresenterToRouter, interactor: SettingsPresenterToInteractor, inputModel: SettingsInputModel, delegate: SettingsDelegate) {
        self.contentViewController = contentViewController
        self.router = router
        self.interactor = interactor
        self.inputModel = inputModel
        self.delegate = delegate
    }

    // MARK: - Functions
}

extension SettingsPresenter: SettingsModule {
}

extension SettingsPresenter: SettingsViewToPresenter {
}
