//
//  SubjectViewController.swift
//  AcademyFlash
//
//  Created by Rizky Maulana on 23/07/22.
//

import UIKit

class SubjectViewController: UIViewController {
    
    enum Section {
        case subject
    }

    var deckCollectionView: UICollectionView!
    var decks: [Decks] = [Decks(title: "Swift Fundamentals", image: "SwiftIcon",cardCount: 1)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureCollectionView()
        // Do any additional setup after loading the view.
    }
    
    func configureNavigationBar() {
        title = "Subjects"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let addButton                       = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(dummy))
        addButton.tintColor                 = UIColor(red: 20/255, green: 33/255, blue: 61/255, alpha: 1)
        navigationItem.rightBarButtonItem   = addButton

    }
    @objc func dummy() {
        
    }
    func configureCollectionView() {
        deckCollectionView              = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createFlowLayout(in: view))
        view.addSubview(deckCollectionView)
    
        deckCollectionView.delegate     = self
        deckCollectionView.dataSource   = self
        
        deckCollectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        
    }
}

extension SubjectViewController: UICollectionViewDataSource {
    
    func collectionView(_ deckCollectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ deckCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = deckCollectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as! CardCollectionViewCell
        cell.set(deck: decks[0])
        return cell
    }
}

extension SubjectViewController: UICollectionViewDelegate {
    func collectionView(_ deckCollectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pracVC = PracticeViewController()
        pracVC.modalPresentationStyle = .fullScreen
        pracVC.modalTransitionStyle = .flipHorizontal
        present(pracVC, animated: true,completion: nil)
    }
    
}
