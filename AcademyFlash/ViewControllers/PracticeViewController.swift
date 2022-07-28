//
//  PracticeViewController.swift
//  AcademyFlash
//
//  Created by Rizky Maulana on 26/07/22.
//

import Foundation
import UIKit

class PracticeViewController: UIViewController {
    
    
    var deckNameLabel = UILabel()
    var card = CardView()
    var flipButton = AFButton(color: Color.mainBlue, title: "Show Answer")
    var easyButton = AFButton(color: Color.mainGreen, title: "Solved This!")
    var hardButton = AFButton(color: Color.mainRed, title: "Too Hard..")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        insertSubviews()
        configure()
    }
    
    func insertSubviews() {
        view.addSubview(deckNameLabel)
        view.addSubview(card)
        view.addSubview(flipButton)
        view.addSubview(easyButton)
        view.addSubview(hardButton)
    }
    
    func configure() {
        let padding:CGFloat = 30
        let height = view.bounds.height
        let width = view.bounds.width
        configureLabel()
        
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: deckNameLabel.bottomAnchor, constant: padding),
            card.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            card.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            card.heightAnchor.constraint(equalToConstant: height*0.5)
        ])
        NSLayoutConstraint.activate([
            deckNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: height*0.05),
            deckNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            deckNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
        NSLayoutConstraint.activate([
            flipButton.topAnchor.constraint(equalTo: card.bottomAnchor, constant: padding),
            flipButton.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: padding*2),
            flipButton.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -padding*2),
            flipButton.heightAnchor.constraint(equalToConstant: height*0.06)
        ])
        NSLayoutConstraint.activate([
            easyButton.topAnchor.constraint(equalTo: flipButton.bottomAnchor, constant: padding),
            easyButton.leadingAnchor.constraint(equalTo: deckNameLabel.leadingAnchor),
            easyButton.heightAnchor.constraint(equalToConstant: height*0.06),
            easyButton.widthAnchor.constraint(equalToConstant: width/2.5)
        ])
        NSLayoutConstraint.activate([
            hardButton.topAnchor.constraint(equalTo: flipButton.bottomAnchor, constant: padding),
            hardButton.trailingAnchor.constraint(equalTo: deckNameLabel.trailingAnchor),
            hardButton.heightAnchor.constraint(equalToConstant: height*0.06),
            hardButton.widthAnchor.constraint(equalToConstant: width/2.5)
        ])
    }
    
    func configureLabel() {
        deckNameLabel.translatesAutoresizingMaskIntoConstraints = false
        deckNameLabel.font = UIFont.systemFont(ofSize: 24,weight: .bold)
        deckNameLabel.textAlignment = .center
        deckNameLabel.text = "Swift Fundamentals"
    }
}
