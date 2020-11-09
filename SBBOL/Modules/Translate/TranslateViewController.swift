//
//  TranslateViewController.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import UIKit

final class TranslateViewController: UIViewController {

    // MARK: - Constants

    // MARK: - Properties

    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var inputPlaceholderLabel: UILabel!
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var sourceButton: UIButton!
    @IBOutlet weak var destinationButton: UIButton!

    weak var presenter: TranslateViewToPresenter?

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        localize()
        inputTextView.delegate = self
        tabBarItem.image = UIImage(systemName: "a.circle.fill")
    }

    // MARK: - IBActions

    @IBAction func sourceButtonTap(_ sender: Any) {
        presenter?.sourceButtonTap()
    }

    @IBAction func swapButtonTap(_ sender: Any) {
        presenter?.swapButtonTap()
    }

    @IBAction func destinationButtonTap(_ sender: Any) {
        presenter?.destinationButtonTap()
    }

    // MARK: - Functions

    // MARK: - Private functions

    private func localize() {
    }
}

extension TranslateViewController: TranslatePresenterToView {

    var currentText: String? {
        get {
            return inputTextView.text
        } set {
            inputTextView.text = newValue
        }
    }

    var currentTranslation: String? {
        get {
            return outputTextView.text
        } set {
            outputTextView.text = newValue
        }
    }

    func showTranslation(text: String) {
        outputTextView.text = text
    }

    func change(language: Language, for type: LanguageSelectorType) {
        let button: UIButton
        switch type {
        case .source:
            button = sourceButton
        case .destination:
            button = destinationButton
        }
        button.setTitle(language.name, for: .normal)
    }
}

extension TranslateViewController: TranslateControllerToRouter {

    func present(controller: LanguageSelectorViewController) {
        present(controller, animated: true)
    }
}

extension TranslateViewController: UITextViewDelegate {

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.endEditing(true)
            return false
        }
        return true
    }

    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        inputPlaceholderLabel.isHidden = true
        return true
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        inputPlaceholderLabel.isHidden = textView.text?.isEmpty == false
        presenter?.didEnterText()
    }
}

extension TranslateViewController: AbleToShowActivityIndicator {}
extension TranslateViewController: AbleToShowError {}
