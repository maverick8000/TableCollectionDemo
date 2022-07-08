//
//  CollectionDemoViewController.swift
//  TableCollectionDemo
//
//  Created by Consultant on 7/7/22.
//

import UIKit

class CollectionDemoViewController: UIViewController {

    @IBOutlet weak var demoCollectionView: UICollectionView!
    
    var swapState = true {
        
        didSet {
            DispatchQueue.main.async {
                self.demoCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.demoCollectionView.dataSource = self

        // MARK: Register cell for non storyboard creation
        self.demoCollectionView.register(UINib(nibName: "XIBDemoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "XIBDemoCollectionViewCell")
        
    }
    
    @IBAction func swapImplementationButtonPressed(_ sender: Any) {
        
        self.swapState.toggle()
        
    }
    
}

extension CollectionDemoViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.swapState {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryboardDemoCollectionViewCell", for: indexPath) as? StoryboardDemoCollectionViewCell else {return UICollectionViewCell()}
            
            cell.configure(imageStr: "goldendragon", indexPath: indexPath)
            
            return cell
            
            
        } else {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "XIBDemoCollectionViewCell", for: indexPath) as? XIBDemoCollectionViewCell else {return UICollectionViewCell()}
            
            cell.configure(imageStr: "reddragon", indexPath: indexPath)
            
            return cell
        }
        
    }

    
}
