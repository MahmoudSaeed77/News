//
//  HomeViewController.swift
//  News App
//
//  Created by Mohamed Ibrahem on 10/8/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import Kingfisher

typealias JSONDict = [String : Any]
var selectedIndexPath = NSIndexPath()
class HomeViewController: UIViewController {
    
    var homeView: HomeView {return self.view as! HomeView}
    let cellId = "cellId"
    var articles: Array<Article> = []
    
    override func loadView() {
        super.loadView()
        self.view = HomeView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Recent News"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupTablView()
        makeRequest()

    }
    
    func setupTablView(){
        homeView.tableView.delegate = self
        homeView.tableView.dataSource = self
        homeView.tableView.register(NewsCell.self, forCellReuseIdentifier: cellId)
    }

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! NewsCell
        
        DispatchQueue.main.async {
            let article = self.articles[indexPath.row]
            cell.articleLabel.text = article.title
            cell.thumbImageView.kf.setImage(with: URL(string: article.imageUrl))
        }
        
        
        return cell
    }
}
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
//        let article = articles[indexPath.row]
        
//        if let url = URL(string: article.URL) {
//            UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        }
        
//        var index = indexPath
        selectedIndexPath = indexPath as NSIndexPath
        
        let vc = DetailVC()
        navigationController?.show(vc, sender: nil)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
extension HomeViewController {
    func makeRequest(){
        let param = [
            "country" : "us",
            "category": "business",
            "apiKey"  : "6a44c8208985423aa11c56081abc858b"
            
        ]
        
        Alamofire.request("https://newsapi.org/v2/top-headlines", method: .get, parameters: param, encoding: URLEncoding(), headers: nil).responseJSON { response in
            if let json = response.result.value as? JSONDict {
                if let articlesArray = json["articles"] as? Array<JSONDict> {
                    for articleData in articlesArray {
                        guard let article = Mapper<Article>().map(JSON: articleData) else {continue}
                        self.articles.append(article)
                    }
                }
            }
            self.homeView.tableView.reloadData()
        }
    }
}
