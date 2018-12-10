//
//  CurencyDataAdapter.swift
//  final_bank
//
//  Created by Andrii Nazar on 12/9/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import Foundation

public class CurencyDataAdapter {
    
    class func getCurrencyData(data: CurrencyData) -> [BankModel] {
        var bankModel: [BankModel] = []
        if data.organizations != nil {
            for organization in data.organizations! {
                let bankInfo = BankModel()
                bankInfo.bankName = organization.title
                bankInfo.bankLink = organization.link
                bankInfo.bankAddress = organization.address
                bankInfo.currencies = organization.currencies
                bankInfo.bankPhone = organization.phone
                if let cities = data.cities {
                    if let id = organization.cityID {
                        bankInfo.bankCity = cities[id]
                    }
                }
                if let regions = data.regions {
                    if let id = organization.regionID {
                        bankInfo.bankRegion = regions[id]
                    }
                }
                bankInfo.currencyName = data.currencies
                bankModel.append(bankInfo)
            }
        }
        return bankModel
    }
}
