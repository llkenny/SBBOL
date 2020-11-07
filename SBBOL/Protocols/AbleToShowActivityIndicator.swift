//
//  AbleToShowActivityIndicator.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 07.11.2020.
//

import UIKit

protocol AbleToShowActivityIndicator {

    var loadingView: UIView! { get }
    var activityIndicator: UIActivityIndicatorView! { get }

    func update(isLoading: Bool)
}

extension AbleToShowActivityIndicator where Self: UIViewController {

    func update(isLoading: Bool) {
        loadingView.isHidden = !isLoading
        isLoading ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
}
