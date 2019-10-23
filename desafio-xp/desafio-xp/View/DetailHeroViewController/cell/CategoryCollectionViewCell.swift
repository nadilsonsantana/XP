//
//  CategoryCollectionViewCell.swift
//  desafio-xp
//
//  Created by Nadilson Santana on 22/10/19.
//  Copyright © 2019 Nadilson Santana. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageCategory: UIImageView!
    
    func setup(items: Items?) {
        let apiManager = ApiManager()
        apiManager.getImage(urlString: items?.resourceURI ?? "") { itemInformation, success  in
            if success {
                let urlString = String(format: "%@.%@",itemInformation?.data?.results?.first?.thumbnail?.path ?? "", itemInformation?.data?.results?.first?.thumbnail?.extensionString ?? "" )
                self.imageCategory.sd_setImage(with: URL(string: urlString), completed: nil)
            }
        }
    }    
}
