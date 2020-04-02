//
//  AddItemViewController.swift
//  Saving to the Cloud 
//
//  Created by Vitor Jacinto on 29/03/2020.
//  Copyright © 2020 Vitor Jacinto. All rights reserved.
//

import UIKit
import CloudKit

class AddItemViewController: UIViewController {
    
    let database = CKContainer.default().privateCloudDatabase

    struct storeItem {
        var name: String
        var price: String
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func saveToCloud(itemName: String, itemPrice: String) {
        let newItem = CKRecord(recordType: "StoreDatabase")
        newItem.setValue(itemName, forKey: "Name")
        newItem.setValue(itemPrice, forKey: "Price")
        
        self.database.save(newItem) { (record, _) in
            guard record != nil else { return }
            print("Saved record to iCloud")
        }
    }
//               --- UIKIT ELEMENTS ---               //


    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var itemName: UITextField!
    @IBOutlet weak var itemPrice: UITextField!
    
    @IBAction func tappedButton(_ sender: UIButton) {
        let item = storeItem(name: itemName.text!, price: itemPrice.text!)
        self.saveToCloud(itemName: item.name, itemPrice: item.price)
        
//        DISMISS MODAL VIEW
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
//
}
