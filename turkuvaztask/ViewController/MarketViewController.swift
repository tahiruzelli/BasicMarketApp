//
//  MarketViewController.swift
//  turkuvaztask
//
//  Created by Tahir Uzelli on 23.08.2022.
//

import UIKit

class MarketViewController: BaseViewController {
    
    @IBOutlet weak var itemInBasketCountLabel: UILabel!
    @IBOutlet weak var itemCollectionView: UICollectionView!
    lazy var viewModel: MarketViewModel = {
          return MarketViewModel()
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initVM()
        
        itemCollectionView.dataSource = self
        itemCollectionView.delegate = self
    
    }
    
    func initVM(){
        viewModel.reloadTableViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self!.itemCollectionView.reloadData()
                
            }
        }
        viewModel.getProductList()
    }
    @IBAction func addButtonAction(_ sender: Any) {
        itemInBasketCountLabel.text = String(itemInBasket.count)
    }
    @IBAction func removeButtonAction(_ sender: Any) {
        itemInBasketCountLabel.text = String(itemInBasket.count)
    }
    @IBAction func toBasketButtonAction(_ sender: Any) {
        print("to basket action")
    }
}

extension MarketViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.itemList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MarketCollectionViewCell", for: indexPath) as! MarketCollectionViewCell
        cell.set(item: self.viewModel.itemList![indexPath.row])
        return cell
    }
}
