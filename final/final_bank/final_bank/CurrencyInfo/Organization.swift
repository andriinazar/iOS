//
//  Organization.swift
//  final_bank
//
//  Created by Andrii Nazar on 12/9/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import Foundation

public class Organization: Codable {
    let id: String?
    let oldID, orgType: Int?
    let branch: Bool?
    let title: String?
    let regionID: String?
    let cityID: String?
    let phone, address: String?
    let link: String?
    let currencies: [String: Currency]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case oldID = "oldId"
        case orgType, branch, title
        case regionID = "regionId"
        case cityID = "cityId"
        case phone, address, link, currencies
    }
    
    init(id: String?, oldID: Int?, orgType: Int?, branch: Bool?, title: String?, regionID: String?, cityID: String?, phone: String?, address: String?, link: String?, currencies: [String: Currency]?) {
        self.id = id
        self.oldID = oldID
        self.orgType = orgType
        self.branch = branch
        self.title = title
        self.regionID = regionID
        self.cityID = cityID
        self.phone = phone
        self.address = address
        self.link = link
        self.currencies = currencies
    }
}
