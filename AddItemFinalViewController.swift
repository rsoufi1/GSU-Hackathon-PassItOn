//
//  AddItemFinalViewController.swift
//  HackGSU State Farm Challenge
//
//  Created by Raneem Sofi on 11/2/19.
//  Copyright © 2019 Raneem Sofi. All rights reserved.
//

import UIKit

var currentSelectionItems = [String]()
var currentSelectionPrices = [String]()
var sum: Double = 0.0

var sumBurger: Double = 0.0
var sumChinese: Double = 0.0
var sumMex: Double = 0.0

class AddItemFinalViewController: UIViewController {

    @IBOutlet var foodImage: UIImageView!
    @IBOutlet var ItemName: UILabel!
    
    @IBOutlet var ItemDescription: UILabel!
    @IBOutlet var AddToCartButton: UIButton!
    @IBOutlet var CancelButton: UIButton!
    
    var chosenRestaurant = "none"
    var menuItem = "none"
    var menuPrice = "none"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ItemName.text = menuItem
        self.ItemDescription.text = "$" + menuPrice
        self.foodImage.image = UIImage.init(named: menuItem)
        // Do any additional setup after loading the view.
        self.AddToCartButton.layer.cornerRadius = 10
        self.AddToCartButton.clipsToBounds = true
        self.CancelButton.layer.cornerRadius = 10
        self.CancelButton.clipsToBounds = true
    }

    @IBAction func AddButtonPressed(_ sender: Any) {
        currentSelectionItems.append(menuItem)
        currentSelectionPrices.append(menuPrice)
        sum = sum + (Double(menuPrice) ?? 0)
        print(sum)
        print((Double(menuPrice) ?? 0))
        
        print(currentSelectionItems)
        print(currentSelectionPrices)
        
        
        if chosenRestaurant == "Fantastic Burgers"{
            sumBurger = sumBurger + (Double(menuPrice) ?? 0)
        }
        else if chosenRestaurant == "New China"{
            sumChinese = sumChinese + (Double(menuPrice) ?? 0)
        }
        else if chosenRestaurant == "Tex Mex"{
            sumMex = sumMex + (Double(menuPrice) ?? 0)
        }
        print(sumBurger)
        print(sumChinese)
        print(sumMex)
        print()
        print()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func CancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
