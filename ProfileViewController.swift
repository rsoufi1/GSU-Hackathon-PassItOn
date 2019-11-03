//
//  ProfileViewController.swift
//  HackGSU State Farm Challenge
//
//  Created by Raneem Sofi on 11/2/19.
//  Copyright © 2019 Raneem Sofi. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    //MARK: Profile View
    @IBOutlet var TableViewProfile: UITableView!
    @IBOutlet var ProfileLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
   
        if let index = self.TableViewProfile.indexPathForSelectedRow{
            self.TableViewProfile.deselectRow(at: index, animated: true)
        }
    }
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionHistory") as! ProfileCells
            return cell
        }
        else if indexPath.item == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Points") as! ProfileCells
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Personal") as! ProfileCells
            return cell
        }
    }
    
    
}

class ProfileCells: UITableViewCell{
    @IBOutlet var Label: UILabel!
    
}
//TransactionHistory
//Stats
//Personal
