//
//  ContactDetailController.swift
//  Contacts
//
//  Created by Jordi Farras Mañe on 21/12/2018.
//  Copyright © 2018 Jordi Farras Mañe. All rights reserved.
//

import UIKit

class ContactDetailController: UITableViewController {

    var contact:Contact?
    
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        displayContactInfo()
    }

    func displayContactInfo(){
        guard let contact =  contact else{
            return
        }
        phoneLabel.text = contact.phone
        mailLabel.text = contact.email
        streetLabel.text = contact.street
        cityLabel.text = contact.city
        stateLabel.text = contact.state
        zipLabel.text = contact.zip

    }
    

}
