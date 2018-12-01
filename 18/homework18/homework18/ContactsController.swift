//
//  ViewController.swift
//  homework18
//
//  Created by Andrii Nazar on 12/1/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import UIKit

class ContactsController: UIViewController, UITableViewDataSource, UITableViewDelegate, UserDelegate {
    @IBOutlet weak var contactsTable: UITableView!
    var users: [UserFullInfo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        contactsTable.register(UITableViewCell.self, forCellReuseIdentifier: "userCell")
        contactsTable.dataSource = self
        contactsTable.delegate = self
        getAllUsers()
    }
    
    private func getAllUsers() {
        if let files = DataSaveHelper.getAllFiles() {
            users.removeAll()
            for fileName in files {
                if let userInfo = DataSaveHelper.getUserRecord(recortPath: fileName) {
                    users.append(UserFullInfo(userInfo: userInfo, filePath: fileName))
                }
            }
            users = users.sorted { $0.userInfo.firstName < $1.userInfo.firstName }
            contactsTable.reloadData()
        }
    }
    
    func newUserCreate() {
        getAllUsers()
    }

    @IBAction func addContact(_ sender: Any) {
        showNewUserPopUp(userInfo: nil)
    }
    
    private func showNewUserPopUp(userInfo: UserFullInfo?) {
        let contactPopUp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "newUser") as! NewUserViewController
        contactPopUp.modalPresentationStyle = .overCurrentContext
        contactPopUp.userInfo = userInfo
        contactPopUp.delegate = self
        present(contactPopUp, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.contactsTable.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let userInfo: String = String(users[indexPath.row].userInfo.firstName) + " " + String(users[indexPath.row].userInfo.secondName)
        cell.textLabel?.text = userInfo
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showNewUserPopUp(userInfo: self.users[indexPath.row])
    }
}

