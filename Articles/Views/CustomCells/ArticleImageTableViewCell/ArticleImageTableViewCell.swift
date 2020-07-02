//
//  ArticleImageTableViewCell.swift
//  Articles
//
//  Created by Yogesh Bharate on 01/07/20.
//  Copyright © 2020 Yogesh Bharate. All rights reserved.
//

import UIKit

class ArticleImageTableViewCell: UITableViewCell {
  // MARK: - IBOutlets
  @IBOutlet weak var articleImage: UIImageView!
  
  //MARK: - Methods
  func configureCell(_ imageUrl: String, _ row: Int) {
    // Show the empty image as place holder till the image download
    articleImage.image = UIImage()
    setArticleImage(imageUrl, row)
  }
  
  func setArticleImage(_ url: String, _ row: Int) {
    if let fileName = getFileName(url),
      let image = Utils.getSavedImage(named: fileName) {
      DispatchQueue.main.async { [weak self] in
        if self?.tag == row {
         self?.articleImage.image = image
        }
      }
    } else {
      downloadImage(url, row)
    }
  }
  
  func downloadImage(_ url: String, _ row: Int) {
    NetworkManager.shared.sendRequest(urlString: url) {[weak self](data, error) in
      if let data = data,
        let fileName = self?.getFileName(url),
        let path = Utils.saveImage(data, fileName) {
        debugPrint("Article image save at location \(path)")
        DispatchQueue.main.async {[weak self] in
          if self?.tag == row {
            self?.articleImage.image = UIImage(data: data)
          }
        }
      }  else if let error = error {
        debugPrint("Error while downloading article image - \(error.localizedDescription)")
      }
    }
  }
  
  private func getFileName(_ url: String) -> String? {
    let splitArray = Utils.splitString(input: url, separatedBy: Constants.forwardSlash)
    return splitArray.count == 8 ? splitArray[6] + Constants.underScore + splitArray[7] : nil
  }
}
