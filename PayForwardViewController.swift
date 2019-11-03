//
//  PayForwardViewController.swift
//  HackGSU State Farm Challenge
//
//  Created by Raneem Sofi on 11/2/19.
//  Copyright © 2019 Raneem Sofi. All rights reserved.
//

import UIKit

var firstTimeOnScreen = true
class PayForwardViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet var BackButton: UIButton!
    @IBOutlet var ConfirmPayForwardButton: UIButton!
    
    
    @IBOutlet var MealTotalPriceLabel: UILabel!
    @IBOutlet var MealTotalLabel: UILabel!
    @IBOutlet var PayForward: UILabel!
    @IBOutlet var PercentLabel: UILabel!
    
    @IBOutlet var NewTotalLabel: UILabel!
    
    @IBOutlet var EnterPercentTextField: UITextField!
    
    @IBOutlet var NewTotalPriceLabel: UILabel!
    
    var totalTemp: Double = 0.00
    var tempChinise: Double = 0.00
    var tempMex: Double = 0.00
    var tempBurger: Double = 0.00
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.MealTotalPriceLabel.text = "$" + String(sum)
        let newTotal = sum + (sum*0.5)
        
        totalTemp = newTotal
        tempChinise = sumChinese*0.5
        tempMex = sumMex*0.5
        tempBurger = sumBurger*0.5
        
        let numString: String = String(format: "%.2f", newTotal)
        
        self.NewTotalPriceLabel.text = "$" + numString
        
        self.ConfirmPayForwardButton.layer.cornerRadius = 10
        self.ConfirmPayForwardButton.clipsToBounds = true
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "movingForward"{
            firstTimeOnScreen = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if firstTimeOnScreen{
            
        }
        else{
            firstTimeOnScreen = true
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func BackButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func EditingDone(_ sender: UITextField) {
        let number = sender.text
        let num:Double = (Double(number ?? "0.0")!)/100.0
        let newTotal = sum + (sum*num)
        let numString: String = String(format: "%.2f", newTotal)
        totalTemp = newTotal
        self.NewTotalPriceLabel.text = "$" + numString
        
        tempChinise = sumChinese*num
        tempMex = sumMex*num
        tempBurger = sumBurger*num
    }
    
    @IBAction func ConfirmPayButtonPressed(_ sender: Any) {
       let numString: String = String(format: "%.2f", totalTemp-sum)
        currentSelectionItems.append("Act of Kindness")
        currentSelectionPrices.append(numString)
        
        sum = totalTemp
    }
    
}

extension PayForwardViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
        self.view.endEditing(true)
        return false
    }
}

