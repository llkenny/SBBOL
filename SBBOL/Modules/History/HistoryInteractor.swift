//
//  HistoryInteractor.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation
import CoreData

final class HistoryInteractor: NSObject {

    // MARK: - Constants

    // MARK: - Properties

    weak var presenter: HistoryInteractorToPresenter?
    private let model: HistoryInputModel
    let coreDataService: CoreDataService
    private var fetchedResultsController: NSFetchedResultsController<History>!

    // MARK: - Construction

    init(model: HistoryInputModel, coreDataService: CoreDataService = CoreDataService.shared) {
        self.model = model
        self.coreDataService = coreDataService
        super.init()
        configFetchedResultsController()
    }

    // MARK: - Private functions

    private func configFetchedResultsController() {
        let request = NSFetchRequest<History>(entityName: CoreDataService.Constants.historyEntityName)
        request.sortDescriptors = []
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
    }
}

extension HistoryInteractor: HistoryPresenterToInteractor {

    var itemsCount: Int {
        return fetchedResultsController.sections?.first?.numberOfObjects ?? 0
    }

    func item(at indexPath: IndexPath) -> History {
        return fetchedResultsController.object(at: indexPath)
    }

    func loadHistory() throws {
        try fetchedResultsController.performFetch()
    }

    func deleteAll() throws {
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: CoreDataService.Constants.historyEntityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        try coreDataService.persistentContainer.persistentStoreCoordinator.execute(deleteRequest, with: context)
    }

    func update(filter: String) throws {
        if filter.isEmpty {
            fetchedResultsController.fetchRequest.predicate = nil
        } else {
            fetchedResultsController.fetchRequest.predicate = NSPredicate(format: "%K CONTAINS[c] %@ OR %K CONTAINS[c] %@", #keyPath(History.text), filter, #keyPath(History.translation), filter)
        }
        try loadHistory()
    }
}

extension HistoryInteractor: CoreDataTools {}

extension HistoryInteractor: NSFetchedResultsControllerDelegate {

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        presenter?.historyDidChange()
    }
}
