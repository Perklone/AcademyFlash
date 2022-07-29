//
//  CardView.swift
//  AcademyFlash
//
//  Created by Rizky Maulana on 26/07/22.
//

import UIKit

class CardView: UIView {

    let label               = UILabel()
    let padding: CGFloat    = 20
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    convenience init() {
        self.init(frame: .zero)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = Color.mainBlue
        layer.cornerRadius = 8
        layer.masksToBounds = false
        
        layer.shadowColor = Color.mainShadow.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 1
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    func configureLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 36, weight: .semibold)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
    }
    
    func configure() {
        
        addSubview(label)
        configureView()
        configureLabel()
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
        ])
    }

}
