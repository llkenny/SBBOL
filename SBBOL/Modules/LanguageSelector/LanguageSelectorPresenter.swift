//
//  LanguageSelectorPresenter.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 06.11.2020.
//

import Foundation

final class LanguageSelectorPresenter {

    // MARK: - Properties

    private weak var contentViewController: LanguageSelectorPresenterToView?
    private weak var router: LanguageSelectorPresenterToRouter?
    private weak var interactor: LanguageSelectorPresenterToInteractor?
    private weak var delegate: LanguageSelectorDelegate?
    private var inputModel: LanguageSelectorInputModel

    // MARK: - Construction

    init(contentViewController: LanguageSelectorPresenterToView, router: LanguageSelectorPresenterToRouter, interactor: LanguageSelectorPresenterToInteractor, inputModel: LanguageSelectorInputModel, delegate: LanguageSelectorDelegate) {
        self.contentViewController = contentViewController
        self.router = router
        self.interactor = interactor
        self.inputModel = inputModel
        self.delegate = delegate
    }

    // MARK: - Functions
}

extension LanguageSelectorPresenter: LanguageSelectorModule {
}

extension LanguageSelectorPresenter: LanguageSelectorViewToPresenter {

    func closeButtonTap(sender: LanguageSelectorViewController) {
        delegate?.close(controller: sender)
    }
}
