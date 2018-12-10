//
//  BankModel.swift
//  final_bank
//
//  Created by Andrii Nazar on 12/7/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import Foundation
import UIKit

class BankModel {
    public var bankName: String?
    public var bankRegion: String?
    public var bankCity: String?
    public var bankAddress: String?
    public var bankPhone: String?
    public var bankIcon: UIImage?
    public var currencies: [String:Currency]?
    public var bankLink: String?
    public var currencyName: [String: String]?
    
    // empty constructor
    init (){}
}
