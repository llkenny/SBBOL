//
//  HistoryInteractor.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation
import CoreData

final class HistoryInteractor {

    // MARK: - Constants

    private let model: HistoryInputModel
    let coreDataService: CoreDataService

    // MARK: - Construction

    init(model: HistoryInputModel, coreDataService: CoreDataService = CoreDataService.shared) {
        self.model = model
        self.coreDataService = coreDataService
    }

    // MARK: - Functions
}

extension HistoryInteractor: HistoryPresenterToInteractor {

    func loadHistory() throws -> [History] {
        let request = NSFetchRequest<History>(entityName: CoreDataService.Constants.historyEntityName)
        return try context.fetch(request)
    }
}

extension HistoryInteractor: CoreDataTools {}
