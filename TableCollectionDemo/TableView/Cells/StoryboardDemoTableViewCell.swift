//
//  StoryboardDemoTableViewCell.swift
//  TableCollectionDemo
//
//  Created by Consultant on 7/6/22.
//

import UIKit

class StoryboardDemoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var demoImageView: UIImageView!
    @IBOutlet weak var demoLabel: UILabel!
    @IBOutlet weak var demoSlider: UISlider!
    
    var indexPath: IndexPath?
    var value: Float?
    
    func configure(imageStr: String, indexPath: IndexPath) {
        
        self.demoImageView.image = UIImage(named: imageStr)
        self.indexPath = indexPath
        self.demoLabel.text = "\(indexPath) : Slider Value - \(Int(self.demoSlider.value * 100))"
        
        self.demoSlider.value = self.value ?? 0.5
        
    }
    
    
    @IBAction func demoSliderValueChanged(_ sender: UISlider) {
        
        self.value = sender.value
        self.demoLabel.text = "\(indexPath ?? IndexPath(row: 0, section: 0)) : Slider Value - \(Int(sender.value * 100))"
        
    }
    
    
    
}
