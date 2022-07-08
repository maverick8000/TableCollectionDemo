//
//  XIBDemoCollectionViewCell.swift
//  TableCollectionDemo
//
//  Created by Consultant on 7/7/22.
//

import UIKit

class XIBDemoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var demoImageView: UIImageView!
    
    @IBOutlet weak var demoLabel: UILabel!
    
    func configure(imageStr: String, indexPath: IndexPath) {
        
        self.demoImageView.image = UIImage(named: imageStr)
        
        self.demoLabel.text = "XIB - \(indexPath)"
        
    }

}
