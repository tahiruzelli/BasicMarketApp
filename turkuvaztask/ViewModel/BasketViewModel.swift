//
//  BasketViewModel.swift
//  turkuvaztask
//
//  Created by Tahir Uzelli on 23.08.2022.
//

import Foundation
import Alamofire

class BasketViewModel {

    func approveBasket(){
        let request = AF.request(orderBasketUrl)
        request.responseJSON { (data) in
            request.responseDecodable(of: OrderResponse.self) { (response) in
              guard let orderResponse = response.value else { return }
                print(orderResponse.data.status)
            }
        }
    }
    
}
