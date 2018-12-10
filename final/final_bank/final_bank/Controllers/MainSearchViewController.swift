//
//  MainSearchViewController.swift
//  final_bank
//
//  Created by Andrii Nazar on 12/7/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import UIKit
import SafariServices
import CoreLocation

class MainSearchViewController: UIViewController, UITableViewDataSource, CellClickDelegate {
    
    let cellResource: String = "bankCellId"
    private var bankData:[BankModel] = []
    public let baseImageUrl = "https://dummyimage.com/{140}x{120}/{FFFFFF}/{000000}&text="
    public let baseJsonUrl = "http://resources.finance.ua/ua/public/currency-cash.json"
    @IBOutlet weak var toolBarText: UINavigationItem!
    @IBOutlet weak var bankList: UITableView!
    @IBOutlet weak var mainContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bankList.dataSource = self
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
        cell.selectionStyle = .none
        cell.delegate = self
        cell.indexPath = indexPath
        cell.contentView.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        return cell
    }
    
    private func showNewBankPopUp(bank: BankModel) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "bankInfoController") as! BankInfoViewController
        vc.bankInfo = bank
        vc.searchBarItem = self.toolBarText
        self.addChild(vc)
        UIView.transition(with: self.view, duration: 0.5, options: .layoutSubviews, animations: {
            self.mainContainer.addSubview(vc.view)
        }, completion: nil)
        self.didMove(toParent: self)
    }
    
    private func showMapView(bank: BankModel) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "mapViewController") as! MapViewController
        vc.bankInfo = bank
        vc.searchBarItem = self.toolBarText
        self.addChild(vc)
        UIView.transition(with: self.view, duration: 0.5, options: .layoutSubviews, animations: {
            self.mainContainer.addSubview(vc.view)
        }, completion: nil)
        self.didMove(toParent: self)
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
    
    func moreClick(at index: IndexPath) {
        showNewBankPopUp(bank: self.bankData[index.row])
    }
    
    func callClick(at index: IndexPath) {
        if let phone = self.bankData[index.row].bankPhone {
            guard let number = URL(string: "tel://" + phone) else { return }
            UIApplication.shared.open(number)
        } else {
            showToast(message: "Phone not available")
        }
    }
    
    func linkClick(at index: IndexPath) {
        if let link = self.bankData[index.row].bankLink {
            let url = URL(string: link)
            let vc = SFSafariViewController(url: url!)
            present(vc, animated: true, completion: nil)
        } else {
            showToast(message: "Email not available")
        }
    }
    
    func locationClick(at index: IndexPath) {
        showMapView(bank: self.bankData[index.row])
        /*let geocoder = CLGeocoder()
        if let address = self.bankData[index.row].bankAddress {
        let locationString = address
    
            geocoder.geocodeAddressString(locationString) { (placemarks, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    if let location = placemarks?.first?.location {
                        let query = "?ll=\(location.coordinate.latitude),\(location.coordinate.longitude)"
                        let urlString = "http://maps.apple.com/".appending(query)
                        if let url = URL(string: urlString) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                    }
                }
            }
        }*/
    }
    
    func showToast(message : String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }

}


