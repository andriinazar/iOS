//
//  ViewController.swift
//  homework17
//
//  Created by Andrii Nazar on 11/24/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource {
    private var items: Array<GitHubItemModel> = Array()
    
    @IBOutlet weak var gitSearchTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //initSearchBar()
        gitSearchTable.register(GitHubTableViewCell.classForCoder(), forCellReuseIdentifier: "cellId")
        gitSearchTable.dataSource = self
        initTestData()
        
    }
    
    func initTestData() {
        items.append(GitHubItemModel(avatarPath: "Test10", repositoryName: "Test11", repositoryDiscription: "Test13", starCount: 123342))
        items.append(GitHubItemModel(avatarPath: "Test10", repositoryName: "Test11", repositoryDiscription: "Test13", starCount: 324234))
        items.append(GitHubItemModel(avatarPath: "Test10", repositoryName: "Test11", repositoryDiscription: "Test13", starCount: 1234145))
        items.append(GitHubItemModel(avatarPath: "Test10", repositoryName: "Test11", repositoryDiscription: "Test13", starCount: 2323423))
        gitSearchTable.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: GitHubTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! GitHubTableViewCell)
        /* Я не можу зрозуміти чому в цій частині коду cell який я отримую має всі поля nil */
        cell.gitRepositoryName?.text = items[indexPath.row].repositoryName
        cell.gitRepositoryDescription?.text = items[indexPath.row].repositoryDiscription
        cell.gitStarCount?.text = String(items[indexPath.row].starCount)
        return cell
    }
    
    private func sendRequest(_ url: String, parameters: [String: String], completion: @escaping ([String: Any]?, Error?) -> Void) {
        var components = URLComponents(string: url)!
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        let request = URLRequest(url: components.url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                let response = response as? HTTPURLResponse,
                (200 ..< 300) ~= response.statusCode,
                error == nil else {
                    completion(nil, error)
                    return
            }
            
            let responseObject = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
            completion(responseObject, nil)
        }
        task.resume()
    }
}


