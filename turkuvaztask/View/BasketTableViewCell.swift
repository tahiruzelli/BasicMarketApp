//
//  BasketTableViewCell.swift
//  turkuvaztask
//
//  Created by Tahir Uzelli on 24.08.2022.
//

import UIKit

class BasketTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var selectedCountButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func set(item : Item){}
    
    @IBAction func removeButtonAction(_ sender: Any) {
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
    }
}
