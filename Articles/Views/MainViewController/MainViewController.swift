//
//  ViewController.swift
//  Articles
//
//  Created by Yogesh Bharate on 28/06/20.
//  Copyright © 2020 Yogesh Bharate. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  // MARK: - IBOutlets
  @IBOutlet weak var tableView: UITableView!
  
  
  // MARK: - Variables
  fileprivate var mainViewModel = MainViewModel()
  var articlesDataSource = [Articles]()

  override func viewDidLoad() {
    super.viewDidLoad()
    registerCustomCell()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    tableView.isHidden = true
    ActivityIndicator.shared.start(view)
    self.mainViewModel.getArticles(success: gotResponse(_:), failure: gotFailure(_:))
    print("Appear")
  }
  
  func registerCustomCell() {
    let userXib = UINib(nibName: "UserTableViewCell", bundle: nil)
    tableView.register(userXib, forCellReuseIdentifier: Constants.userCell)
    let articleImageXib = UINib(nibName: "ArticleImageTableViewCell", bundle: nil)
    tableView.register(articleImageXib, forCellReuseIdentifier: Constants.articleCell)
    let defaultCellXib = UINib(nibName: "DefaultTableViewCell", bundle: nil)
    tableView.register(defaultCellXib, forCellReuseIdentifier: Constants.defaultCell)
    let likesCommentsXib = UINib(nibName: "LikeCommentTableViewCell", bundle: nil)
    tableView.register(likesCommentsXib, forCellReuseIdentifier: Constants.likesCommentsCell)
  }
  
  func gotResponse(_ response: [Articles]) {
    DispatchQueue.main.async {[weak self] in
      self?.tableView.isHidden = false
      ActivityIndicator.shared.stop((self?.view)!)
      self?.articlesDataSource = response
      self?.tableView.reloadData()
    }
  }
  
  func gotFailure(_ error: String) {
    print(error)
  }
}

