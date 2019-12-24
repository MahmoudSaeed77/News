//
//  Article.swift
//  News App
//
//  Created by Mohamed Ibrahem on 10/8/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import Foundation
import ObjectMapper

class Article: Mappable {
    
    @objc dynamic var title: String = ""
    @objc dynamic var imageUrl: String = ""
    @objc dynamic var URL: String = ""
    @objc dynamic var author: String = ""
    @objc dynamic var description: String = ""
    @objc dynamic var publishedAt: String = ""
    @objc dynamic var content: String = ""
    
    func mapping(map: Map) {
        title <- map["title"]
        imageUrl <- map["urlToImage"]
        URL <- map["url"]
        author <- map["author"]
        description <- map["description"]
        publishedAt <- map["publishedAt"]
        content <- map["content"]
    }
    required convenience init?(map: Map) {
        self.init()
    }
    
    
}
