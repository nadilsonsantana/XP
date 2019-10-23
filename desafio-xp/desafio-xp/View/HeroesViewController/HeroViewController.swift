//
//  HeroViewController.swift
//  desafio-xp
//
//  Created by Nadilson Santana on 19/10/19.
//  Copyright © 2019 Nadilson Santana. All rights reserved.
//

import UIKit


class HeroViewController: UIViewController {
    
    var viewModel: HeroViewModel?
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setupCollectionView()
        self.getHeroes()
    }
    
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func getHeroes() {
        self.viewModel = HeroViewModel()
        self.viewModel?.getHeroes(completion: { success in
            if success {
                self.collectionView.reloadData()
            }
        })
    }
    
}

extension HeroViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel?.numberOfItemsInSection() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HeroesCollectionViewCell
        cell?.setup(hero: self.viewModel?.getCurrentHero(indexPath: indexPath))
        cell?.addFavoriteClosure = { [weak self] in
            self?.viewModel?.saveHero(hero: self?.viewModel?.getCurrentHero(indexPath: indexPath), indexPath: indexPath)
        }
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let heroDetail = self.storyboard?.instantiateViewController(identifier: "DetailHeroViewController") as? DetailHeroViewController {
            heroDetail.hero = self.viewModel?.getCurrentHero(indexPath: indexPath)
            self.present(heroDetail, animated: true, completion: nil)
        }
    }
    
}

