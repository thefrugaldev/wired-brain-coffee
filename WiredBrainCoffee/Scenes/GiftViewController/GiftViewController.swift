//
//  GiftViewController.swift
//  WiredBrainCoffee
//
//  Created by Clayton Orman on 12/29/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import UIKit

class GiftViewController: UIViewController {
    
    @IBOutlet weak var seasonalHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var seasonalCollectionView: UICollectionView!
    @IBOutlet weak var thankYouCollectionView: UICollectionView!
    @IBOutlet weak var thankYouHeightConstraint: NSLayoutConstraint!
    
    var seasonalGiftCards = [GiftCardModel]() /* {
        /* Property observers are another option to reload data */
         didSet {
            // Whenever seasonal gift cards gets set to a new value, the following runs
            seasonalCollectionView.reloadData()
        }
    } */
    var thankYouDataSource: SmallGiftCardCollectionViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seasonalCollectionView.dataSource = self
        seasonalCollectionView.delegate = self
        
        GiftCardFunctions.getSeasonalGiftCards { [weak self] (cards) in // brackets are a "capture list", anything inside it becomes optional
            guard let self = self else {return} // this converts the optional self into a non-optional self
            
            self.seasonalGiftCards = cards
            self.seasonalCollectionView.reloadData()
        }
        
        GiftCardFunctions.getThankYouGiftCards { [weak self] (cards) in
            guard let self = self else {return}
            
            self.thankYouDataSource = SmallGiftCardCollectionViewDataSource(giftCards: cards)
            
            self.thankYouCollectionView.dataSource = self.thankYouDataSource
            self.thankYouCollectionView.delegate = self.thankYouDataSource
            
            self.thankYouCollectionView.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setHeightOfCollectionViews()
    }
    
    func setHeightOfCollectionViews() {
        /* Calculating aspect raio for overall collection view */
        let width = seasonalCollectionView.bounds.width
        let height = width / 1.5
        
        seasonalHeightConstraint.constant = height
        
        thankYouHeightConstraint.constant = height / 2
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
        /* Calculating aspect ratio for individual cells */
        let width: CGFloat = collectionView.bounds.width - 50 // includes section insets and small enough to show next card
        let height: CGFloat = width / 1.5
        
        return CGSize(width: width , height: height)
    }
}
