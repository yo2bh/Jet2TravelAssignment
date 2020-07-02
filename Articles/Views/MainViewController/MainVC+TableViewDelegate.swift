//
//  MainVC+TableViewDelegate.swift
//  Articles
//
//  Created by Yogesh Bharate on 30/06/20.
//  Copyright © 2020 Yogesh Bharate. All rights reserved.
//

import UIKit

// MARK: - Table view delegate methods
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    return articlesDataSource.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 6
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let row = indexPath.row
    let section = indexPath.section
    
    switch row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: Constants.userCell) as? UserTableViewCell
      cell?.configureCell(articlesDataSource[section].user[0], row)
      cell?.tag = row
      return cell!
      
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: Constants.articleCell) as? ArticleImageTableViewCell
      cell?.configureCell(articlesDataSource[section].media[0].image, row)
      cell?.tag = row
      return cell!
      
    case 2, 3, 4:
      let cell = tableView.dequeueReusableCell(withIdentifier: Constants.defaultCell) as? DefaultTableViewCell
      cell?.configureCell(getContentText(section, row))
      
      return cell!
      
    case 5:
      let cell = tableView.dequeueReusableCell(withIdentifier: Constants.likesCommentsCell) as? LikeCommentTableViewCell
      cell?.configureCell(articlesDataSource[section].likes, articlesDataSource[section].comments)
      
      return cell!
      
    default:
      debugPrint("Invalid Row")
    }
    
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let row = indexPath.row
    switch row {
    case 0:
      return 65
    case 1:
      return articlesDataSource[indexPath.section].media[0].image.isEmpty ? 0 : 200
    case 2, 3, 4:
      tableView.estimatedRowHeight = 200
      return UITableView.automaticDimension
    default:
      return 44
    }
  }
  
  func getContentText(_ section: Int, _ row: Int) -> String {
    switch row {
    case 2:
      return articlesDataSource[section].content
    case 3:
      return articlesDataSource[section].media.first?.title ?? Constants.emptySpace
    case 4:
      return articlesDataSource[section].media.first?.url ?? Constants.emptySpace
    default:
      debugPrint("Invalid Choice")
    }
    return Constants.emptySpace
  }
  
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    let footerView = UIView()
    let separatorView = UIView(frame: CGRect(x: tableView.separatorInset.left, y: footerView.frame.height, width: tableView.frame.width - tableView.separatorInset.right - tableView.separatorInset.left - 20, height: 1))
    separatorView.backgroundColor = UIColor.separator
    footerView.addSubview(separatorView)
    return footerView
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 1
  }
}
