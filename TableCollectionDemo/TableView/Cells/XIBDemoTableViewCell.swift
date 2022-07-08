//
//  XIBDemoTableViewCell.swift
//  TableCollectionDemo
//
//  Created by Consultant on 7/6/22.
//

import UIKit

class XIBDemoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var demoImageView: UIImageView!
    
    @IBOutlet weak var demoTopLabel: UILabel!
    
    @IBOutlet weak var demoBottomLabel: UILabel!
    
    func configure(imageStr: String, indexPath: IndexPath) {
        
        self.demoImageView.image = UIImage(named: imageStr)
        self.demoTopLabel.text = "IndexPath: \(indexPath)"
        self.demoBottomLabel.text = "XIB Implementation"
        
    }
    
}
