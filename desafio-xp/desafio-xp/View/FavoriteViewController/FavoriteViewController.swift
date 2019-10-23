//
//  FavoriteViewController.swift
//  desafio-xp
//
//  Created by Nadilson Santana on 22/10/19.
//  Copyright © 2019 Nadilson Santana. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var favoriteViewModel: FavoriteViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        
        favoriteViewModel = FavoriteViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favoriteViewModel?.loadFavorite(completion: { (success) in
            if success {
                collectionView.reloadData()
            }
        })
    }
}

extension FavoriteViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        favoriteViewModel?.numberOfItemInSection() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? FavoriteCollectionViewCell {
            
            cell.setup(favorite: favoriteViewModel?.getCurrentFavorite(indexPath: indexPath))
            return cell
        }
        
        return UICollectionViewCell()
        
        
        
    }
    
    
    
}
