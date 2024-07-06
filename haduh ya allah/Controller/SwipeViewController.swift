//
//  SwipeViewController.swift
//  haduh ya allah
//
//  Created by Raihan Achmad on 05/07/24.
//

import UIKit

class SwipeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let swipeItems = [
        SwipeItem(image: "onboarding-1", headline: "Welcome to BookChat", subheadline: "Bookchat hadir untuk membantu kamu membentuk kebiasaan baru dari buku-buku favorit kamu"),
        SwipeItem(image: "onboarding-2", headline: "Chat with us", subheadline: "Kamu bisa memilih teman ngobrol kamu dengan cara yang kamu mau. Teman ngobrolmu akan melayanimu dan membantu kamu dalam membentuk kebiasan baru"),
        SwipeItem(image: "onboarding-3", headline: "You also could talk", subheadline: "Capek mengetik dan membaca? Kamu juga bisa berkomunikasi dengan berbicara layaknya kamu berbincang langsung dengan orang sekitarmu")
    ]
    
    let nextButton = UIButton(type: .system)
    let pageControl = UIPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return swipeItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SwipeCell.reuseIdentifier, for: indexPath) as! SwipeCell
        let swipeItem = swipeItems[indexPath.item]
        cell.update(image: swipeItem.image, headline: swipeItem.headline, subheadline: swipeItem.subheadline)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    @objc func nextButtonDidTap() {
        let nextIndex = min(pageControl.currentPage + 1, swipeItems.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func configureViewController() {
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(SwipeCell.self, forCellWithReuseIdentifier: SwipeCell.reuseIdentifier)
        
        // Configure nextButton
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(UIColor.white, for: .normal)
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
        nextButton.backgroundColor = .blue
        nextButton.layer.cornerRadius = 12
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure pageControl
        pageControl.currentPage = 0
        pageControl.numberOfPages = swipeItems.count
        pageControl.currentPageIndicatorTintColor = .systemBlue
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        // Add subviews
        view.addSubview(pageControl)
        view.addSubview(nextButton)
        
        // Set constraints
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -35),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 36),
            nextButton.heightAnchor.constraint(equalToConstant: 36),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 94),
            nextButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 730),
            
            pageControl.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -10),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

//import UIKit
//
//class SwipeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
//    
//    let swipeItems = [
//        SwipeItem(image: "onboarding-1", headline: "Welcome to BookChat", subheadline: "Bookchat hadir untuk membantu kamu membentuk kebiasaan baru dari buku-buku favorit kamu"),
//        SwipeItem(image: "onboarding-2", headline: "Chat with us", subheadline: "Kamu bisa memilih teman ngobrol kamu dengan cara yang kamu mau. Teman ngobrolmu akan melayanimu dan membantu kamu dalam membentuk kebiasan baru"),
//        SwipeItem(image: "onboarding-3", headline: "You also could talk", subheadline: "Capek mengetik dan membaca? Kamu juga bisa berkomunikasi dengan berbicara layaknya kamu berbincang langsung dengan orang sekitarmu")
//    ]
//    
//    let nextButton = UIButton(type: .system)
//    let pageControl = UIPageControl()
//    let bottomStackView = UIStackView()
//    let centerStackView = UIStackView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        configureViewController()
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return swipeItems.count
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SwipeCell.reuseIdentifier, for: indexPath) as! SwipeCell
//        let swipeItem = swipeItems[indexPath.item]
//        cell.update(image: swipeItem.image, headline: swipeItem.headline, subheadline: swipeItem.subheadline)
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: view.frame.height)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    
//    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        let x = targetContentOffset.pointee.x
//        pageControl.currentPage = Int(x / view.frame.width)
//    }
//    
//    @objc func nextButtonDidTap() {
//        let nextIndex = min(pageControl.currentPage + 1, swipeItems.count - 1)
//        let indexPath = IndexPath(item: nextIndex, section: 0)
//        pageControl.currentPage = nextIndex
//        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//    }
//    
//    func configureCenterStackView() {
//        pageControl.currentPage = 0
//        pageControl.numberOfPages = swipeItems.count
//        pageControl.currentPageIndicatorTintColor = .systemBlue
//        pageControl.pageIndicatorTintColor = .systemGray
//       
//        centerStackView.addArrangedSubview(pageControl)
//        centerStackView.addArrangedSubview(nextButton)
//        
//        centerStackView.axis = .horizontal
//        centerStackView.distribution = .fillEqually
//        centerStackView.translatesAutoresizingMaskIntoConstraints = false
//        
//        view.addSubview(centerStackView)
//    }
//    
//    
//    func configureBottomStackView() {
//        nextButton.setTitle("Next", for: .normal)
//        nextButton.setTitleColor(UIColor.white, for: .normal)
//        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
//        nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
//        nextButton.backgroundColor = .blue
//        nextButton.layer.cornerRadius = 12
//        nextButton.translatesAutoresizingMaskIntoConstraints = false
//        
//                
//        bottomStackView.addArrangedSubview(pageControl)
//        bottomStackView.addArrangedSubview(nextButton)
//        bottomStackView.axis = .horizontal
//        bottomStackView.distribution = .fillEqually
//        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
//        
//        view.addSubview(bottomStackView)
//    }
//    
//    func configureViewController() {
//        collectionView.isPagingEnabled = true
//        collectionView.backgroundColor = .systemBackground
//        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.register(SwipeCell.self, forCellWithReuseIdentifier: SwipeCell.reuseIdentifier)
//        
//        configureBottomStackView()
//        configureCenterStackView()
//        
//        NSLayoutConstraint.activate([
//            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200),
//            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
//        
//        NSLayoutConstraint.activate([
//            bottomStackView.heightAnchor.constraint(equalToConstant: 200),
//            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -35),
//            nextButton.widthAnchor.constraint(equalToConstant: 36),
//            nextButton.heightAnchor.constraint(equalToConstant: 36),
//            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 94),
//            nextButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 675)
//        ])
//    }
//    
//}
//
