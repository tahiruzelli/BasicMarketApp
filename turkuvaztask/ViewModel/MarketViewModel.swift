//
//  MarketViewModel.swift
//  turkuvaztask
//
//  Created by Tahir Uzelli on 23.08.2022.
//

import Foundation
import Alamofire

var itemInBasket : [Item] = []

class MarketViewModel{
    var itemList : [Item]?
        
    var reloadTableViewClosure: (()->())?
    
    func addItemToBasket(item : Item){
        itemInBasket.append(item)
    }
    
    func removeItemFromBasket(item : Item){
        let index = itemInBasket.firstIndex {$0.id == item.id}
        itemInBasket.remove(at: index ?? 0)
    }
    
    func getProductList(){
        let request = AF.request(getProductListUrl)
        request.responseJSON { (data) in
            request.responseDecodable(of: Product.self) { [self] (response) in
              guard let product = response.value else { return }
                self.itemList = product.data
                reloadTableViewClosure!()
            }
        }
    }
    
    
    
    
    
}
