//
//  UserFullInfo.swift
//  homework18
//
//  Created by Andrii Nazar on 12/1/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import Foundation

class UserFullInfo {
    var userInfo: UserInfo
    var filePath: String
    init(userInfo: UserInfo, filePath: String) {
        self.userInfo = userInfo
        self.filePath = filePath
    }
}
