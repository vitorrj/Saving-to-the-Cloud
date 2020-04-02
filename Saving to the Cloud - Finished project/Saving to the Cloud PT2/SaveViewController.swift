//
//  SaveViewController.swift
//  Saving to the Cloud PT2
//
//  Created by Davide Russo on 29/03/2020.
//  Copyright © 2020 Vitor Jacinto. All rights reserved.
//

import UIKit
import CloudKit

class SaveViewController: UITableViewController {
    
    let database = CKContainer.default().privateCloudDatabase
    var itemsRecord = [CKRecord]()


    override func viewDidLoad() {
        super.viewDidLoad()
        queryDatabase()
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        refreshControl.addTarget(self, action: #selector(queryDatabase), for: .valueChanged)
        self.tableView.refreshControl = refreshControl

    }

    
//               --- CLOUDKIT ELEMENTS ---               //


    @objc func queryDatabase() {
        let query = CKQuery(recordType: "StoreDatabase", predicate: NSPredicate(value: true))
        
        database.perform(query, inZoneWith: nil) { (record, _) in
            guard let records = record else { return }
            self.itemsRecord = records
            print("finish")
            DispatchQueue.main.async {
                self.tableView.refreshControl?.endRefreshing()
                self.tableView.reloadData()
            }
        
        }
    }
    
    
//       --- TABLE VIEW CONTROLLER ELEMENTS ---          //
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsRecord.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! RowCustomTableViewCell
        let note = itemsRecord[indexPath.row].value(forKey: "Name") as! String
        let val = itemsRecord[indexPath.row].value(forKey: "Price") as! String
    
        cell.name.text = note
        cell.price.text = val + " $"
        return cell
    }

    func deleteRecordWithID(_ recordID: CKRecord.ID, completion: ((_ recordID: CKRecord.ID?, _ error: Error?) -> Void)?) {

        database.delete(withRecordID: recordID) { (recordID, error) in
            completion?(recordID, error)
            print("deleted")
            self.queryDatabase()
            
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.deleteRecordWithID(self.itemsRecord[indexPath.row].recordID, completion: nil)
    }

}
