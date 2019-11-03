//
//  SelectRestaurantViewController.swift
//  HackGSU State Farm Challenge
//
//  Created by Raneem Sofi on 11/2/19.
//  Copyright © 2019 Raneem Sofi. All rights reserved.
//

import UIKit

var selectedItems = [(Int, String)]()

class SelectRestaurantViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet var TitleLabel: UILabel!
    @IBOutlet var RestaurantTableView: UITableView!
    
    var restaurantList = ["Fantastic Burgers", "New China", "Tex Mex"]
    var restaurantImages = ["Burger", "Orange Chicken", "Chicken Tacos"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        if let index = self.RestaurantTableView.indexPathForSelectedRow{
            self.RestaurantTableView.deselectRow(at: index, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMenuList"{
            let vc = segue.destination as! SelectItemViewController
            let cell = sender as! SelectRestaurantCell
            vc.chosenRestaurant = cell.Name.text ?? "none"
        }
    }
    
}

extension SelectRestaurantViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectRestaurant") as! SelectRestaurantCell
        cell.Name.text = restaurantList[indexPath.item]
        cell.imageRestaurant.image = UIImage.init(named: restaurantImages[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
}

class SelectRestaurantCell: UITableViewCell{
    
    @IBOutlet var Name: UILabel!
    
    @IBOutlet var imageRestaurant: UIImageView!
}
