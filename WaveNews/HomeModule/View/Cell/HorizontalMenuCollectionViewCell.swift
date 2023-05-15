//
//  HorizontalMenuCollectionViewCell.swift
//  WaveNews
//
//  Created by KODDER on 15.05.2023.
//

import UIKit

class HorizontalMenuCollectionViewCell: UICollectionViewCell {
    
    let nameCategoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .label
        label.font = .interSemiBold12()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = self.isSelected ? .specialPurple : .specialGreyLighter
            nameCategoryLabel.textColor = self.isSelected ? .specialBackground : .label
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        backgroundColor = .specialGreyLighter
        layer.cornerRadius = 15
        
        addSubview(nameCategoryLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Constraints
extension HorizontalMenuCollectionViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameCategoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameCategoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
