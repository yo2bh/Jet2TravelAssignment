//
//  ArticleModels.swift
//  Articles
//
//  Created by Yogesh Bharate on 29/06/20.
//  Copyright © 2020 Yogesh Bharate. All rights reserved.
//

import Foundation

struct Articles: Codable {
  let content: String
  let comments, likes: Int
  let media: [Media]
  let user: [User]
}

struct Media: Codable {
  let image, title, url: String
}

struct User: Codable {
  let createdAt, name, avatar, lastname, designation: String
}
