//
//  LanguageSelectorInteractor.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 06.11.2020.
//

import Foundation
import CoreData

final class LanguageSelectorInteractor {

    // MARK: - Constants

    private let model: LanguageSelectorInputModel
    private let coreDataService: CoreDataService

    private var context: NSManagedObjectContext {
        return coreDataService.persistentContainer.viewContext
    }

    // MARK: - Construction

    init(model: LanguageSelectorInputModel, coreDataService: CoreDataService = CoreDataService.shared) {
        self.model = model
        self.coreDataService = coreDataService
    }

    // MARK: - Functions
}

extension LanguageSelectorInteractor: LanguageSelectorPresenterToInteractor {

    func loadLanguages() throws -> [Language] {
        let request = NSFetchRequest<Language>(entityName: CoreDataService.Constants.languageEntityName)
        return try context.fetch(request)
    }
}
