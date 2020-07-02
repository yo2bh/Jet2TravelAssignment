//
//  Utilities.swift
//  Articles
//
//  Created by Yogesh Bharate on 01/07/20.
//  Copyright © 2020 Yogesh Bharate. All rights reserved.
//

import UIKit

class Utils {
  static func ColorFromHex(rgbValue: UInt32, alpha: Double = 1.0) -> UIColor {
      let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
      let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
      let blue = CGFloat(rgbValue & 0xFF)/256.0
      return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
  }
  
  static func splitString(input string: String, separatedBy character: String) -> [String] {
    return string.components(separatedBy: character)
  }
  
  static func saveImage(_ data: Data, _ fileName: String) -> String? {
    guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) else {
      return nil
    }
    
    do {
      try data.write(to: directory.appendingPathComponent(fileName))
      let path = directory.absoluteString + fileName
      return path
    } catch let error {
      debugPrint(error.localizedDescription)
      return nil
    }
  }
  
  static func getSavedImage(named: String) -> UIImage? {
      if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
          return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
      }
      return nil
  }
}
