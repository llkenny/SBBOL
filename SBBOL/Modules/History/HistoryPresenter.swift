//
//  HistoryPresenter.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation

final class HistoryPresenter {

    // MARK: - Properties

    private weak var contentViewController: HistoryPresenterToView?
    private weak var router: HistoryPresenterToRouter?
    private weak var interactor: HistoryPresenterToInteractor?
    private weak var delegate: HistoryDelegate?
    private var inputModel: HistoryInputModel

    // MARK: - Construction

    init(contentViewController: HistoryPresenterToView, router: HistoryPresenterToRouter, interactor: HistoryPresenterToInteractor, inputModel: HistoryInputModel, delegate: HistoryDelegate) {
        self.contentViewController = contentViewController
        self.router = router
        self.interactor = interactor
        self.inputModel = inputModel
        self.delegate = delegate
    }

    // MARK: - Functions
}

extension HistoryPresenter: HistoryModule {
}

extension HistoryPresenter: HistoryViewToPresenter {
}
