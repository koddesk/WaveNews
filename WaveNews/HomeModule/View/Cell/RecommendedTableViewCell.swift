//
//  RecommendedTableViewCell.swift
//  WaveNews
//
//  Created by KODDER on 17.05.2023.
//

import UIKit

class RecommendedTableViewCell: UITableViewCell {
    
    static let identifier = "RecommendedTableViewCell"
    
    private let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "test")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let newsCategoriesLabel: UILabel = {
        let label = UILabel()
        label.text = "UI/UX Design"
        label.font = UIFont.interRegular14()
        label.textColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let newsHeadlineLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.text = "A Simple Trick For Creating Color Palettes Quickly"
        label.font = UIFont.interSemiBold16()
        label.textColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        setConstraints()
    }
    
    private func configure() {
        backgroundColor = .none
        selectionStyle = .none
        layer.cornerRadius = 20
        
        contentView.addSubview(newsImageView)
        contentView.addSubview(newsCategoriesLabel)
        contentView.addSubview(newsHeadlineLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Constraints
extension RecommendedTableViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            newsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            newsImageView.heightAnchor.constraint(equalToConstant: 120),
            newsImageView.widthAnchor.constraint(equalToConstant: 120),
            
            newsCategoriesLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 15),
            newsCategoriesLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            newsHeadlineLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 15),
            newsHeadlineLabel.topAnchor.constraint(equalTo: newsCategoriesLabel.bottomAnchor, constant: 10),
            newsHeadlineLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
}
