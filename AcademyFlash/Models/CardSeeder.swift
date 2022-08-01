//
//  CardSeeder.swift
//  AcademyFlash
//
//  Created by Rizky Maulana on 28/07/22.
//


import UIKit

struct cardSeeder {

    func seedTemplateCard(_ param: DeckCoreData) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let array = [
            "What is Protocol-Delegate Pattern used for?":"It is used for passing data to another view controller.",
            "What is the difference between var and let?":"You can modify var values but not let values.",
            "How would you explain delegates to a new Swift developer?" : "Delegates is used to control other another object."
        ]
        
//        array.forEach { (key: String, value: String) in
//            let card = CardCoreData(context: context)
//            card.question = key
//            card.answer = value
//            card.repetition = 0
//            card.interval = 1
//            card.easiness = 2.5
//            card.value = 0
//            card.deckOwner = param
//            do {
//                try context.save()
//            } catch {}
//        }
        for i in 1...15 {
            let card = CardCoreData(context: context)
            card.question = "Question \(i)"
            card.answer = "Answer \(i)"
            card.repetition = 0
            card.interval = 1
            card.easiness = 2.5
            card.value = 0
            card.deckOwner = param
            do {
                try context.save()
            } catch {}
        }
    }
}
