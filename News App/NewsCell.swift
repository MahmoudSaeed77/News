//
//  NewsCell.swift
//  News App
//
//  Created by Mohamed Ibrahem on 10/8/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    let thumbImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "")?.withRenderingMode(.alwaysOriginal))
        imageView.backgroundColor = UIColor.blue
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let articleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This is the first article label and it is big little bit to see number of lines"
        label.numberOfLines = 0
        return label
    }()
    class func instanceFromNib() -> NewsCell {
        return UINib(nibName: "NewsCell", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! NewsCell
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cellId")
        addSubview(thumbImageView)
        addSubview(articleLabel)

        NSLayoutConstraint.activate([
            thumbImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            thumbImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            thumbImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9),
            thumbImageView.widthAnchor.constraint(equalToConstant: 65),

            articleLabel.leadingAnchor.constraint(equalTo: thumbImageView.trailingAnchor, constant: 5),
            articleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            articleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            articleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
