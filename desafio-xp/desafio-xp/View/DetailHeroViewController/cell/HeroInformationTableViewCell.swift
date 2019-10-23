//
//  HeroInformationTableViewCell.swift
//  desafio-xp
//
//  Created by Nadilson Santana on 22/10/19.
//  Copyright © 2019 Nadilson Santana. All rights reserved.
//

import UIKit

class HeroInformationTableViewCell: UITableViewCell {

    @IBOutlet weak var imageHero: UIImageView!
    @IBOutlet weak var descriptionHero: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(hero: Heroes?) {
        let urlString = String(format: "%@.%@",hero?.thumbnail?.path ?? "", hero?.thumbnail?.extensionString ?? "" )
        imageHero.sd_setImage(with: URL(string: urlString), completed: nil)
        descriptionHero.text = hero?.description
    }
    
}
