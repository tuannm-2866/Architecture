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
    
    var deleteProduct: (() -> Void)?
    var editProduct: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction private func deleteProductAction(_ sender: Any) {
        deleteProduct?()
    }
    
    @IBAction private func editProductAction(_ sender: Any) {
        editProduct?()
    }
}
