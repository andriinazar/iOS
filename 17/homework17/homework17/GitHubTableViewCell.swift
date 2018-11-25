//
//  GitHubTableViewCell.swift
//  homework17
//
//  Created by Andrii Nazar on 11/24/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import UIKit

class GitHubTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var gitImage: UIImageView!
    @IBOutlet weak var gitRepositoryName: UILabel!
    @IBOutlet weak var gitRepositoryDescription: UILabel!
    @IBOutlet weak var gitStarCount: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //custom logic goes here
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
