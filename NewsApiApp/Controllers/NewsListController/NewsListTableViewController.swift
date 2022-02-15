//
//  TableViewController.swift
//  NewsApiApp
//
//  Created by Евгений Старшов on 15.02.2022.
//

import UIKit

class NewsListTableViewController: UITableViewController {
    
    private let newsApi = NewsService()
    
    private var news = [Article]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "newsCell")
        tableView.register(UINib(nibName: "NewsListTableViewCell", bundle: nil), forCellReuseIdentifier: "newsCell")
    
        newsApi.getNews { [weak self] getnews in
            print("Got news in VC")
            self?.news = getnews
            self?.tableView.reloadData()
        }

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return news.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsListTableViewCell

        let newsItem = news[indexPath.row]
        cell.configureNewsList(model: newsItem)

        return cell
    }

    
}
