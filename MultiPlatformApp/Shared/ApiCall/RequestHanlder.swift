//
//  RequestHanlder.swift
//  iOS-App
//
//  Created by Shio Birbichadze on 28.01.23.
//

import Foundation

protocol RequestParams {
    func getQueryItems() -> [URLQueryItem]
    func getServiceApi() -> URL
}

struct RequestByCounryAndCategory: RequestParams {
    
    let country: String
    let category: String?
    
    func getQueryItems() -> [URLQueryItem] {
        var items = [URLQueryItem(name: "country",
                                  value: country)]
        if category != "" {
            items.append(URLQueryItem(name: "category",
                                      value: category))
        }
        return items
    }
    
    func getServiceApi() -> URL {
        Api.baseTopeHeadlinesURL
    }
}

struct RequestByTopic: RequestParams {
    let q: String
    let sortBy: String = "popularity"
    
    func getQueryItems() -> [URLQueryItem] {
        [URLQueryItem(name: "q",
                      value: q),
         URLQueryItem(name: "sortBy",
                      value: sortBy)]
    }
    
    func getServiceApi() -> URL {
        Api.baseEverythingURL
    }
}

