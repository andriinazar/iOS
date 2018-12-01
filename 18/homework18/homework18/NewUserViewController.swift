 //
//  NewUserViewController.swift
//  homework18
//
//  Created by Andrii Nazar on 12/1/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import UIKit

public protocol UserDelegate {
    func newUserCreate()
}

class NewUserViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var secondName: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    public var delegate: UserDelegate?
    private var image: UIImage?
    public var userInfo: UserFullInfo?
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.userInfo != nil {
            self.firstName.text = self.userInfo?.userInfo.firstName
            self.secondName.text = self.userInfo?.userInfo.secondName
            self.email.text = self.userInfo?.userInfo.email
            self.phone.text = self.userInfo?.userInfo.phone
        }
    }
    
    @IBAction func closeNewUser(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addNewUser(_ sender: Any) {
        let firstNameText = self.firstName.text
        let secondNameText = self.secondName.text
        let phoneText: String? = self.phone.text
        let emailText: String? = self.email.text
        if firstNameText != nil && firstNameText != nil {
            let userInfo = UserInfo(firstName: firstNameText!, secondName: secondNameText!, phone: phoneText, email: emailText)
            if let saveImage = self.image {
                if let imageName = DataSaveHelper.saveImage(image: saveImage) {
                    userInfo.imagePath = imageName
                }
            }
            if self.userInfo == nil {
                DataSaveHelper.createUserRecord(userInfo: userInfo)
            } else {
                if let path = self.userInfo?.filePath {
                    DataSaveHelper.updateUserRecord(userInfo: userInfo, fileName: path)
                }
            }
            if let delegate = self.delegate {
                delegate.newUserCreate()
            }
        } else {
            let alert = UIAlertController(title: "Alert", message: "fist and second name must be not empty", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addPhotoClick(_ sender: Any) {
        ImagePickerManager().pickImage(self){ image in
            self.image = image
            self.userImage.image = image
        }
    }
 }
