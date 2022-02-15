//
//  ArticleViewController.swift
//  NewsApiApp
//
//  Created by Евгений Старшов on 15.02.2022.
//

import UIKit

class NewsPageViewController: UITableViewController {
    
    private let newsApi = NewsService()
    
    private var news = [Article]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "newsPageCell")
        tableView.register(UINib(nibName: "NewsPageTableViewCell", bundle: nil), forCellReuseIdentifier: "newsPageCell")
    
        newsApi.getNews { [weak self] getnews in
            print("Got news in VC")
            self?.news = getnews
            self?.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return news.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsPageCell", for: indexPath) as! NewsPageTableViewCell

        let newsItem = news[indexPath.row]
        cell.configurePageCell(with: newsItem)

        return cell
    }
}
