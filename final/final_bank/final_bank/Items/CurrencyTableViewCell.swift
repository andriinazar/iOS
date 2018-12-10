//
//  CurrencyTableViewCell.swift
//  final_bank
//
//  Created by Andrii Nazar on 12/10/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {

    @IBOutlet weak var currencyCode: UILabel!
    @IBOutlet weak var currencyName: UILabel!
    @IBOutlet weak var ask: UILabel!
    @IBOutlet weak var bid: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func initCurrencyCode(code: String) {
        self.currencyCode.text = code
    }
    
    public func initCurrencyName(name: String) {
        self.currencyName.text = name
    }
    
    public func initAnkAndBid(ask: String, bid: String) {
        self.ask.text = ask
        self.bid.text = bid
    }
}
