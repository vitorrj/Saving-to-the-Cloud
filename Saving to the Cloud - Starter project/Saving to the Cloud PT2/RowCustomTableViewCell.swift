//
//  RowCustomTableViewCell.swift
//  Saving to the Cloud PT2
//
//  Created by Davide Russo on 30/03/2020.
//  Copyright © 2020 Marco Amorosi. All rights reserved.
//

import UIKit

class RowCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var clipp: UIView!{
        didSet {
            self.clipp.layer.cornerRadius = 7
            self.clipp.layer.borderWidth = 0.8
            self.clipp.layer.borderColor = UIColor.clear.cgColor
            self.clipp.layer.masksToBounds = false
            self.clipp.layer.shadowColor = UIColor.gray.cgColor
            self.clipp.layer.shadowOffset = CGSize(width: 0, height: 0.6)
            self.clipp.layer.shadowRadius = 0.8
            self.clipp.layer.shadowOpacity = 0.8
            self.clipp.layer.shadowPath = UIBezierPath(roundedRect: self.clipp.bounds, cornerRadius: self.clipp.layer.cornerRadius).cgPath
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
