//
//  SettingsViewController.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import UIKit

final class SettingsViewController: UIViewController {

    // MARK: - Constants

    // MARK: - Properties

    weak var presenter: SettingsViewToPresenter?

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        localize()
        tabBarItem.image = UIImage(systemName: "seal.fill")
    }

    // MARK: - IBActions

    // MARK: - Functions

    // MARK: - Private functions

    private func localize() {
    }
}

extension SettingsViewController: SettingsPresenterToView {
}

extension SettingsViewController: SettingsControllerToRouter {
}
