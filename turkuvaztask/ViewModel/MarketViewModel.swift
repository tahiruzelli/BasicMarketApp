//
//  MarketViewModel.swift
//  turkuvaztask
//
//  Created by Tahir Uzelli on 23.08.2022.
//

import Foundation
import Alamofire


class MarketViewModel{
    var itemList : [Item]?
    
    var reloadTableViewClosure: (()->())?
    
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
