//
//  RootInteractor.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation
import CoreData

final class RootInteractor {

    // MARK: - Constants

    private let model: RootInputModel
    private let languageAPIService: LanguageAPIService = AzureLanguageAPIService()
    private let coreDataService: CoreDataService

    private var context: NSManagedObjectContext {
        return coreDataService.persistentContainer.viewContext
    }

    // MARK: - Construction

    init(model: RootInputModel, coreDataService: CoreDataService = CoreDataService.shared) {
        self.model = model
        self.coreDataService = coreDataService
    }

    // MARK: - Private functions

    private func store(languages: [AzureLanguageResponse.Language]) {
        languages.forEach {
            let language = Language(context: context)
            language.code = $0.code
            language.name = $0.name
        }
        coreDataService.saveContext()
    }
}

extension RootInteractor: RootPresenterToInteractor {

    func fetchLanguages(completion: @escaping (Result<Void, Error>) -> Void) {
        let request = NSFetchRequest<Language>(entityName: CoreDataService.Constants.languageEntityName)
        do {
            let languages = try context.fetch(request)
            if languages.count == 0 {
                // If database is empty - make the request
                languageAPIService.fetch { [weak self] result in
                    switch result {
                    case .success(let response):
                        self?.store(languages: response.translation.languages)
                        completion(.success(()))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            } else {
                completion(.success(()))
            }
        } catch let error {
            completion(.failure(error))
        }
    }
}
