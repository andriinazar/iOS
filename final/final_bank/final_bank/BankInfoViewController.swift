//
//  BankInfoViewController.swift
//  final_bank
//
//  Created by Andrii Nazar on 12/9/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import UIKit

class BankInfoViewController: UIViewController {

    var bankInfo: BankModel? = nil
    var searchBarItem: UINavigationItem? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = false
        self.searchBarItem?.title = bankInfo?.bankName
        self.searchBarItem?.leftBarButtonItem = UIBarButtonItem(customView: makeBackButton())
        //self.searchBarItem?.backBarButtonItem?.image = UIImage(named: "back")
    }
    
    func makeBackButton() -> UIButton {
        let backButtonImage = UIImage(named: "back")?.withRenderingMode(.alwaysTemplate)
        let backButton = UIButton(type: .custom)
        backButton.setImage(backButtonImage, for: .normal)
        backButton.setTitleColor(.blue, for: .normal)
        backButton.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
        backButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0,right: 0)
        backButton.sizeToFit()
        return backButton
    }
    
    @objc func backButtonPressed() {
        //dismiss(animated: true, completion: nil)
        self.searchBarItem?.title = "Convert Lab"
        self.searchBarItem?.leftBarButtonItem = nil
        self.view.removeFromSuperview()
        //        navigationController?.popViewController(animated: true)
    }
}
