//
//  ViewController.swift
//  OderAPI
//
//  Created by Lalaiya Sahil on 13/02/23.
//

import UIKit
import Alamofire

class `OnlineUswerViewController`: UIViewController {
    @IBOutlet weak var userOrderTabelView: UITableView!
    var arrOfrder: UserDetails!
    override func viewDidLoad() {
        super.viewDidLoad()
        userOrderDetails()
        configureClass()
    }
    
    private func userOrderDetails(){
        AF.request("// https://myct.store/Mobile_Services/user/v2/index.php/get_order/8", method: .post).responseData { response in debugPrint("Response \(response)")
            if response.response?.statusCode == 200{
                guard let apiData = response.data else { return }
                do{
                    let userDetails = try JSONDecoder().decode(UserDetails.self, from: apiData)
                    self.arrOfrder = (userDetails)
                    self.userOrderTabelView.reloadData()
                    print(userDetails)
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    func configureClass(){
        let nibFile: UINib = UINib(nibName: "UserOrderDataTableViewCell", bundle: nil)
        
        userOrderTabelView.register(nibFile, forCellReuseIdentifier: "UserOrderDataTableViewCell")
    }
    
    
}

struct UserDetails: Decodable{
    var error: Bool
    var data: [Data]
}
struct Data: Decodable{
    var orderId: String
    var totalPrice: String
    var dateTime: String
    var vImage: String
    var orderStatus: String
    var vName: String
    
    private enum CodingKeys: String, CodingKey{
        case oederId = "Order_id"
        case totalPrice = "total_price"
        case dateTime = "date_time"
        case orderStatus = "order_status"
        case vName = "vname"
    }

}
extension OnlineUswerViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfrder?.data.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserOrderDataTableViewCell = tableView.dequeueReusableCell(withIdentifier: "UserOrderDataTableViewCell") as! UserOrderDataTableViewCell
        cell.orderIdLabel.text = arrOfrder.data[indexPath.row].orderId
        cell.dateTimeLabel.text = arrOfrder.data[indexPath.row].dateTime
        cell.priceLabel.text = arrOfrder.data[indexPath.row].totalPrice
        cell.vNameLabel.text = arrOfrder.data[indexPath.row].vName
        cell.orderSatusLabel.text = arrOfrder.data[indexPath.row].orderStatus
        //        cell.vImage.userActivity?.webpageURL = URL(fileURLWithPath: "\(arrOfrder.data[indexPath.row].vImage)")
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userOrderTabelView.reloadData()
    }
}
