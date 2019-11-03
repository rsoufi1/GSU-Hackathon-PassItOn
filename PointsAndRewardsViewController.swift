//
//  PointsAndRewardsViewController.swift
//  HackGSU State Farm Challenge
//
//  Created by Raneem Sofi on 11/3/19.
//  Copyright © 2019 Raneem Sofi. All rights reserved.
//

import UIKit

class PointsAndRewardsViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet var ReturnButton: UIButton!
    @IBOutlet var MainTitle: UILabel!
    @IBOutlet var SquareView: UIView!
    
    @IBOutlet var AmountOfPointsRemaining: UILabel!
    
    @IBOutlet var UntilYourLabel: UILabel!
    @IBOutlet var PassItOnButton: UIButton!
    
    @IBOutlet var YourTotalNumOfPointsLabel: UILabel!
    @IBOutlet var LabelToShowAmountOfPointsTotal: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.SquareView.layer.cornerRadius = 10
        self.SquareView.clipsToBounds = true
        
        //self.ReturnButton.tintColor = UIColor.green
        //self.PassItOnButton.backgroundColor = UIColor.green
        self.PassItOnButton.tintColor = UIColor.white
        self.PassItOnButton.layer.cornerRadius = 10
        self.PassItOnButton.clipsToBounds = true
        
        let defaults = UserDefaults.standard
        let points = defaults.integer(forKey: "points")
        self.LabelToShowAmountOfPointsTotal.text = String(points)
        let pointsRemaining = 300 - points
        self.AmountOfPointsRemaining.text = String(pointsRemaining) + " Points"
    }
    
    @IBAction func ReturnButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func ReferButtonPressed(_ sender: Any) {
        
    }
    
    

}
