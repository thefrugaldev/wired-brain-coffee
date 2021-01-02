//
//  GiftViewController.swift
//  WiredBrainCoffee
//
//  Created by Clayton Orman on 12/29/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import UIKit

class GiftViewController: UIViewController {
    
    @IBOutlet weak var seasonalCollectionView: UICollectionView!
    
    var seasonalGiftCards = [GiftCardModel]() /* {
        /* Property observers are another option to reload data */
         didSet {
            // Whenever seasonal gift cards gets set to a new value, the following runs
            seasonalCollectionView.reloadData()
        }
    } */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seasonalCollectionView.dataSource = self
        seasonalCollectionView.delegate = self
        
        GiftCardFunctions.getSeasonalGiftCards { [weak self] (cards) in // brackets are a "capture list", anything inside it becomes optional
            guard let self = self else {return} // this converts the optional self into a non-optional self
            
            self.seasonalGiftCards = cards
            self.seasonalCollectionView.reloadData()
        }
    }

}

extension GiftViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seasonalGiftCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GiftCardCell", for: indexPath) as! GiftCardCollectionViewCell
        
        cell.setup(giftCardModel: seasonalGiftCards[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let columns: CGFloat = 2
        let collectionViewWidth = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * columns
        
        let width: CGFloat = (collectionViewWidth - spaceBetweenCells)  / columns
        let height: CGFloat = width/1.5
        
        return CGSize(width: width , height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let view = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "sectionHeader",
            for: indexPath)
            return view
    }
}
