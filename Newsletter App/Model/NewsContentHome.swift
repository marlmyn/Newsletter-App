//
//  NewsContentHome.swift
//  Newsletter App
//
//  Created by Akmaral Ergesh on 16.03.2023.
//

import UIKit

class NewsContentHome: UIViewController {
    
    @IBOutlet var titleNews: UILabel!
    @IBOutlet var newsContent: UILabel!
    @IBOutlet var newImage: UIImageView!
    var myNewsContent:ArticleData = ArticleData(author: "", title: "", urlToImage: "", content: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        titleNews.text = myNewsContent.title
        if myNewsContent.urlToImage != nil {
            let url = URL(string: myNewsContent.urlToImage!)
            newImage.downloadImage(from: url!)
            newImage.contentMode = .scaleToFill
        } else {
            newImage.image = UIImage(named: "emptyImage")
        }
        newsContent.text = myNewsContent.content
    }
    

}
