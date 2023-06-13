//
//  ArticleData.swift
//  Newsletter App
//
//  Created by Akmaral Ergesh on 15.03.2023.
//

import Foundation

struct ArticleData: Codable{
    let author: String?
    let title: String
    let urlToImage: String?
    let content: String?
}
