//
//  TableView+WrapContent.swift
//  final_bank
//
//  Created by Andrii Nazar on 12/10/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import Foundation

import UIKit

// try add wrap content table size
public extension UITableView {
    override open var contentSize:CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override open var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
