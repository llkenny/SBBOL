//
//  TranslatePresenter.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation

final class TranslatePresenter {

    // MARK: - Properties

    private weak var contentViewController: TranslatePresenterToView?
    private weak var router: TranslatePresenterToRouter?
    private weak var interactor: TranslatePresenterToInteractor?
    private weak var delegate: TranslateDelegate?
    private var inputModel: TranslateInputModel

    // MARK: - Construction

    init(contentViewController: TranslatePresenterToView, router: TranslatePresenterToRouter, interactor: TranslatePresenterToInteractor, inputModel: TranslateInputModel, delegate: TranslateDelegate) {
        self.contentViewController = contentViewController
        self.router = router
        self.interactor = interactor
        self.inputModel = inputModel
        self.delegate = delegate
    }

    // MARK: - Functions
}

extension TranslatePresenter: TranslateModule {
}

extension TranslatePresenter: TranslateViewToPresenter {

    func didEnter(text: String?) {
        guard let text = text, !text.isEmpty else {
            contentViewController?.showTranslation(text: "")
            return
        }
        // TODO: activity indicator
        // TODO: Provide to
        interactor?.translate(text: text, to: "es") { result in
            switch result {
            case .success(let response):
                // TODO: Provide error if doesn't exist
                let translation = response.first?.translations.first?.text ?? ""
                self.contentViewController?.showTranslation(text: translation)
            case .failure(let error):
                // TODO: Show error
                debugPrint(error)
            }
        }
    }
}
