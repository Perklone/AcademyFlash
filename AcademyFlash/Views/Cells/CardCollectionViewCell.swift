//
//  CardCollectionViewCell.swift
//  AcademyFlash
//
//  Created by Rizky Maulana on 24/07/22.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    static let identifier = "CardCollectionCell"
    
    let iconImageView = UIImageView()
    let subjectLabel = UILabel()
    let padding:CGFloat = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponents()
        configure()
    }
    
    func set(deck: Decks) {
        subjectLabel.text = deck.title
        iconImageView.image = deck.image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        addSubview(iconImageView)
        addSubview(subjectLabel)
        
        layer.cornerRadius = 17
        
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor)
        ])
        NSLayoutConstraint.activate([
            subjectLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            subjectLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: padding),
            
            subjectLabel.heightAnchor.constraint(equalToConstant: 131),
            subjectLabel.widthAnchor.constraint(equalToConstant: 188)
        ])
    }
    
    func setupComponents() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        subjectLabel.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = UIColor(red: 20/255, green: 33/255, blue: 61/255, alpha: 1)
        
        layer.shadowColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 1
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.masksToBounds = false
        
        configureImageView()
        configureSubjectLabel()
    }
    
    
    
    func configureImageView() {
        iconImageView.image = UIImage(systemName: "questionmark")
        iconImageView.clipsToBounds = true
    }
    
    func configureSubjectLabel() {
        subjectLabel.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        subjectLabel.numberOfLines = 0
        subjectLabel.adjustsFontForContentSizeCategory = true
        subjectLabel.adjustsFontSizeToFitWidth = true
        subjectLabel.minimumScaleFactor = 0.80
        subjectLabel.textColor = .white
        subjectLabel.lineBreakMode = .byClipping
        subjectLabel.preferredMaxLayoutWidth = 188
        
    }
}

