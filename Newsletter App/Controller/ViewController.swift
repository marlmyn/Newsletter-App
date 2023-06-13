//
//  ViewController.swift
//  Newsletter App
//
//  Created by Akmaral Ergesh on 15.03.2023.
//

import UIKit

class ViewController: UIViewController {

    var articlesList = [ArticleData]()
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData(){
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=US&apiKey=69b295a20cb24d01a572e6b164064287")
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error Occured While Accessing Datawith URL")
            return
        }
            var newsFullList: NewsData?
            do {
                newsFullList = try JSONDecoder().decode(NewsData.self, from: data)
            } catch {
                print("Error Occured While Decoding JSON into Swift Structure \(error)")
            }
            self.articlesList = newsFullList!.articles
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        dataTask.resume()
    }
}

extension UIImageView
{
    func downloadImage(from url: URL){
        contentMode = .scaleToFill
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                  let data = data, error == nil,
                  let image = UIImage(data: data)
            else {
                return
            }
            DispatchQueue.main.async {
                self.image = image
            }
        }
        dataTask.resume()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        if articlesList[indexPath.row].author != nil {
            cell.authorLbl.text = "Author: \(articlesList[indexPath.row].author!)"
        } else {
            cell.authorLbl.text = "No Author Available!"
        }
        cell.titleLbl.text = articlesList[indexPath.row].title
        if articlesList[indexPath.row].urlToImage != nil {
            let url = URL(string: articlesList[indexPath.row].urlToImage!)
            cell.myImageView.downloadImage(from: url!)
            cell.myImageView.contentMode = .scaleToFill
        } else {
            cell.myImageView.image = UIImage(named: "emptyImage")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewsContentHome") as? NewsContentHome
        vc?.myNewsContent = articlesList[indexPath.row]
        navigationController?.pushViewController(vc!, animated: true)
    }
    
}
