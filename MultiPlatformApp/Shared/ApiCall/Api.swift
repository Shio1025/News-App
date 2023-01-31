//
//  Consts.swift
//  iOS-App
//
//  Created by Shio Birbichadze on 28.01.23.
//

import Foundation
import Combine

struct Api {
    static let NewsAPIKey: String = "f077cb9a04094b46884f86ab2878c56f"
    static let baseTopeHeadlinesURL = URL(string: "https://newsapi.org/v2/top-headlines")!
    static let baseEverythingURL = URL(string: "https://newsapi.org/v2/everything")!
}

class QueryItemsHandler {
     
    static func getAllQueryItems(requestQueryItems: RequestParams) -> [URLQueryItem] {
        var params = requestQueryItems.getQueryItems()
        params.append(URLQueryItem(name: "apiKey",
                                   value: Api.NewsAPIKey))
        return params
    }
}

final class APICaller {
    static let shared = APICaller()
    
    
    func fetchData(request: RequestParams) -> Future<[Article], Error> {
        return Future { promise in
            var components = URLComponents(url: request.getServiceApi(),
                                           resolvingAgainstBaseURL: true)!
            components.queryItems = QueryItemsHandler.getAllQueryItems(requestQueryItems: request)
            
            guard let url = components.url else {
                let error = NSError(domain: "",
                                    code: 0,
                                    userInfo: [NSLocalizedDescriptionKey: "Incorrect URL"])
                promise(.failure(error))
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    promise(.failure(error))
                    return
                }
                guard let data = data else {
                    let error = NSError(domain: "",
                                        code: 0,
                                        userInfo: [NSLocalizedDescriptionKey: "Data was not received"])
                    promise(.failure(error))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let newsResponse = try decoder.decode(NewsResponseApi.self, from: data)
                    promise(.success(newsResponse.articles.map({ Article(apiModel: $0) })))
                } catch {
                    promise(.failure(error))
                }
            }
            task.resume()
        }
    }
}

