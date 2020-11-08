//
//  LanguageSelectorTableViewCell.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 06.11.2020.
//

import UIKit

final class LanguageSelectorTableViewCell: UITableViewCell {

    @IBOutlet weak var languageLabel: UILabel!

    func config(text: String) {
        languageLabel.text = text
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let weight: UIFont.Weight = selected ? .bold : .regular
        languageLabel.font = UIFont.systemFont(ofSize: 16, weight: weight)
    }
}
