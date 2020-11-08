//
//  CoreDataTools.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 08.11.2020.
//

import CoreData

protocol CoreDataTools {

    var coreDataService: CoreDataService { get }
}

extension CoreDataTools {

    var context: NSManagedObjectContext {
        return coreDataService.persistentContainer.viewContext
    }
}
