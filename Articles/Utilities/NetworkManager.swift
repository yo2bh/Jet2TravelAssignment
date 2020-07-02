//
//  NetworkManager.swift
//  Articles
//
//  Created by Yogesh Bharate on 29/06/20.
//  Copyright © 2020 Yogesh Bharate. All rights reserved.
//

import Foundation

class NetworkManager {
  static let shared = NetworkManager()
  
  private init() {
    print("Initalized the network manager instance")
  }
  
  func sendRequest(urlString: String, completionHandler: @escaping(Data?, Error?) -> Void) {
    // 1. Make URL from UrlString
    let url = URL(string: urlString)
    // 2. Create the URLRequest object
    let urlRequest = URLRequest(url: url!)
    // 3. Send request - dataTask
    URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
      completionHandler(data, error)
    }.resume()
  }
}
