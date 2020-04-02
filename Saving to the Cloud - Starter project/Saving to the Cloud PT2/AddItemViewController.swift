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
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
//               --- UIKIT ELEMENTS ---               //


    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var itemName: UITextField!
    @IBOutlet weak var itemPrice: UITextField!
    
    @IBAction func tappedButton(_ sender: UIButton) {
        
        
        // DISMISS MODAL VIEW
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
