//
//  ViewController.swift
//  AcademyFlash
//
//  Created by Rizky Maulana on 23/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    enum Section {
        case subject
    }

    var collectionView: UICollectionView!
    var decks: [Decks] = [Decks(title: "Swift Fundamentals", image: UIImage(named: "SwiftLogo")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        // Do any additional setup after loading the view.
    }
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        
    }
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as! CardCollectionViewCell
        
      
        cell.set(deck: decks[0])
        
        return cell
    }
    

}
