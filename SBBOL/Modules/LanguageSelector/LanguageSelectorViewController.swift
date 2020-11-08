//
//  LanguageSelectorViewController.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 06.11.2020.
//

import UIKit

final class LanguageSelectorViewController: UIViewController {

    // MARK: - Constants

    enum Constants {

        static let cellIdentifier = "cell"
    }

    // MARK: - Properties
    weak var presenter: LanguageSelectorViewToPresenter?
    @IBOutlet weak var customNavigationItem: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        localize()
        configTableView()
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

    private func configTableView() {
        let nib = UINib(nibName: String(describing: LanguageSelectorTableViewCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Constants.cellIdentifier)
    }
}

extension LanguageSelectorViewController: LanguageSelectorPresenterToView {

    func reload() {
        tableView.reloadData()
    }
}

extension LanguageSelectorViewController: LanguageSelectorControllerToRouter {
}

extension LanguageSelectorViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.itemsCount ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! LanguageSelectorTableViewCell
        let item = presenter?.item(at: indexPath) ?? ""
            cell.config(text: item)
        return cell
    }
}

extension LanguageSelectorViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectItem(at: indexPath)
    }
}
