//
//  ActivityIndicator.swift
//  Articles
//
//  Created by Yogesh Bharate on 01/07/20.
//  Copyright © 2020 Yogesh Bharate. All rights reserved.
//

import UIKit

class ActivityIndicator {
  
  // MARK: - Variables
  var container = UIView()
  var loadingView = UIView()
  var activityIndicator = UIActivityIndicatorView()
  
  // MARK: - Constants
  static let shared = ActivityIndicator()
  
  // MARK: - Methods
  private init() {
    debugPrint("Private method")
  }
  
  func start(_ superView: UIView) {
    superView.endEditing(true)
    container.frame = superView.frame
    container.center = superView.center
    container.backgroundColor = Utils.ColorFromHex(rgbValue: 0x000000, alpha: 0.3)
    
    loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
    loadingView.center = superView.center
    loadingView.backgroundColor = Utils.ColorFromHex(rgbValue: 0x444444, alpha: 0.7)
    loadingView.clipsToBounds = true
    loadingView.layer.cornerRadius = 10
    
    activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
    activityIndicator.style = .whiteLarge
    activityIndicator.center = CGPoint(x: loadingView.frame.size.width/2, y: loadingView.frame.size.height/2)
    
    loadingView.addSubview(activityIndicator)
    container.addSubview(loadingView)
    superView.addSubview(container)
    activityIndicator.startAnimating()
  }
  
  func stop(_ superview: UIView) {
    superview.endEditing(false)
    activityIndicator.stopAnimating()
    container.removeFromSuperview()
  }
}
