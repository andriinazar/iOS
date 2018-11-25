//
//  ViewController.swift
//  homework17
//
//  Created by Andrii Nazar on 11/24/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import UIKit

extension UIImageView {
    
    public func imageFromServerURL(urlString: String, PlaceHolderImage:UIImage) {
        
        if self.image == nil{
            self.image = PlaceHolderImage
        }
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }}

class SearchViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    typealias JSONDictionary = [String:Any]
    private var gitItems: Array<GitHubItemModel> = Array()
    private let baseUrl = "http://api.github.com/search/repositories"
    private var task: URLSessionTask?
    @IBOutlet weak var gitSearchTable: UITableView!
    @IBOutlet weak var gitSearch: UISearchBar!
    @IBOutlet weak var requestPreloader: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gitSearchTable.dataSource = self
        gitSearch.delegate = self
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        self.task?.cancel()
        self.requestPreloader.stopAnimating()
        self.gitItems.removeAll()
        self.gitSearchTable.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        var parameters: Dictionary<String, String> = Dictionary()
        parameters["q"] = searchBar.text
        parameters["sort"] = "stars"
        self.gitItems.removeAll()
        self.gitSearchTable.reloadData()
        self.requestPreloader.startAnimating()
        sendRequest(baseUrl, parameters: parameters, completion: {responce, error in
            DispatchQueue.main.async{
                self.requestPreloader.stopAnimating()
            }
            guard let responseObject = responce, error == nil else {
                print(error ?? "Unknown error")
                return
            }
            self.parceJson(jsonResponce: responseObject)
            
        })
    }
    
    private func parceJson(jsonResponce: JSONDictionary) {
        if let items = jsonResponce["items"] as? [JSONDictionary] {
            for item in items {
                let desritpion = item["description"] as? String
                let name = item["full_name"] as? String
                let starCount = item["stargazers_count"] as? Int
                var imageUrl: String?
                if let owner = item["owner"] as? JSONDictionary {
                    if let converted = (try? JSONSerialization.data(withJSONObject: owner, options: .prettyPrinted)) {
                        if let ownerObject = (try? JSONSerialization.jsonObject(with: converted )) as? JSONDictionary {
                            imageUrl = ownerObject["avatar_url"] as? String

                        }
                    }
                }
                gitItems.append(GitHubItemModel(avatarPath: imageUrl, repositoryName: name, repositoryDiscription: desritpion, starCount: starCount))
            }
            DispatchQueue.main.async{
                self.gitSearchTable.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.gitItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: GitHubTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! GitHubTableViewCell)
        /* Я не можу зрозуміти чому в цій частині коду cell який я отримую має всі поля nil */
        cell.gitRepositoryName?.text = gitItems[indexPath.row].repositoryName ?? "no data"
        cell.gitRepositoryDescription?.text = gitItems[indexPath.row].repositoryDiscription ?? "no data"
        cell.gitStarCount?.text = String(gitItems[indexPath.row].starCount ?? 0)
        let imageUrl = gitItems[indexPath.row].avatarPath
        cell.gitImage?.imageFromServerURL(urlString: gitItems[indexPath.row].avatarPath ?? "", PlaceHolderImage: UIImage())
        return cell
    }
    
   func sendRequest(_ url: String, parameters: [String: String], completion: @escaping ([String: Any]?, Error?) -> Void) {
        var components = URLComponents(string: url)!
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        let tmpUrl = components.url!
        let request = URLRequest(url: components.url!)
        self.task = URLSession.shared.dataTask(with: request) { data, response, error in
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
        task?.resume()
    }
}
