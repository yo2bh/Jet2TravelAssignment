//
//  ArticlesTableViewCell.swift
//  Articles
//
//  Created by Yogesh Bharate on 28/06/20.
//  Copyright © 2020 Yogesh Bharate. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
  // MARK: - IBOutlets
  @IBOutlet weak var avatar: UIImageView!
  @IBOutlet weak var username: UILabel!
  @IBOutlet weak var designation: UILabel!
  @IBOutlet weak var createAt: UILabel!
  
  // MARK: - Variables
  var userDataSource: User!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configureCellImage()
  }
  
  func configureCellImage() {
    avatar.layer.cornerRadius = 22.5
    avatar.layer.borderWidth = 1.0
    avatar.layer.borderColor = UIColor.gray.cgColor
  }
  
  func configureCell(_ dataSource: User, _ row: Int) {
    username.text = dataSource.name + Constants.singleSpace + dataSource.lastname
    designation.text = dataSource.designation
    createAt.text = Utils.splitString(input: dataSource.createdAt, separatedBy: Constants.dataSeparator).first
    setUserAvatar(dataSource.avatar, row)
  }
  
  private func setUserAvatar(_ url: String, _ row: Int) {
    if let fileName = getFileName(url),
      let image = Utils.getSavedImage(named: fileName) {
      DispatchQueue.main.async { [weak self] in
        if self?.tag == row {
         self?.avatar.image = image
        }
      }
    } else {
      downloadImage(url, row)
    }
  }
  
  private func downloadImage(_ url: String, _ row: Int) {
    NetworkManager.shared.sendRequest(urlString: url) {[weak self](data, error) in
      if let data = data,
        let fileName = self?.getFileName(url),
        let path = Utils.saveImage(data, fileName) {
        debugPrint("User avatar save at location \(path)")
        DispatchQueue.main.async {[weak self] in
          if self?.tag == row {
            self?.avatar.image = UIImage(data: data)
          }
        }
      }  else if let error = error {
        debugPrint("Error while downloading user avatar - \(error.localizedDescription)")
      }
    }
  }
  
  private func getFileName(_ url: String) -> String? {
    let splitArray = Utils.splitString(input: url, separatedBy: Constants.forwardSlash)
    return splitArray.count == 8 ? splitArray[6] + Constants.underScore + splitArray[7] : nil
  }
}
