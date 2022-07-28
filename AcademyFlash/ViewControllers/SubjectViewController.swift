//
//  SubjectViewController.swift
//  AcademyFlash
//
//  Created by Rizky Maulana on 23/07/22.
//

import UIKit
import CoreData

class SubjectViewController: UIViewController {
    
    enum Section {
        case subject
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var deckCollectionView: UICollectionView!
    var decks: [DeckCoreData]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDecks()
        configureNavigationBar()
        configureCollectionView()
    }
    
    func configureNavigationBar() {
        title = "Subjects"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let addButton                       = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(dummy))
        addButton.tintColor                 = UIColor(red: 20/255, green: 33/255, blue: 61/255, alpha: 1)
        navigationItem.rightBarButtonItem   = addButton
    }
    
    @objc func dummy() {}

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
        return decks?.count ?? 0
    }
    
    func collectionView(_ deckCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        let cell = deckCollectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as! CardCollectionViewCell
        if let deck = decks?[index] { cell.set(deck: deck) }
        
        return cell
    }
}

extension SubjectViewController: UICollectionViewDelegate {
    func collectionView(_ deckCollectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pracVC = PracticeViewController()
        pracVC.modalPresentationStyle = .fullScreen
        pracVC.deckNameLabel.text = decks?[indexPath.row].title
        present(pracVC, animated: true,completion: nil)
    }
}

extension SubjectViewController {
    //MARK: CoreData Implementation
    func fetchDecks() {
        do {
            self.decks = try context.fetch(DeckCoreData.fetchRequest())
            DispatchQueue.main.async {
                self.deckCollectionView.reloadData()
            }
        } catch {}
    }
}
