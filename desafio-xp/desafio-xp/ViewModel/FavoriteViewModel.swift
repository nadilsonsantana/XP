//
//  FavoriteViewModel.swift
//  desafio-xp
//
//  Created by Nadilson Santana on 22/10/19.
//  Copyright © 2019 Nadilson Santana. All rights reserved.
//

import UIKit

class FavoriteViewModel: NSObject {
    
    private var listFavorite: [LocalHeroes]?
    private let coreDataManager = CoreDataManager()
    
    func numberOfItemInSection() -> Int {
        return listFavorite?.count ?? 0
    }
    
    func getCurrentFavorite(indexPath: IndexPath) -> LocalHeroes? {
        return listFavorite?[indexPath.row]
    }
    
    func loadFavorite(completion: (Bool) -> Void){
        coreDataManager.loadHeroes { listFavorite, success in
            if success {
                self.listFavorite = listFavorite
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
