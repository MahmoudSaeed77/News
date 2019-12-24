//
//  DetailVC.swift
//  News App
//
//  Created by Mohamed Ibrahem on 10/21/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
import ObjectMapper


class DetailVC: UIViewController {
    
    var detailView: DetailView {return self.view as! DetailView}
    var articles = [Article]()
    
    override func loadView() {
        super.loadView()
        self.view = DetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(selectedIndexPath.item)
        makeRequest()
        
    }
    
}
extension DetailVC {
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
                        DispatchQueue.main.async {
                                    self.detailView.authorLabel.text = article.author
                                    self.detailView.publishDateLabel.text = article.publishedAt
                                    self.detailView.contentLabel.text = article.content
                                    self.detailView.descriptionLabel.text = article.description
                                    self.detailView.titleLabel.text = article.title
                                    self.detailView.imageView.kf.setImage(with: URL(string: article.imageUrl))
                        }
                    }
                }
            }
        }
    }
}
