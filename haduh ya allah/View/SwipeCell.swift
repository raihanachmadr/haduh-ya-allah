//
//  SwipeCell.swift
//  haduh ya allah
//
//  Created by Raihan Achmad on 05/07/24.
//
import UIKit

class SwipeCell: UICollectionViewCell {
    static let reuseIdentifier = "SwipeCell"
    
    let peopleImageView = UIImageView()
    let headlineLabel = UILabel()
    let subheadlineLabel = UILabel()
    let descriptionStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(image: String, headline: String, subheadline: String) {
        peopleImageView.image = UIImage(named: image)
        headlineLabel.text = headline
        subheadlineLabel.text = subheadline
    }
    
    func configure() {
        backgroundColor = .systemBackground
        
        peopleImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(peopleImageView)
        
        headlineLabel.textAlignment = .center
        headlineLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        headlineLabel.textColor = .black
        headlineLabel.numberOfLines = 5  // Allow up to 5 lines for the headline
        
        subheadlineLabel.textAlignment = .center
        subheadlineLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        subheadlineLabel.translatesAutoresizingMaskIntoConstraints = false
        subheadlineLabel.numberOfLines = 0
        subheadlineLabel.textColor = .black
        
        descriptionStackView.addArrangedSubview(headlineLabel)
        descriptionStackView.addArrangedSubview(subheadlineLabel)
        
        descriptionStackView.axis = .vertical
        descriptionStackView.spacing = 10
        descriptionStackView.alignment = .center
        descriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(descriptionStackView)
        
        NSLayoutConstraint.activate([
            peopleImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 90),
            peopleImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            peopleImageView.widthAnchor.constraint(equalToConstant: 361),
            peopleImageView.heightAnchor.constraint(equalToConstant: 328),
            peopleImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            descriptionStackView.topAnchor.constraint(equalTo: peopleImageView.bottomAnchor, constant: 100),
            descriptionStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            descriptionStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            // Remove fixed height to allow flexible height based on content
        ])
    }
}


//import UIKit
//
//class SwipeCell: UICollectionViewCell {
//    static let reuseIdentifier = "SwipeCell"
//    
//    let peopleImageView = UIImageView()
//    let headlineLabel = UILabel()
//    let subheadlineLabel = UILabel()
//    let descriptionStackView = UIStackView()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        configure()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func update(image: String, headline: String, subheadline: String) {
//        peopleImageView.image = UIImage(named: image)
//        headlineLabel.text = headline
//        subheadlineLabel.text = subheadline
//    }
//    
//    func configure() {
//        backgroundColor = .systemBackground
//        
//        peopleImageView.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(peopleImageView)
//        
//        headlineLabel.textAlignment = .center
//        headlineLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
//        headlineLabel.textColor = .black
//        headlineLabel.numberOfLines = 0
//        
//        subheadlineLabel.textAlignment = .center
//        subheadlineLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
//        subheadlineLabel.translatesAutoresizingMaskIntoConstraints = false
//        subheadlineLabel.numberOfLines = 0
//        subheadlineLabel.textColor = .black
//        
//        descriptionStackView.addArrangedSubview(headlineLabel)
//        descriptionStackView.addArrangedSubview(subheadlineLabel)
//        
//        descriptionStackView.axis = .vertical
//        descriptionStackView.spacing = 10
//        descriptionStackView.alignment = .center
//        descriptionStackView.translatesAutoresizingMaskIntoConstraints = false
//        
//        addSubview(descriptionStackView)
//        
//        NSLayoutConstraint.activate([
//            peopleImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 90),
//            peopleImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            peopleImageView.widthAnchor.constraint(equalToConstant: 361),
//            peopleImageView.heightAnchor.constraint(equalToConstant: 328),
//            peopleImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//            
//            descriptionStackView.topAnchor.constraint(equalTo: peopleImageView.bottomAnchor, constant: 100),
//            descriptionStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
//            descriptionStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
//            descriptionStackView.heightAnchor.constraint(equalToConstant: 80)
//        ])
//    }
//    
//}
//
