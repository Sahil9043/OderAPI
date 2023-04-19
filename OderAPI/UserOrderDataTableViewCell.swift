//
//  UserOrderDataTableViewCell.swift
//  OderAPI
//
//  Created by Lalaiya Sahil on 13/02/23.
//

import UIKit

class UserOrderDataTableViewCell: UITableViewCell {

    @IBOutlet weak var orderImage: UIImageView!
    @IBOutlet weak var reOrderButton: UIButton!
    @IBOutlet weak var cancelButtton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var orderTxtLabel: UILabel!
    @IBOutlet weak var vNameLabel: UILabel!
    @IBOutlet weak var orderSatusLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var orderIdLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
