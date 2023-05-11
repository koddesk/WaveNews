//
//  OnboardingCollectionViewCell.swift
//  WaveNews
//
//  Created by KODDER on 11.05.2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let idOnboardingCell = "idOnboardingCell"
    
    private let backgroundImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.font = .interSemiBold24()
        label.textColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let secondaryLabel: UILabel = {
        let label = UILabel()
        label.text = "All news in one place, be the first to know last news"
        label.font = .interRegular16()
        label.textColor = .specialGray
        label.numberOfLines = 4
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        backgroundColor = .specialBackground
        
        addSubview(backgroundImageView)
        addSubview(mainLabel)
        addSubview(secondaryLabel)
    }
    
    func cellConfigure(model: OnboardingSlide) {
        mainLabel.text = model.title
        secondaryLabel.text = model.description
        backgroundImageView.image = model.image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Constraints
extension OnboardingCollectionViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        
            mainLabel.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 60),
            mainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
    
            secondaryLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 20),
            secondaryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            secondaryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            secondaryLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
