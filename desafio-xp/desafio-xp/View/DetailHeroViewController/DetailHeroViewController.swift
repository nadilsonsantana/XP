//
//  DetailHeroViewController.swift
//  desafio-xp
//
//  Created by Nadilson Santana on 22/10/19.
//  Copyright © 2019 Nadilson Santana. All rights reserved.
//

import UIKit

class DetailHeroViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var hero: Heroes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "HeroInformationTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
}

extension DetailHeroViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return ""
        case 1:
            return  hero?.comics?.items?.isEmpty ?? true ? "" : "Comics"
        case 2:
            return  hero?.comics?.items?.isEmpty ?? true ? "" : "Series"
        case 3:
            return  hero?.comics?.items?.isEmpty ?? true ? "" : "Stories"
        case 4:
            return  hero?.comics?.items?.isEmpty ?? true ? "" : "Events"
        default:
            return ""
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            
        case 0:
            return 1
        case 1:
            return hero?.comics?.items?.isEmpty ?? true ? 0 : 1
        case 2:
            return hero?.series?.items?.isEmpty ?? true ? 0 : 1
        case 3:
            return hero?.stories?.items?.isEmpty ?? true ? 0 : 1
        case 4:
            return hero?.events?.items?.isEmpty ?? true ? 0 :1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HeroInformationTableViewCell {
                cell.setup(hero: hero)
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "categoryHeroes", for: indexPath) as? CategoryHeroesTableViewCell {
                cell.setup(hero: hero, indexPath: indexPath)
                return cell
            }
        }
        
        return UITableViewCell()
    }
}
