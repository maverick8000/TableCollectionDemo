//
//  TableDemoViewController.swift
//  TableCollectionDemo
//
//  Created by Consultant on 7/6/22.
//

import UIKit

class TableDemoViewController: UIViewController {
    
    @IBOutlet weak var demoTableView: UITableView!
    
    var swapState = true {
        didSet {
            DispatchQueue.main.async {
                self.demoTableView.reloadData()
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.demoTableView.backgroundColor = .systemCyan
        self.demoTableView.dataSource = self
        // MARK: Register cell if not directly creating on storyboard
        self.demoTableView.register(UINib(nibName: "XIBDemoTableViewCell", bundle: nil), forCellReuseIdentifier: "XIBDemoTableViewCell")
        

        // Do any additional setup after loading the view.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func swapImplementationButtonPressed(_ sender: UIButton) {
        
        self.swapState.toggle()
        
    }
    

}

extension TableDemoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if self.swapState {
            return "XIB - Section: \(section)"
        } else {
            return "Storyboard - Section: \(section)"
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.swapState {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "XIBDemoTableViewCell", for: indexPath) as? XIBDemoTableViewCell else {return UITableViewCell()}
            
            cell.configure(imageStr: "goldendragon", indexPath: indexPath)
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryboardDemoTableViewCell", for: indexPath) as? StoryboardDemoTableViewCell else {return UITableViewCell()

            }

            // Configure UI
    //        cell.demoImageView.image = UIImage(named: "bluedragon")
            cell.configure(imageStr: "bluedragon", indexPath: indexPath)

            return cell
            
        }
        
        
    }
    
}
