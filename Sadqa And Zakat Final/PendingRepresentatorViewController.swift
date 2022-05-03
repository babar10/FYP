//
//  PendingRepresentatorViewController.swift
//  Sadqa And Zakat Final
//
//  Created by Apple on 30/04/2022.
//

import UIKit

class PendingRepresentatorViewController: UIViewController {
    var rep = RepresentatorManager()
    var representator : [Representator] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        representator = rep.getPendingRepresentator()
        // Do any additional setup after loading the view.
    }
}
extension PendingRepresentatorViewController : UITableViewDelegate ,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representator.count
    }
    //some changes
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "PendingTableViewCell") as! PendingTableViewCell
        let represent = representator[indexPath.row]
        cell.lblName.text = represent.Name
        cell.lblCnic.text = represent.Cnic
        return cell
    }
    
    
}
