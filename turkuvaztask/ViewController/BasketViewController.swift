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
    override func viewDidLoad() {
        super.viewDidLoad()
        basketTableView.dataSource = self
        basketTableView.delegate = self

        
    }
    @IBAction func approveBasketAction(_ sender: Any) {
    }
}

extension BasketViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketTableViewCell", for: indexPath) as! BasketTableViewCell
//        cell.set(item: nil)
           return cell
    }
}
