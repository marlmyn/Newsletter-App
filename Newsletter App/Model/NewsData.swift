//
//  NewsData.swift
//  Newsletter App
//
//  Created by Akmaral Ergesh on 16.03.2023.
//

import Foundation

struct NewsData: Codable{
    let status: String
    let articles: [ArticleData]
}
