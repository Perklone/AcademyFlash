//
//  PracticeViewController.swift
//  AcademyFlash
//
//  Created by Rizky Maulana on 26/07/22.
//


import UIKit
import CoreData
class PracticeViewController: UIViewController {
    
    let context                    = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var deck:DeckCoreData?
    var cards: [CardCoreData]   = []
    var deckNameLabel           = UILabel()
    var card                    = CardView()
    var isFlipped               = false
    
    var backButton = UIImageView()
    var dummyButton = AFButton(color: .red, title: "Dummy")
    var flipButton = AFButton(color: Color.mainBlue, title: "Show Answer")
    var easyButton = AFButton(color: Color.mainGreen, title: "Solved This!")
    var hardButton = AFButton(color: Color.mainRed, title: "Too Hard..")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCards()
        insertSubviews()
        configure()
        
    }
    
    func insertSubviews() {
        view.addSubview(backButton)
        view.addSubview(dummyButton)
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
        configureBackButton()
        configureLabel()
        configureButtons()
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: height*0.04),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            backButton.heightAnchor.constraint(equalToConstant: 45),
            backButton.widthAnchor.constraint(equalTo: backButton.heightAnchor)
        ])
        NSLayoutConstraint.activate([
            dummyButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            dummyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dummyButton.heightAnchor.constraint(equalToConstant: 80)
        ])
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
    }
    
    func configureButtons() {
        dummyButton.addTarget(self, action: #selector(dummy), for: .touchUpInside)
        dummyButton.isHidden = true
        easyButton.tag = 1
        hardButton.tag = 0
        flipButton.addTarget(self, action: #selector(flipCard), for: .touchUpInside)
        easyButton.addTarget(self, action: #selector(calculatePractice(sender:)), for: .touchUpInside)
        hardButton.addTarget(self, action: #selector(calculatePractice(sender:)), for: .touchUpInside)
    }
    func configureBackButton() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(unwindTo))
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(tapGesture)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.image = UIImage(systemName: "arrowshape.turn.up.backward")
        backButton.tintColor = Color.mainOrange
    }
}

//MARK: Spaced Algorithm
extension PracticeViewController {
    @objc func calculatePractice(sender: UIButton) {
        guard var repetitions = cards.first?.repetition else { return }
        guard var easiness = cards.first?.easiness else { return }
        guard var interval = cards.first?.interval else { return }
        
        let question                = sender.tag == 1 ? 1 : 0
        let card = cards.first
        let milisecondsInDay:Int64  = 6 * 6 * 24 * 10
        let factora                 = easiness + 0.1 - (5.0 - Float(question))
        let factorb                 = (0.08 + (5.0 - Float(question)) * 0.02)
        let factor                  = factora * factorb
        let now                     = Date().millisecondsSince1970
        
        
        easiness                    = max(1.3, factor)

        if question == 1 { repetitions = 0 } else {
            repetitions+=1
        }

        if (repetitions <= 1) {
            interval = 1
        } else if (repetitions == 2) {
            interval = 6
        } else {
            interval = Int64(round(Float(interval) * easiness))
        }
        
        if let card = card {
            card.value = now + milisecondsInDay * interval
            card.repetition = repetitions
            card.easiness = easiness
            card.interval = interval
        }
        
        do {
            try self.context.save()
        } catch {}
        fetchCards()
    }
    
    @objc func flipCard() {
        if isFlipped {
            card.label.text = cards.first?.answer
            isFlipped.toggle()
        } else {
            card.label.text = cards.first?.question
            isFlipped.toggle()
        }
    }
}

//MARK: @OBJC Function
extension PracticeViewController {
    
    @objc func unwindTo() {
        self.view.window?.rootViewController?.dismiss(animated: true)
    }
    
    func fetchCards() {
        let request = CardCoreData.fetchRequest() as NSFetchRequest<CardCoreData>
        let sort = NSSortDescriptor(key: "value", ascending: true)
        request.sortDescriptors = [sort]
        do {
            self.cards = try context.fetch(request)
            DispatchQueue.main.async {
                self.card.label.text = self.cards.first?.question
            }
        } catch {}
    }
    
    @objc func dummy() {
        let cs = cardSeeder()
        guard let deck = deck else { return }
        cs.seedTemplateCard(deck)
        fetchCards()

        deck.cardCount = Int64(cards.count)
        cards.forEach { CardCoreData in
            deck.addToCards(CardCoreData)
        }
        do{
            try self.context.save()
        }catch {}
        

//        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "CardCoreData")
//
//        let batch = NSBatchDeleteRequest(fetchRequest: fetch)
//
//        do {
//            try context.execute(batch)
//            self.cards = try context.fetch(CardCoreData.fetchRequest())
//        } catch{}
//        guard let deck = deck else { return }
//        deck.cardCount = Int64(cards.count)
//        do{
//            try self.context.save()
//        }catch {}
//        print(cards.count)
    }
}
