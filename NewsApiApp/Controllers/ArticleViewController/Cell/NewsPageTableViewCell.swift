//
//  NewsPageTableViewCell.swift
//  NewsApiApp
//
//  Created by Евгений Старшов on 15.02.2022.
//

import UIKit

class NewsPageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsContent: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configurePageCell(with model: Article) {
        titleLabel.text = model.title
        dateLabel.text = model.publishedAt
        authorLabel.text = model.author
        
        if let imageUrl = URL(string: model.urlToImage ?? "https://easy-comp.ru/media/k2/items/cache/e9432fccf28a953514f077b86e5e657a_L.jpg") {
            newsImage.loadImage(url: imageUrl)
        }
        
        newsContent.text = model.articleDescription
        
    }
    
}

// image url finder

extension UIImageView {
    func loadImage (url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

