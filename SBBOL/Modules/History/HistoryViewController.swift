//
//  HistoryViewController.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import UIKit

final class HistoryViewController: UIViewController {

    // MARK: - Constants

    enum Constants {

        static let cellIdentifier = "cell"
    }

    // MARK: - Properties
    weak var presenter: HistoryViewToPresenter?
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        localize()
        configTableView()
        tabBarItem.image = UIImage(systemName: "tray.full")
    }

    // MARK: - IBActions

    @IBAction func deleteAll(_ sender: Any) {
        presenter?.deleteAllButtonTap()
    }

    // MARK: - Functions

    // MARK: - Private functions

    private func localize() {
    }

    private func configTableView() {
        let nib = UINib(nibName: String(describing: HistoryTableViewCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Constants.cellIdentifier)
        tableView.tableFooterView = UIView()
    }
}

extension HistoryViewController: HistoryPresenterToView {

    var searchText: String? {
        return searchBar.text
    }

    func reload() {
        tableView.reloadData()
    }
}

extension HistoryViewController: HistoryControllerToRouter {
}

extension HistoryViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.itemsCount ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! HistoryTableViewCell
        let item = presenter?.item(at: indexPath)
        cell.config(text: item?.text, translation: item?.translation)
        return cell
    }
}

extension HistoryViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectItem(at: indexPath)
    }
}

extension HistoryViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        presenter?.didSearch()
    }
}

extension HistoryViewController: AbleToShowError {}
