//
//  UserInfo.swift
//  homework18
//
//  Created by Andrii Nazar on 12/1/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import Foundation

class UserInfo: Codable {
    var firstName: String
    var secondName: String
    var phone: String?
    var email: String?
    var imagePath: String?
    
    init(firstName: String, secondName: String, phone: String?, email: String?) {
        self.firstName = firstName
        self.secondName = secondName
        self.phone = phone
        self.email = email
    }
    
}
