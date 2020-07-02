//
//  LikeCommentTableViewCell.swift
//  Articles
//
//  Created by Yogesh Bharate on 01/07/20.
//  Copyright © 2020 Yogesh Bharate. All rights reserved.
//

import UIKit

class LikeCommentTableViewCell: UITableViewCell {
  // MARK: - IBOutlets
  @IBOutlet weak var likesLabel: UILabel!
  @IBOutlet weak var commentsLabel: UILabel!
  
  // MARK:- Methods
  func configureCell(_ likes: Int, _ comments: Int) {
    likesLabel.text = convertToThousand(likes) + Constants.singleSpace + Constants.likesString
    commentsLabel.text = convertToThousand(comments) + Constants.singleSpace + Constants.commentsString
  }
  
  private func convertToThousand(_ num: Int) -> String {
    let number = Double(num)
    let thousand = number / 1000
    let million = number / 1000000
    if million >= 1.0 {
      return "\(round(million*10)/10)M"
    } else if thousand >= 1.0 {
      return "\(round(thousand*10)/10)K"
    } else {
      return "\(num)"
    }
  }
}
