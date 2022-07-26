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

    var collectionView: UICollectionView!
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
        collectionView              = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate     = self
        collectionView.dataSource   = self
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        
    }
}

extension SubjectViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as! CardCollectionViewCell
        cell.set(deck: decks[0])
        return cell
    }
    

}
