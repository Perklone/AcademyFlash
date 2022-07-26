//
//  PracticeViewController.swift
//  AcademyFlash
//
//  Created by Rizky Maulana on 26/07/22.
//

import Foundation
import UIKit

class PracticeViewController: UIViewController {
    
    var card = CardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        let padding:CGFloat = 20
        let height = view.bounds.height
        view.addSubview(card)
        
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            card.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            card.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            card.heightAnchor.constraint(equalToConstant: height*0.60)
        ])
    }
    
}
