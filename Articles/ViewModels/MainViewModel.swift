//
//  MainViewModel.swift
//  Articles
//
//  Created by Yogesh Bharate on 28/06/20.
//  Copyright © 2020 Yogesh Bharate. All rights reserved.
//

import Foundation

class MainViewModel {
  func getArticles(success: @escaping([Articles]) -> Void, failure: @escaping(String) -> Void) {
    NetworkManager.shared.sendRequest(urlString: Constants.urlString) {data, error in
      guard let data = data else {
        failure((error?.localizedDescription)!)
        return
      }
      
      do {
        let response = try JSONDecoder().decode([Articles].self, from: data)
        success(response)
      } catch let error {
        debugPrint(error.localizedDescription)
        failure(error.localizedDescription)
      }
    }
  }
}
