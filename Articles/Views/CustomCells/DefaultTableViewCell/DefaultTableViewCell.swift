//
//  DefaultTableViewCell.swift
//  Articles
//
//  Created by Yogesh Bharate on 01/07/20.
//  Copyright © 2020 Yogesh Bharate. All rights reserved.
//

import UIKit

class DefaultTableViewCell: UITableViewCell {
  // MARK: - IBOutlet
  @IBOutlet weak var contentLabel: UILabel!
  
  // MARK: - Methods
  func configureCell(_ text: String) {
    contentLabel.text = text
  }
}
