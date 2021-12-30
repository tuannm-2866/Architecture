//
//  ProductsCell.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 29/12/2021.
//

import UIKit
import Reusable

class ProductsCell: UITableViewCell, NibReusable {

    @IBOutlet weak var deleteProductButton: UIButton!
    @IBOutlet weak var editProductButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
