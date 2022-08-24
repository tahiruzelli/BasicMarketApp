//
//  MarketCollectionViewCell.swift
//  turkuvaztask
//
//  Created by Tahir Uzelli on 24.08.2022.
//

import UIKit
import Kingfisher

class MarketCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var selectedCountButton: UIButton!
    
    var selectedCount = 0
    
    var item : Item?
    
    func set(item : Item){
        self.item = item
        priceLabel.text = item.currency+String(item.price)
        nameLabel.text = item.name
        imageView.kf.setImage(with: URL(string: item.imageURL))
        removeButton.isHidden = true
        selectedCountButton.isHidden = true
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        if item!.stock > selectedCount {
            selectedCount += 1
            selectedCountButton.setTitle(String(selectedCount), for: .normal)
        }else{
            print("no stock")
        }
        
        removeButton.isHidden = false
        selectedCountButton.isHidden = false
    }
    @IBAction func removeButtonAction(_ sender: Any) {
        print("remove tapped")
        if selectedCount < 1 {
            print("can not be less than 0")
        }else{
            selectedCount -= 1
            selectedCountButton.setTitle(String(selectedCount), for: .normal)
            if selectedCount == 0{
                removeButton.isHidden = true
                selectedCountButton.isHidden = true
            }
        }
        

    }
}
