//
//  MainSearchViewController.swift
//  final_bank
//
//  Created by Andrii Nazar on 12/7/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import UIKit

class MainSearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cellResource: String = "bankCellId"
    private var bankData:[BankModel] = []
    public let baseImageUrl = "https://dummyimage.com/{140}x{120}/{FFFFFF}/{000000}&text="
    public let baseJsonUrl = "http://resources.finance.ua/ua/public/currency-cash.json"
    @IBOutlet weak var bankList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bankList.dataSource = self
        self.bankList.delegate = self
        sendRequest()
    }
    
    private func initBankData(data: [BankModel]) {
        bankData.removeAll()
        for bank in data {
            bankData.append(bank)
        }
        self.bankList.reloadData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bankData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.bankList.dequeueReusableCell(withIdentifier: cellResource, for: indexPath) as! BankTableViewCell
        cell.initCell(model: bankData[indexPath.row])
        if let bankName = bankData[indexPath.row].bankName {
            cell.bankImage.cacheImage(urlString: baseImageUrl + bankName)
        }
        cell.contentView.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        //cell.selectionStyle = .none
        return cell
    }
    
    func sendRequest() {
        if let url = URL(string: baseJsonUrl) {
            let task = URLSession.shared.currencyDataTask(with: url) { currencyData, response, error in
                if let currencyData = currencyData {
                    //let currencyData = try? newJSONDecoder().decode(CurrencyData.self, from: response)
                    DispatchQueue.main.async {
                        self.initBankData(data: CurencyDataAdapter.getCurrencyData(data: currencyData))
                    }
                }
            }
            task.resume()
        }
    }

}


