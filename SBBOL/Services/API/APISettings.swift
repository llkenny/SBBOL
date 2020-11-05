//
//  APISettings.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 05.11.2020.
//

import Foundation

struct APISettings {

    static let azureTranslateToken = "a2941fe5550b4db9bafb3139dffb8540"

    static var defaultSession: URLSession {
        return URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
}
