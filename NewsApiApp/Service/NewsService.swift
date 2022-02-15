//
//  NewsService.swift
//  NewsApiApp
//
//  Created by Евгений Старшов on 15.02.2022.
//

import Foundation
import Alamofire

final class NewsService {
    
    
    private let url = "https://newsapi.org/v2/top-headlines?country=ru&apiKey=f33bd84190ce421ab7406d8139e67442"
    
    
    func getNews(complition: @escaping([Article])->()) {
        print("Getting news")
        AF.request(url, method: .get).responseJSON { response in
            guard let data = response.data else { return }
            debugPrint(response.data as Any)
            DispatchQueue.main.async {
            do {
                let json =  try JSONDecoder().decode(Welcome.self, from: data).articles
                let news: [Article] = json
                complition(news)
            } catch {
                print(error)
                }
            }
        }
    }
}
