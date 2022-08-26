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
    
    var item : Item?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func set(item : [Item]){
        titleLabel.text = item.first!.name
        priceLabel.text = item.first!.currency + String(item.first!.price)
        productImage.kf.setImage(with: URL(string: item.first!.imageURL))
        selectedCountButton.setTitle(String(item.count), for: .normal)
    }
    
    @IBAction func removeButtonAction(_ sender: Any) {
        let index = itemInBasket.firstIndex {$0.id == item!.id}
        itemInBasket.remove(at: index ?? 0)
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        itemInBasket.append(item!)
    }
}
