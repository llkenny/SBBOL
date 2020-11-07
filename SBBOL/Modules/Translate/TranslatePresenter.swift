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

    func didSelect(language: AzureLanguageResponse.Language) {
        // TODO:
        debugPrint(language)
    }

    func close(controller: LanguageSelectorViewController) {
        controller.dismiss(animated: true)
    }
}

extension TranslatePresenter: TranslateViewToPresenter {

    func sourceButtonTap() {
        router?.navigate(to: .languageSelector(type: .source), completion: nil)
    }

    func swapButtonTap() {
        // TODO: Swap languages
    }

    func destinationButtonTap() {
        router?.navigate(to: .languageSelector(type: .destination), completion: nil)
    }

    func didEnter(text: String?) {
        guard let text = text, !text.isEmpty else {
            contentViewController?.showTranslation(text: "")
            return
        }
        contentViewController?.update(isLoading: true)
        // TODO: Provide to
        interactor?.translate(text: text, to: "es") { result in
            self.contentViewController?.update(isLoading: false)
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
