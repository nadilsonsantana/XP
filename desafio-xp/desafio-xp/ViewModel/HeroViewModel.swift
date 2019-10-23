//
//  HeroViewModel.swift
//  desafio-xp
//
//  Created by Nadilson Santana on 22/10/19.
//  Copyright © 2019 Nadilson Santana. All rights reserved.
//

import UIKit
import CoreData

class HeroViewModel: NSObject {
    
    private let apiManager = ApiManager()
    private var listOfHeroes: [Heroes]?
    private let coreDataManager = CoreDataManager()
    
    func numberOfItemsInSection() -> Int {
        return self.listOfHeroes?.count ?? 0
    }
    
    func getCurrentHero(indexPath: IndexPath) -> Heroes? {
        return self.listOfHeroes?[indexPath.row]
    }
    
    func saveHero(hero: Heroes?,indexPath: IndexPath) {
        self.listOfHeroes?[indexPath.row].favorite = true
        coreDataManager.saveHeroes(heroes: hero)
    }
    
    
    
    func getHeroes(completion: @escaping (Bool) -> Void) {
        apiManager.getcharacters { listArray, success  in
            if success {
                self.listOfHeroes = listArray?.sorted {
                    $0.name ?? "" < $1.name ?? ""
                }
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
