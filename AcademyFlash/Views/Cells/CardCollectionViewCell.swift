//
//  CardCollectionViewCell.swift
//  AcademyFlash
//
//  Created by Rizky Maulana on 24/07/22.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    static let identifier = "CardCollectionCell"
    
    let cardCountLabel = UILabel()
    let iconImageView = UIImageView()
    let subjectLabel = UILabel()
    let padding:CGFloat = 20
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponents()
        configure()
    }
    
    func set(deck: DeckCoreData) {
        cardCountLabel.text = deck.cardCount == 1 ? "\(deck.cardCount) Card" : "\(deck.cardCount) Cards"
        subjectLabel.text = deck.title
        iconImageView.image = UIImage(named: deck.image!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        addSubview(cardCountLabel)
        addSubview(iconImageView)
        addSubview(subjectLabel)
        
        layer.cornerRadius = 17
        
        NSLayoutConstraint.activate([
            cardCountLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            cardCountLabel.leadingAnchor.constraint(equalTo: subjectLabel.leadingAnchor),
            cardCountLabel.heightAnchor.constraint(equalToConstant: 13)
        ])
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -5),
            iconImageView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding*1.5),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor)
        ])
        NSLayoutConstraint.activate([
            subjectLabel.topAnchor.constraint(equalTo: cardCountLabel.bottomAnchor),
            subjectLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: padding),
            subjectLabel.trailingAnchor.constraint(equalTo: iconImageView.leadingAnchor, constant: -padding),
            subjectLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -padding),
            subjectLabel.heightAnchor.constraint(equalToConstant: 131),
//            subjectLabel.widthAnchor.constraint(equalToConstant: 188),
        ])
        
    }
    
    func setupComponents() {
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        subjectLabel.translatesAutoresizingMaskIntoConstraints = false
        cardCountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = Color.mainBlue
        
        layer.shadowColor = Color.mainShadow.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 1
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.masksToBounds = false
        isUserInteractionEnabled = true
        
        configureCardCountingLabel()
        configureImageView()
        configureSubjectLabel()
    }
    
    
    
    func configureImageView() {
        iconImageView.image = UIImage(systemName: "questionmark")
        iconImageView.clipsToBounds = true
        iconImageView.contentMode = .scaleAspectFit
    }
    
    func configureSubjectLabel() {
        subjectLabel.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        subjectLabel.numberOfLines = 0
        subjectLabel.adjustsFontForContentSizeCategory = true
        subjectLabel.adjustsFontSizeToFitWidth = true
        subjectLabel.minimumScaleFactor = 0.65
        subjectLabel.textColor = .white
        subjectLabel.lineBreakMode = .byClipping
        subjectLabel.preferredMaxLayoutWidth = 188
    }
    func configureCardCountingLabel() {
        cardCountLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        cardCountLabel.numberOfLines = 0
        cardCountLabel.textColor = .white
        cardCountLabel.lineBreakMode = .byClipping
        cardCountLabel.preferredMaxLayoutWidth = 100
    }
}

