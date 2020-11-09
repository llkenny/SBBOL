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
    private var history = [History]()
    private var filtered = [History]()

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
        guard let interactor = interactor else { return }
        do {
            history = try interactor.loadHistory()
            filtered = history
            contentViewController?.reload()
        } catch let error {
            // TODO: Show error
            debugPrint(error)
        }
    }

    // MARK: - Private functions

    func performFilter() {
        // TODO: Move to background queue or use fetchedResultsController
        guard let filter = contentViewController?.searchText?.lowercased(), !filter.isEmpty else {
            filtered = history
            return
        }
        filtered = history.filter {
            $0.text?.lowercased().contains(filter) == true ||
                $0.translation?.lowercased().contains(filter) == true
        }
    }
}

extension HistoryPresenter: HistoryModule {
}

extension HistoryPresenter: HistoryViewToPresenter {

    var itemsCount: Int {
        return filtered.count
    }

    func item(at indexPath: IndexPath) -> History {
        return filtered[indexPath.row]
    }

    func didSelectItem(at indexPath: IndexPath) {
        delegate?.didSelect(historyItem: filtered[indexPath.row])
    }

    func didSearch() {
        performFilter()
        contentViewController?.reload()
    }

    func deleteAllButtonTap() {
        do {
            try interactor?.deleteAll()
            contentViewController?.reload()
        } catch let error {
            // TODO: Handle error
        }
    }
}
