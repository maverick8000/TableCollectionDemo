//
//  StoryboardDemoCollectionViewCell.swift
//  TableCollectionDemo
//
//  Created by Consultant on 7/7/22.
//

import UIKit

class StoryboardDemoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var demoImageView: UIImageView!
    
    @IBOutlet weak var demoLabel: UILabel!
    
    func configure(imageStr: String, indexPath: IndexPath) {
        self.demoImageView.image = UIImage(named: imageStr)
        self.demoLabel.text = "SB - Index> \(indexPath)"
    }
    
}
