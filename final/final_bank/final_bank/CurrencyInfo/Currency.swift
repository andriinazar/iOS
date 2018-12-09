//
//  Currency.swift
//  final_bank
//
//  Created by Andrii Nazar on 12/9/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import Foundation

public class Currency: Codable {
    let ask, bid: String?
    
    init(ask: String?, bid: String?) {
        self.ask = ask
        self.bid = bid
    }
}
