//
//  CurrencyModel.swift
//  final_bank
//
//  Created by Andrii Nazar on 12/10/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import Foundation

public class CurrencyModel {
    var currencyCode: String?
    var currencyInfo: Currency?
    init(currencyCode: String?, currencyInfo: Currency?) {
        self.currencyCode = currencyCode
        self.currencyInfo = currencyInfo
    }
}
