//
//  MiddleNewsCollectionViewCell.swift
//  WaveNews
//
//  Created by KODDER on 15.05.2023.
//

import UIKit

class MiddleNewsCollectionViewCell: UICollectionViewCell {
    
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "newss")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameCategoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .specialBackground
        label.font = UIFont.interRegular16()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let newsHeadlineLabel: UILabel = {
        let label = UILabel()
        label.textColor = .specialBackground
        label.text = "The latest situation in the presidential election"
        label.numberOfLines = 2
        label.font = UIFont.interBold16()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var favButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "bookmark"), for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        backgroundColor = .specialGreyLighter
        layer.cornerRadius = 10
        
        addSubview(backgroundImage)
        addSubview(nameCategoryLabel)
        addSubview(newsHeadlineLabel)
        addSubview(favButton)
    }
    
    @objc private func buttonTapped() {
        print("SAVE")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Constraints
extension MiddleNewsCollectionViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            nameCategoryLabel.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 150),
            nameCategoryLabel.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 30),
            
            newsHeadlineLabel.topAnchor.constraint(equalTo: nameCategoryLabel.bottomAnchor, constant: 10),
            newsHeadlineLabel.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 30),
            newsHeadlineLabel.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -30),
            
            favButton.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 30),
            favButton.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -30),
        ])
    }
}
