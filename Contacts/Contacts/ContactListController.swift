//
//  ContactListController.swift
//  Contacts
//
//  Created by Jordi Farras Mañe on 21/12/2018.
//  Copyright © 2018 Jordi Farras Mañe. All rights reserved.
//

import UIKit

extension Contact{
    
    var  firstLetter: String{
        
        return String(firstName.characters.first!)
    }
}
extension ContactsSource{
    static var sortedUniqueLetters: [String] {

        let firstLetters = contacts.map{$0.firstLetter}
        let uniqueLetters = Set(firstLetters)
       
        return Array(uniqueLetters).sorted()
       
    }
    
    static var sectionedContacts: [[Contact]]{
        
        return sortedUniqueLetters.map{ firstLetter in
            let filterContacts = contacts.filter{$0.firstLetter == firstLetter}
    
            return filterContacts.sorted(by: {$0.firstName < $1.firstName})
            }
    }
}


class ContactListController: UITableViewController {
    
    var sectionedContacts = ContactsSource.sectionedContacts
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionedContacts.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //var a = sectionedContacts[section].count
       return sectionedContacts[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)

        let contact = sectionedContacts[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = contact.firstName
        cell.imageView?.image = contact.image
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue,sender: Any?){
        if segue.identifier == "showContact"{
            
            if let indexPath = tableView.indexPathForSelectedRow{
                
                let contact = sectionedContacts[indexPath.section][indexPath.row]

                guard let navigationController = segue.destination as? UINavigationController,
                    let contactDetailController = navigationController.topViewController as? ContactDetailController
                    else{return}
                
                contactDetailController.contact = contact
                
            }
            
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
