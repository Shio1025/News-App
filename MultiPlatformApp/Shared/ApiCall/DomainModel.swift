//
//  DomainModel.swift
//  iOS-App
//
//  Created by Shio Birbichadze on 28.01.23.
//

import Foundation

class Article: ObservableObject, Identifiable {
    let title: String?
    let description: String?
    let url: URL?
    let urlToImage: URL?
    let publishedAt: Date?
    
    init(apiModel: ArticleAPI) {
        self.title = apiModel.title
        self.description = apiModel.description
        self.url = URL(string: apiModel.url ?? "")
        self.urlToImage = URL(string: apiModel.urlToImage ?? "")
        self.publishedAt = apiModel.publishedAt
    }
    
    init(title: String?,
         description: String?,
         url: URL? = nil,
         urlToImage: URL? = nil,
         publishedAt: Date?) {
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
    }
}

extension Article {
    var smallDesc: String {
        guard let description = description else {  return "Unknown" }
        let start = description.startIndex
        #if os(macOS)
        if description.count < 200 { return description }
        let end = description.index(description.startIndex, offsetBy: 200)
        #elseif os(iOS)
        if description.count < 20 { return description }
        let end = description.index(description.startIndex, offsetBy: 20)
        #endif
        let range = start...end
        let substring = description[range]
        return substring + "..."
    }
    
    var smallTitle: String {
        guard let title = title else {  return "Unknown" }
        let start = title.startIndex
        #if os(macOS)
        if title.count < 25 { return title }
        let end = title.index(title.startIndex, offsetBy: 25)
        #elseif os(iOS)
        if title.count < 15 { return title }
        let end = title.index(title.startIndex, offsetBy: 15)
        #endif
        let range = start...end
        let substring = title[range]
        return substring + "..."
    }
    
    var dateToString: String {
        guard let publishedAt = publishedAt else { return "Unknown" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateDesc = dateFormatter.string(from: publishedAt)
        return dateDesc
    }
}

