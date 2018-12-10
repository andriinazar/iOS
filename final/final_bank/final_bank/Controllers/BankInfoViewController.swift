//
//  BankInfoViewController.swift
//  final_bank
//
//  Created by Andrii Nazar on 12/9/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import UIKit

class BankInfoViewController: UIViewController, UITableViewDataSource {

    public let baseImageUrl = "https://dummyimage.com/{140}x{120}/{FFFFFF}/{000000}&text="
    @IBOutlet weak var bankAddress: UILabel!
    @IBOutlet weak var bankIcon: UIImageView!
    @IBOutlet weak var bankUrl: UILabel!
    @IBOutlet weak var bankName: UILabel!
    @IBOutlet weak var bankRegion: UILabel!
    @IBOutlet weak var bankPhone: UILabel!
    @IBOutlet weak var currencyTable: UITableView!
    var bankInfo: BankModel? = nil
    private var currency: [CurrencyModel] = []
    private var currencyName: [String:String] = [:]
    var searchBarItem: UINavigationItem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = false
        self.searchBarItem?.title = bankInfo?.bankName
        self.searchBarItem?.leftBarButtonItem = UIBarButtonItem(customView: makeBackButton())
        self.searchBarItem?.rightBarButtonItem = UIBarButtonItem(customView: makeShareButton())
        self.currencyTable.dataSource = self
        initBankInfo()
    }
    
    private func initBankInfo() {
        if let currentBank = self.bankInfo {
            self.bankAddress.text = "Адреса: " + currentBank.bankAddress!
            self.bankName.text = currentBank.bankName!
            self.bankRegion.text = "Район: " + currentBank.bankRegion!
            if let bankName = currentBank.bankName {
                self.bankIcon.cacheImage(urlString: baseImageUrl + bankName)
            }
            self.bankUrl.text = "Oфіційний сайт: " + currentBank.bankLink!
            self.bankPhone.text = "Телефон: " + currentBank.bankPhone!
            if let currencyTmp = currentBank.currencies {
                for (k, v) in currencyTmp {
                    self.currency.append(CurrencyModel(currencyCode: k, currencyInfo: v))
                }
            }
            self.currencyName = currentBank.currencyName ?? [:]
        }
        self.currencyTable.reloadData()
    }
    
    private func makeBackButton() -> UIButton {
        let backButtonImage = UIImage(named: "back")?.withRenderingMode(.alwaysTemplate)
        let backButton = UIButton(type: .custom)
        backButton.setImage(backButtonImage, for: .normal)
        backButton.setTitleColor(.blue, for: .normal)
        backButton.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
        backButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0,right: 0)
        backButton.sizeToFit()
        return backButton
    }
    
    private func makeShareButton() -> UIButton {
        let shareButtonImage = UIImage(named: "share")?.withRenderingMode(.alwaysTemplate)
        let shareButton = UIButton(type: .custom)
        shareButton.setImage(shareButtonImage, for: .normal)
        shareButton.setTitleColor(.blue, for: .normal)
        shareButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,right: -10)
        shareButton.sizeToFit()
        return shareButton
    }
    
    private func makeSearchButton() -> UIButton {
        let searchButtonImage = UIImage(named: "search")?.withRenderingMode(.alwaysTemplate)
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(searchButtonImage, for: .normal)
        searchButton.setTitleColor(.blue, for: .normal)
        searchButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,right: -10)
        searchButton.sizeToFit()
        return searchButton
    }
    
    @objc func backButtonPressed() {
        self.searchBarItem?.rightBarButtonItem = UIBarButtonItem(customView: makeSearchButton())
        self.searchBarItem?.title = "Convert Lab"
        self.searchBarItem?.leftBarButtonItem = nil
        self.view.removeFromSuperview()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bankInfo?.currencies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.currencyTable.dequeueReusableCell(withIdentifier: "currencyCell", for: indexPath) as! CurrencyTableViewCell
        if let code = currency[indexPath.row].currencyCode {
            cell.initCurrencyCode(code: code)
            cell.initCurrencyName(name: currencyName[code] ?? "-")
        }
        cell.initAnkAndBid(ask: currency[indexPath.row].currencyInfo?.ask ?? "-", bid: currency[indexPath.row].currencyInfo?.bid ?? "-")
        
        return cell
    }
}
