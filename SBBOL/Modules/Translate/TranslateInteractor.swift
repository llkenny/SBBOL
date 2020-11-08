//
//  TranslateInteractor.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation
import CoreData

final class TranslateInteractor {

    // MARK: - Constants

    // MARK: - Properties

    private let model: TranslateInputModel
    private let translateAPIService: TranslateAPIService = AzureTranslateAPIService()
    let coreDataService: CoreDataService

    // MARK: - Construction

    init(model: TranslateInputModel, coreDataService: CoreDataService = CoreDataService.shared) {
        self.model = model
        self.coreDataService = coreDataService
    }

    // MARK: - Functions
}

extension TranslateInteractor: TranslatePresenterToInteractor {

    func translate(text: String, from: String?, to: String, completion: @escaping (Result<[AzureTranslateResponse], Error>) -> Void) {
        translateAPIService.translate(text: text, from: from, to: to, completion: completion)
    }

    func save(text: String, translation: String, sourceLanguage: Language?, destinationLanguage: Language?) {
        let request = NSFetchRequest<History>(entityName: CoreDataService.Constants.historyEntityName)
        request.fetchLimit = 1

        // Create predicates
        // Same text
        let predicateText = NSPredicate(format: "%K == %@", #keyPath(History.text), text)

        // Same source language code
        let sourceCode = sourceLanguage?.code ?? "nil"
        let predicateSource = NSPredicate(format: "%K.%K == %@", #keyPath(History.sourceLanguage), #keyPath(Language.code), sourceCode)

        // Same destination language code
        let destinationCode = destinationLanguage?.code ?? "nil"
        let predicateDestination = NSPredicate(format: "%K.%K == %@", #keyPath(History.destinationLanguage), #keyPath(Language.code), destinationCode)

        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [predicateText, predicateSource, predicateDestination])
        do {
            let result = try context.fetch(request)
            // If translation already exists
            if let first = result.first {
                // If another translation -> overwrite
                if first.translation != translation {
                    first.translation = translation
                }
            } else {
                // If no translation exists -> create
                let history = History(context: context)
                history.text = text
                history.translation = translation
                history.sourceLanguage = sourceLanguage
                history.destinationLanguage = destinationLanguage
            }
            coreDataService.saveContext()
        } catch let error {
            // TODO: Handle
            debugPrint(error)
        }
    }
}

extension TranslateInteractor: CoreDataTools {}
