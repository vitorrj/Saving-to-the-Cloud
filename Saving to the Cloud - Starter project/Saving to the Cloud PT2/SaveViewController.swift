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


    }

    
//               --- CLOUDKIT ELEMENTS ---               //


    
    
//       --- TABLE VIEW CONTROLLER ELEMENTS ---          //
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! RowCustomTableViewCell
        return cell
    }


    

}
