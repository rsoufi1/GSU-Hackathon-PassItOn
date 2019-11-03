//
//  CheckOutViewController.swift
//  HackGSU State Farm Challenge
//
//  Created by Raneem Sofi on 11/2/19.
//  Copyright © 2019 Raneem Sofi. All rights reserved.
//

import UIKit

class CheckOutViewController: UIViewController {

    @IBOutlet var PayForward: UIButton!
    
    @IBOutlet var ContCheckout: UIButton!
    @IBOutlet var CheckoutTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       self.ContCheckout.layer.cornerRadius = 10
        self.ContCheckout.clipsToBounds = true
        self.PayForward.layer.cornerRadius = 10
        self.PayForward.clipsToBounds = true
        self.CheckoutTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.CheckoutTableView.reloadData()
        
        if let index = self.CheckoutTableView.indexPathForSelectedRow{
            self.CheckoutTableView.deselectRow(at: index, animated: true)
        }
    }

}

extension CheckOutViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentSelectionItems.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item < currentSelectionItems.count{
            let cell = tableView.dequeueReusableCell(withIdentifier: "checkOutCell")as! CheckOutCell
            let view = UIView()
            view.backgroundColor = UIColor.white
            cell.selectedBackgroundView? = view
            
            cell.Name.text = currentSelectionItems[indexPath.item]
            cell.Price.text = currentSelectionPrices[indexPath.item]
            
                return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "checkOutTotalCell")as! CheckOutTotalCell
            let view = UIView()
            view.backgroundColor = UIColor.white
            cell.selectedBackgroundView? = view
            cell.Price.text = String(sum)
            print(sum)
            
                return cell
        }
        

    }
    
    
}

//checkOutCell

class CheckOutCell: UITableViewCell{
    @IBOutlet var Name: UILabel!
    @IBOutlet var Price: UILabel!
    
}

//checkOutTotalCell
class CheckOutTotalCell: UITableViewCell{
    @IBOutlet var Price: UILabel!
    @IBOutlet var Total: UILabel!
}
