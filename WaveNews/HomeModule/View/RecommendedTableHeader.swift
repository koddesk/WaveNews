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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        recommendedLabel.sizeToFit()
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    private func configure() {
        contentView.backgroundColor = .specialPurple
        
        contentView.addSubview(recommendedLabel)
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
            recommendedLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
        ])
    }
}
