//
//  BankTableViewCell.swift
//  final_bank
//
//  Created by Andrii Nazar on 12/7/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import UIKit

protocol CellClickDelegate{
    func moreClick(at index:IndexPath)
    func callClick(at index:IndexPath)
    func linkClick(at index:IndexPath)
    func locationClick(at index:IndexPath)
}

class BankTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bankName: UILabel!
    @IBOutlet weak var bankRegion: UILabel!
    @IBOutlet weak var bankCity: UILabel!
    @IBOutlet weak var bankPhone: UILabel!
    @IBOutlet weak var bankAddress: UILabel!
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var bankImage: UIImageView!
    var indexPath:IndexPath!
    var delegate:CellClickDelegate!
    private var bankInfo: BankModel?
    
    public func initCell(model: BankModel) {
        self.bankInfo = model
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
    
    @IBAction func phoneClick(_ sender: Any) {
        self.delegate?.callClick(at: indexPath)
    }
    @IBAction func locationClick(_ sender: Any) {
        self.delegate?.locationClick(at: indexPath)
    }
    @IBAction func linkClick(_ sender: Any) {
        self.delegate?.linkClick(at: indexPath)
    }
    @IBAction func moreItemClick(_ sender: Any) {
        self.delegate?.moreClick(at: indexPath)
    }
}
