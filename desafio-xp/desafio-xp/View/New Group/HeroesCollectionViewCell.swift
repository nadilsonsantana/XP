//
//  HeroesCollectionViewCell.swift
//  desafio-xp
//
//  Created by Nadilson Santana on 20/10/19.
//  Copyright © 2019 Nadilson Santana. All rights reserved.
//

import UIKit
import SDWebImage

class HeroesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageHero: UIImageView!
    @IBOutlet weak var btnAddFavorite: UIButton!
    
    var addFavoriteClosure : (() -> ())?
    
    func setup(hero: Heroes?) {
        let urlString = String(format: "%@.%@",hero?.thumbnail?.path ?? "", hero?.thumbnail?.extensionString ?? "" )
        imageHero.sd_setImage(with: URL(string: urlString), completed: nil)
        if hero?.favorite ?? false {
            btnAddFavorite.setImage(UIImage(systemName: "star.fill"), for: .normal)
            btnAddFavorite.isSelected = true
        }
    }
    
    @IBAction func addFavorite(_ sender: UIButton){
        if sender.isSelected {
            btnAddFavorite.setImage(UIImage(systemName: "star"), for: .normal)
            sender.isSelected = false
        } else {
            btnAddFavorite.setImage(UIImage(systemName: "star.fill"), for: .normal)
            sender.isSelected = true
        }
        
      addFavoriteClosure?()
    }

}
