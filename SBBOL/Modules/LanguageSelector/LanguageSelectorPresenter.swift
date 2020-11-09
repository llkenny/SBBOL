//
//  LanguageSelectorPresenter.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 06.11.2020.
//

import Foundation

final class LanguageSelectorPresenter {

    // MARK: - Properties

    private weak var contentViewController: LanguageSelectorPresenterToView?
    private weak var router: LanguageSelectorPresenterToRouter?
    private weak var interactor: LanguageSelectorPresenterToInteractor?
    private weak var delegate: LanguageSelectorDelegate?
    private var inputModel: LanguageSelectorInputModel
    private var languages = [Language]()

    // MARK: - Construction

    init(contentViewController: LanguageSelectorPresenterToView, router: LanguageSelectorPresenterToRouter, interactor: LanguageSelectorPresenterToInteractor, inputModel: LanguageSelectorInputModel, delegate: LanguageSelectorDelegate) {
        self.contentViewController = contentViewController
        self.router = router
        self.interactor = interactor
        self.inputModel = inputModel
        self.delegate = delegate
    }

    // MARK: - Functions

    func viewIsReady() {
        guard let interactor = interactor else { return }
        do {
            languages = try interactor.loadLanguages()
            contentViewController?.reload()
        } catch let error {
            // TODO: Show error
            debugPrint(error)
        }
    }
}

extension LanguageSelectorPresenter: LanguageSelectorModule {
}

extension LanguageSelectorPresenter: LanguageSelectorViewToPresenter {

    var itemsCount: Int {
        return languages.count
    }

    var languageTypeName: String {
        return inputModel.type.rawValue.capitalized
    }

    func closeButtonTap(sender: LanguageSelectorViewController) {
        delegate?.close(controller: sender)
    }

    func item(at indexPath: IndexPath) -> String {
        return languages[indexPath.row].name ?? ""
    }

    func didSelectItem(sender: LanguageSelectorViewController, at indexPath: IndexPath) {
        delegate?.didSelect(language: languages[indexPath.row], type: inputModel.type)
        delegate?.close(controller: sender)
    }
}
