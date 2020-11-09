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

    func viewIsReady() {
        do {
            try interactor?.loadHistory()
            contentViewController?.reload()
        } catch let error {
            contentViewController?.showError(error: error)
        }
    }

    // MARK: - Private functions
}

extension HistoryPresenter: HistoryModule {
}

extension HistoryPresenter: HistoryViewToPresenter {

    var itemsCount: Int {
        return interactor?.itemsCount ?? 0
    }

    func item(at indexPath: IndexPath) -> History {
        return interactor!.item(at: indexPath)
    }

    func didSelectItem(at indexPath: IndexPath) {
        let item = interactor!.item(at: indexPath)
        delegate?.didSelect(historyItem: item)
    }

    func didSearch() {
        do {
            try interactor?.update(filter: contentViewController?.searchText ?? "")
            contentViewController?.reload()
        } catch let error {
            contentViewController?.showError(error: error)
        }
    }

    func deleteAllButtonTap() {
        do {
            try interactor?.deleteAll()
            contentViewController?.reload()
        } catch let error {
            contentViewController?.showError(error: error)
        }
    }
}

extension HistoryPresenter: HistoryInteractorToPresenter {

    func historyDidChange() {
        contentViewController?.reload()
    }
}
