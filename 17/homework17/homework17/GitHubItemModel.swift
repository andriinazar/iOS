//
//  GitHubItemModel.swift
//  homework17
//
//  Created by Andrii Nazar on 11/24/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import Foundation

public class GitHubItemModel {
    public let avatarPath: String
    public let repositoryName: String
    public let repositoryDiscription: String
    public let starCount: Int
    
    init(avatarPath:String, repositoryName: String, repositoryDiscription: String, starCount: Int) {
        self.avatarPath = avatarPath
        self.repositoryName = repositoryName
        self.repositoryDiscription = repositoryDiscription
        self.starCount = starCount
    }
}
