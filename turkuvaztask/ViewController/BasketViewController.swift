//
//  BasketViewController.swift
//  turkuvaztask
//
//  Created by Tahir Uzelli on 23.08.2022.
//

import UIKit

class BasketViewController: BaseViewController {
    @IBOutlet weak var totalCountLabel: UILabel!
    @IBOutlet weak var basketTableView: UITableView!
    
    var groupedItems : [String : [Item]] = [:]
    var groupedItemIds : [String] = []
    
    lazy var viewModel: BasketViewModel = {
          return BasketViewModel()
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupItems()
        totalCountLabel.text = String(calculateTotalCount(items: itemInBasket))
        basketTableView.dataSource = self
        basketTableView.delegate = self
    }
    
    func groupItems(){
        for item in itemInBasket {
            if groupedItems.keys.contains(item.id) { // if item exist
                var tmpArray = groupedItems[item.id]
                tmpArray?.append(item)
                groupedItems[item.id] = tmpArray
            }else{
                groupedItems[item.id] = [item]
                groupedItemIds.append(item.id)
            }
        }
    }
    
    func calculateTotalCount(items : [Item]) -> Double {
        var total = 0.0
        for item in items {
            total = total + item.price
        }
        return total
    }
    
    @IBAction func approveBasketAction(_ sender: Any){
        viewModel.approveBasket()
    }
}

extension BasketViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketTableViewCell", for: indexPath) as! BasketTableViewCell
        cell.set(item: groupedItems[groupedItemIds[indexPath.row]] ?? [])
        return cell
    }
}
