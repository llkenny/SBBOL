//
//  TranslateRouter.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation

enum TranslateNavigation {

    case languageSelector(type: LanguageSelectorType)
}

typealias TranslateRouterClosure = (() -> Void)

final class TranslateRouter {

    // MARK: - Properties

    private weak var contentViewController: TranslateControllerToRouter?
    private(set) var languageSelectorAssembly: LanguageSelectorAssembly?
    unowned var module: TranslateModule!

    // MARK: - Construction

    init(contentViewController: TranslateControllerToRouter) {
        self.contentViewController = contentViewController
    }

    // MARK: - Functions

    func presentLanguageSelector(type: LanguageSelectorType) {
        let languageSelectorAssembly = LanguageSelectorAssembly(inputModel: LanguageSelectorInputModel(type: type), delegate: module)
        contentViewController?.present(controller: languageSelectorAssembly.contentViewController)
        self.languageSelectorAssembly = languageSelectorAssembly
    }
}

extension TranslateRouter: TranslatePresenterToRouter {

    func navigate(to destination: TranslateNavigation, completion: TranslateRouterClosure? = nil) {
        switch destination {
        case .languageSelector(let type):
            presentLanguageSelector(type: type)
        }
    }
}
