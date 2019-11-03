//
//  SelectItemViewController.swift
//  HackGSU State Farm Challenge
//
//  Created by Raneem Sofi on 11/2/19.
//  Copyright © 2019 Raneem Sofi. All rights reserved.
//

import UIKit

class SelectItemViewController: UIViewController {

    @IBOutlet var TitleLabel: UILabel!
    @IBOutlet var ReturnButton: UIButton!
    @IBOutlet var SelectItemTableView: UITableView!
    
    var chosenRestaurant = "none"
    var fantasticBurgersItems = ["Burger", "Bacon Cheeseburger", "Fries", "Chicken Tenders", "Tater Tots"]
    var fantasticBurgersPrices = [5.99, 6.99, 2.99, 4.99, 1.99]
    
    var newChinaItems = ["Orange Chicken", "Sesame Chicken", "Teriyaki Chicken", "Fried Rice", "Steamed Rice", "Egg Roll", "Spring Roll"]
    var newChinaPrices = [5.99, 5.99, 5.99, 1.99, 0.99, 1.99, 1.99]
    
    var texMexItems = ["Chicken Tacos", "Veggie Tacos", "Quesidilla", "Fajita", "Rice and Beans", "Side Salad"]
    var texMexPrices = [7.99, 5.99, 7.99, 10.99, 2.99, 3.99]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TitleLabel.text = chosenRestaurant
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ReturnButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let index = self.SelectItemTableView.indexPathForSelectedRow{
            self.SelectItemTableView.deselectRow(at: index, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toItemList"{
            let vc = segue.destination as! AddItemFinalViewController
            let cell = sender as! MenuItemsTableViewCell
            vc.menuItem = cell.Name.text ?? "none"
            vc.menuPrice = cell.Price.text ?? "none"
            vc.chosenRestaurant = chosenRestaurant
        }
    }
    
    
    
    
}

extension SelectItemViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if chosenRestaurant == "Fantastic Burgers"{
            return fantasticBurgersItems.count
        }
        else if chosenRestaurant == "New China"{
            return newChinaItems.count
        }
        else if chosenRestaurant == "Tex Mex"{
            return texMexItems.count
        }
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuItems") as! MenuItemsTableViewCell
        
        if chosenRestaurant == "Fantastic Burgers"{
            cell.Name.text = fantasticBurgersItems[indexPath.item]
            cell.Price.text = String(fantasticBurgersPrices[indexPath.item])
        }
        else if chosenRestaurant == "New China"{
            cell.Name.text = newChinaItems[indexPath.item]
            cell.Price.text = String(newChinaPrices[indexPath.item])
        }
        else if chosenRestaurant == "Tex Mex"{
            cell.Name.text = texMexItems[indexPath.item]
            cell.Price.text = String(texMexPrices[indexPath.item])
        }
        return cell
    }
    
    
}


class MenuItemsTableViewCell: UITableViewCell{
    @IBOutlet var Name: UILabel!
    @IBOutlet var Price: UILabel!
}
