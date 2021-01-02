//
//  SmallGiftCardCollectionViewDataSource.swift
//  WiredBrainCoffee
//
//  Created by Clayton Orman on 1/2/21.
//  Copyright © 2021 Mark Moeykens. All rights reserved.
//

import UIKit

class SmallGiftCardCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    fileprivate var giftCards = [GiftCardModel]()
    
    init(giftCards: [GiftCardModel]) {
        self.giftCards = giftCards
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return giftCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GiftCardCell", for: indexPath) as! GiftCardCollectionViewCell
        
        cell.setup(giftCardModel: giftCards[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        /* Calculating aspect ratio for individual cells */
        let width: CGFloat = (collectionView.bounds.width / 2) - 50 // includes section insets and small enough to show next card
        let height: CGFloat = width / 1.5
        
        return CGSize(width: width , height: height)
    }
}
