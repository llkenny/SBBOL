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

    private var sourceLangugage: Language?
    private var destinationLanguage: Language?

    // MARK: - Construction

    init(contentViewController: TranslatePresenterToView, router: TranslatePresenterToRouter, interactor: TranslatePresenterToInteractor, inputModel: TranslateInputModel, delegate: TranslateDelegate) {
        self.contentViewController = contentViewController
        self.router = router
        self.interactor = interactor
        self.inputModel = inputModel
        self.delegate = delegate
    }

    // MARK: - Private functions

    private func translate() {
        guard let text = contentViewController?.currentText, !text.isEmpty else {
            contentViewController?.showTranslation(text: "")
            return
        }
        contentViewController?.update(isLoading: true)
        // TODO: Provide defaut "to" value
        let from = sourceLangugage?.code
        let to = destinationLanguage?.code ?? "en"
        interactor?.translate(text: text, from: from, to: to) { [weak self] result in
            guard let self = self else { return }
            self.contentViewController?.update(isLoading: false)
            switch result {
            case .success(let response):
                // TODO: Provide error if doesn't exist
                let translation = response.first?.translations.first?.text ?? ""
                self.contentViewController?.showTranslation(text: translation)
                self.interactor?.save(text: text, translation: translation, sourceLanguage: self.sourceLangugage, destinationLanguage: self.destinationLanguage)
            case .failure(let error):
                // TODO: Show error
                debugPrint(error)
            }
        }
    }
}

extension TranslatePresenter: TranslateModule {

    func show(historyItem: History) {
        guard let contentViewController = contentViewController else { return }
        contentViewController.currentText = historyItem.text
        contentViewController.currentTranslation = historyItem.translation

        sourceLangugage = historyItem.sourceLanguage
        destinationLanguage = historyItem.destinationLanguage

        if let sourceLanguage = sourceLangugage {
            contentViewController.change(language: sourceLanguage, for: .source)
            // TODO: Make fallback to default language
        }

        if let destinationLanguage = destinationLanguage {
            contentViewController.change(language: destinationLanguage, for: .destination)
            // TODO: Make fallback to default language
        }
    }

    func didSelect(language: Language, type: LanguageSelectorType) {
        switch type {
        case .source:
            sourceLangugage = language
        case .destination:
            destinationLanguage = language
        }
        contentViewController?.change(language: language, for: type)
        translate()
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
        guard let contentViewController = contentViewController else { return }
        guard let sourceLangugage = sourceLangugage, let destinationLanguage = destinationLanguage else { return }
        self.sourceLangugage = destinationLanguage
        self.destinationLanguage = sourceLangugage
        contentViewController.change(language: sourceLangugage, for: .destination)
        contentViewController.change(language: destinationLanguage, for: .source)
        contentViewController.currentText = contentViewController.currentTranslation
        translate()
    }

    func destinationButtonTap() {
        router?.navigate(to: .languageSelector(type: .destination), completion: nil)
    }

    func didEnterText() {
        translate()
    }
}
