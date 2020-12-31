//
//  ColorCollectionViewCell.swift
//  WiredBrainCoffee
//
//  Created by Clayton Orman on 12/31/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 10
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 1, height: 1)
    }
    
    func setup(backgroundColor: UIColor, cellNumber: Int) {
        self.backgroundColor = backgroundColor
        numberLabel.text = "\(cellNumber)"
    }
}
