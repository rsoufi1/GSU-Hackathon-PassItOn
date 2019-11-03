//
//  OrderPlacedViewController.swift
//  HackGSU State Farm Challenge
//
//  Created by Raneem Sofi on 11/2/19.
//  Copyright © 2019 Raneem Sofi. All rights reserved.
//

import UIKit

var totalChinise: Double = 0
var totalMex: Double = 0
var totalBurger: Double = 0

class OrderPlacedViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet var MainLabel: UILabel!
    @IBOutlet var PriceLabel: UILabel!
    @IBOutlet var SummaryLabel: UILabel!
    @IBOutlet var TableViewSummary: UITableView!
    @IBOutlet var ReturnButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let temp = String(format: "%.2f", sum)
        self.PriceLabel.text = "$" + temp
        
        self.ReturnButton.layer.cornerRadius = 10
        self.ReturnButton.clipsToBounds = true
    }
    
    @IBAction func ReturnButtonPressed(_ sender: Any) {
        /*
         let defaults = UserDefaults.standard
         let defaultValue = ["onboard" : "false"]
         defaults.register(defaults: defaultValue)
         
         */
        
        let defaults = UserDefaults.standard
        var numberEntries = defaults.integer(forKey: "numberEntries")
        numberEntries+=1
        
        let date = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        let compactedDate = String(month) + "/" + String(day) + "/" + String(year)
        
        var dateKey = "date" + String(numberEntries)
        var foodKey = "food" + String(numberEntries)
        var priceKey = "price" + String(numberEntries)
        var totalKey = "total" + String(numberEntries)
        
        var dateEntry = [dateKey: compactedDate]
        var foodEntry = [foodKey: currentSelectionItems]
        var priceEntry = [priceKey: currentSelectionPrices]
        var totalEntry = [totalKey: sum]
        
        defaults.register(defaults: dateEntry)
        defaults.register(defaults: foodEntry)
        defaults.register(defaults: priceEntry)
        defaults.register(defaults: totalEntry)
        defaults.set(numberEntries, forKey: "numberEntries")
        defaults.synchronize()
        
        defaults.set(compactedDate, forKey: dateKey)
        defaults.set(currentSelectionItems, forKey: foodKey)
        defaults.set(currentSelectionPrices, forKey: priceKey)
        defaults.set(sum, forKey: totalKey)
        defaults.synchronize()
        
        let addPoints = Int(sum/2)
        let currentPoints = defaults.integer(forKey: "points")
        defaults.set((currentPoints + addPoints), forKey: "points")
        defaults.synchronize()
        
        
        currentSelectionItems = []
        currentSelectionPrices = []
        totalChinise = sumChinese
        totalMex = sumMex
        totalBurger = sumBurger
        
        sum = 0
        sumBurger = 0
        sumMex = 0
        sumChinese = 0
        self.dismiss(animated: true, completion: nil)
    }
    

}

extension OrderPlacedViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentSelectionItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryCell")as! SummaryCell
            let view = UIView()
            view.backgroundColor = UIColor.white
            cell.selectedBackgroundView? = view
            
        cell.Name.text = currentSelectionItems[indexPath.item]
        cell.Price.text = currentSelectionPrices[indexPath.item]
            
        return cell
    
    }
    
    
}

//SummaryCell
class SummaryCell: UITableViewCell{
    
    @IBOutlet var Price: UILabel!
    @IBOutlet var Name: UILabel!
}
