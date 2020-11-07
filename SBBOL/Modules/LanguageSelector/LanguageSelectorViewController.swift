//
//  LanguageSelectorViewController.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 06.11.2020.
//

import UIKit

final class LanguageSelectorViewController: UIViewController {

    // MARK: - Constants

    // MARK: - Properties
    weak var presenter: LanguageSelectorViewToPresenter?
    @IBOutlet weak var customNavigationItem: UINavigationItem!

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        localize()
    }

    // TODO: TableView with selection

    // MARK: - IBActions

    @IBAction func closeButtonTap(_ sender: Any) {
        presenter?.closeButtonTap(sender: self)
    }

    // MARK: - Functions

    // MARK: - Private functions

    private func localize() {
        // TODO: Add type
        customNavigationItem.title = "Select language"
    }
}

extension LanguageSelectorViewController: LanguageSelectorPresenterToView {
}

extension LanguageSelectorViewController: LanguageSelectorControllerToRouter {
}
