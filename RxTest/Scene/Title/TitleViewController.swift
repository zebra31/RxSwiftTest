//
//  ViewController.swift
//  RxTest
//
//  Created by saichi on 2016/04/15.
//  Copyright © 2016年 saichi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TitleViewController: UIViewController, UITableViewDataSource {
    
//    private var articles: [[String: String?]] = []
    private var articles: [Articles] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
//        getArticles()
    }
    
    func getArticles() {
        Alamofire.request(.GET, "https://qiita.com/api/v2/items")
            .responseJSON { response in
                guard let object = response.result.value else {
                    return
                }
                let json = JSON(object)
//                json.forEach { (_, json) in
//                    let ariticle: [String:String?] = [
//                        "title": json["title"].string,
//                        "userId": json["user"]["id"].string
//                    ]
//                    self.articles.append(ariticle)
//                }
                self.articles.append(Articles(json: json))
                self.tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "cell")
        let article = articles[indexPath.row]
        cell.textLabel?.text = article.title
        cell.detailTextLabel?.text = String(article.id)
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
}

extension Int {
    public var string: String? {
        get {
            return String(self)
        }
    }
}
