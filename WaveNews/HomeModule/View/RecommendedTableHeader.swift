//
//  RecommendedTableHeader.swift
//  WaveNews
//
//  Created by KODDER on 16.05.2023.
//

import UIKit

class RecommendedTableHeader: UITableViewHeaderFooterView {
    
    static let identifier = "TableHeader"
    
    let recommendedLabel: UILabel = {
        let label = UILabel()
        label.text = "Recommended for you"
        label.font = UIFont.interSemiBold16()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var seeAllButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("See All", for: .normal)
        button.titleLabel?.font = UIFont.interSemiBold16()
        button.addTarget(self, action: #selector(didTapBtn), for: .touchUpInside)
        button.backgroundColor = .none
        button.titleLabel?.textColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        configure()
        setConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        recommendedLabel.sizeToFit()
        seeAllButton.sizeToFit()
    }
    
    private func configure() {
        contentView.addSubview(recommendedLabel)
        contentView.addSubview(seeAllButton)
    }
    
    @objc private func didTapBtn() {
        print("See All")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Constraints
extension RecommendedTableHeader {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            recommendedLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            recommendedLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            
            seeAllButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            seeAllButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
}
