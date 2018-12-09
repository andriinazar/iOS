//
//  BankTableViewCell.swift
//  final_bank
//
//  Created by Andrii Nazar on 12/7/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import UIKit

class BankTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bankName: UILabel!
    @IBOutlet weak var bankRegion: UILabel!
    @IBOutlet weak var bankCity: UILabel!
    @IBOutlet weak var bankPhone: UILabel!
    @IBOutlet weak var bankAddress: UILabel!
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var bankImage: UIImageView!
    
    public func initCell(model: BankModel) {
        self.bankName.text = model.bankName!
        self.bankRegion.text = model.bankRegion!
        self.bankCity.text = model.bankCity!
        self.bankPhone.text = "тел. " + model.bankPhone!
        self.bankAddress.text = model.bankAddress!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //set the values for top,left,bottom,right margins
        let margins = UIEdgeInsets(top: 6, left: 8, bottom: 6, right: 8)
        self.contentView.frame = contentView.frame.inset(by: margins)
        self.contentView.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        self.content.clipsToBounds = true
        self.content.layer.cornerRadius = 5
    }
    
    public func setBankIcon(icon: UIImage) {
        bankImage.image = icon
    }
    
}
