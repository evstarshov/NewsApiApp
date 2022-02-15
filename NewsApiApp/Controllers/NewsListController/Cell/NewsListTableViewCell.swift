//
//  NewsListTableViewCell.swift
//  NewsApiApp
//
//  Created by Евгений Старшов on 15.02.2022.
//

import UIKit

class NewsListTableViewCell: UITableViewCell {

    @IBOutlet weak var articleLabel: UILabel!
    @IBOutlet weak var publishedDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureNewsList(model: Article) {
        articleLabel.text = model.title
        publishedDate.text = model.publishedAt
    }
    
}
