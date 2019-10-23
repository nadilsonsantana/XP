//
//  FavoriteCollectionViewCell.swift
//  desafio-xp
//
//  Created by Nadilson Santana on 22/10/19.
//  Copyright © 2019 Nadilson Santana. All rights reserved.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageFavorite: UIImageView!
    
    func setup(favorite: LocalHeroes?) {
        imageFavorite?.sd_setImage(with: URL(string: favorite?.heroImage ?? ""), completed: nil)
    }
    
}
