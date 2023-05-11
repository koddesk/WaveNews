//
//  OnboardingView.swift
//  WaveNews
//
//  Created by KODDER on 11.05.2023.
//

import UIKit

class OnboardingView: UIView {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .blue
        collectionView.isScrollEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.pageIndicatorTintColor = .specialPurple
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    private lazy var btn: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "Next"
        button.setTitle("Next", for: .normal)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 15
        button.backgroundColor = .specialPurple
        button.addTarget(self, action: #selector(tapBtn), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
        setDelegates()
    }
    
    private func setupView() {
        backgroundColor = .specialBackground
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
        collectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.idOnboardingCell)
        addSubview(pageControl)
        addSubview(btn)
    }
    
    private func setDelegates() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    @objc private func tapBtn() {
        print("ok")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UICollectionViewDelegate


//MARK: - UICollectionViewDataSource
extension OnboardingView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.idOnboardingCell, for: indexPath) as! OnboardingCollectionViewCell
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension OnboardingView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: frame.width, height: collectionView.frame.height)
    }
}

//MARK: - Constraints
extension OnboardingView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -20),
            
            pageControl.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 75),
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 50),
            
            btn.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 20),
            btn.centerXAnchor.constraint(equalTo: centerXAnchor),
            btn.heightAnchor.constraint(equalToConstant: 50),
            btn.widthAnchor.constraint(equalToConstant: 336)
        ])
    }
}
