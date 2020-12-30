//
//  HeaderCollectionReusableView.swift
//  WiredBrainCoffee
//
//  Created by Clayton Orman on 12/30/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var headerLabel: UILabel!
    
    func setup(count: Int) {
        headerLabel.text = "Colors: \(count)"
    }
}
