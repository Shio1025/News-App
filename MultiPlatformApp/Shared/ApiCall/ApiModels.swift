//
//  ApiModels.swift
//  iOS-App
//
//  Created by Shio Birbichadze on 28.01.23.
//
import Foundation

//Response Api Models
struct NewsResponseApi: Codable {
    let articles: [ArticleAPI]
}

struct ArticleAPI: Codable {
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: Date?
}


