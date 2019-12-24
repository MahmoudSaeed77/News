//
//  DetailView.swift
//  News App
//
//  Created by Mohamed Ibrahem on 10/21/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    lazy var imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "")?.withRenderingMode(.alwaysOriginal))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Author Label"
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title Label Is Here..."
        label.numberOfLines = 0
        label.textColor = UIColor.white
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Description Label Is Here..."
        label.numberOfLines = 0
        return label
    }()
    
    lazy var publishDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Publish Date"
        return label
    }()
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Content Label Is Here..."
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView(){
        backgroundColor = UIColor.white
        
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(authorLabel)
        addSubview(publishDateLabel)
        addSubview(descriptionLabel)
        addSubview(contentLabel)
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: widthAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 70),
            titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            
            authorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            authorLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            
            publishDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            publishDateLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 20),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            
            contentLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            contentLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            contentLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            ])
    }
}
