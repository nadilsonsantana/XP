//
//  CategoryHeroesTableViewCell.swift
//  desafio-xp
//
//  Created by Nadilson Santana on 22/10/19.
//  Copyright © 2019 Nadilson Santana. All rights reserved.
//

import UIKit

class CategoryHeroesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
        }
    }
    var category: [Items]?
        
    
    func setup(hero:Heroes?,indexPath: IndexPath) {
            
        switch indexPath.section {
        case 1:
            category = hero?.comics?.items?.isEmpty ?? true ? [] : hero?.comics?.items
        case 2:
            category = hero?.series?.items?.isEmpty ?? true ? [] : hero?.series?.items
        case 3:
            category = hero?.stories?.items?.isEmpty ?? true ? [] : hero?.stories?.items
        case 4:
            category = hero?.events?.items?.isEmpty ?? true ? [] : hero?.events?.items
        default:
            category = []
        }
        self.collectionView.reloadData()
    }
}

extension CategoryHeroesTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let item = collectionView.dequeueReusableCell(withReuseIdentifier: "cellX", for: indexPath) as? CategoryCollectionViewCell {
            item.setup(items: category?[indexPath.row])
            return item
        }
        return UICollectionViewCell()
    }
    
}
