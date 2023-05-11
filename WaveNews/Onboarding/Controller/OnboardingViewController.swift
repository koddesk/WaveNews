//
//  OnboardingViewController.swift
//  WaveNews
//
//  Created by KODDER on 11.05.2023.
//

import UIKit

protocol NextTappedDelegate {
    func nextButtonTapped()
}

class OnboardingViewController: UIViewController {
    
    var delegate: NextTappedDelegate?
    
    private lazy var  nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialPurple
        button.layer.cornerRadius = 25
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = .interSemiBold16()
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.isEnabled = false
        pageControl.pageIndicatorTintColor = .specialPurple
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var onboardingArray = [OnboardingSlide]()
    private var collectionItem = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        delegate = self
    }
    
    private func setupView() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(nextButton)
        view.addSubview(pageControl)
        view.addSubview(collectionView)
        collectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.idOnboardingCell)
        
        //Add images
        guard let imageFirst = UIImage(named: "news"),
        let imageSecond = UIImage(named: "news"),
        let imageThird = UIImage(named: "news") else {
            return
        }
        
        let firstScreen = OnboardingSlide(title: "Welcome",
                                          description: "All news in one place, be the first to know last news",
                                          image: imageFirst)
        let secondScreen = OnboardingSlide(title: ".......",
                                           description: ">>>>>>>>>>.",
                                            image: imageSecond)
        let thirdScreen = OnboardingSlide(title: "......",
                                          description: ">>>>>>>>",
                                           image: imageThird)
        onboardingArray = [firstScreen, secondScreen, thirdScreen]
    }
    
    @objc func nextTapped() {
        delegate?.nextButtonTapped()
    }
}

//MARK: - UICollectionViewDataSource
extension OnboardingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        onboardingArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.idOnboardingCell, for: indexPath) as! OnboardingCollectionViewCell
        let model = onboardingArray[indexPath.row]
        cell.cellConfigure(model: model)
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width, height: collectionView.frame.height)
    }
}

//MARK: - NextTappedDelegate
extension OnboardingViewController: NextTappedDelegate {
    func nextButtonTapped() {
        if collectionItem == 1 {
            nextButton.setTitle("START", for: .normal)
            navigationController?.pushViewController(MainTabBarViewController(), animated: true)
        }
        
        if collectionItem == 2 {
            dismiss(animated: true, completion: nil)
        } else {
            collectionItem += 1
            let index: IndexPath = [0 , collectionItem]
            collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = collectionItem
        }
    }
}

//MARK: - Constraints
extension OnboardingViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            
            pageControl.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -20),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            pageControl.heightAnchor.constraint(equalToConstant: 30),
            
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -20)
        ])
    }
}
