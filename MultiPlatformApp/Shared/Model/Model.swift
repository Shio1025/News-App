//
//  Model.swift
//  iOS-App
//
//  Created by Shio Birbichadze on 28.01.23.
//

import Foundation

class RequestModelForTopic: ObservableObject {
    @Published var topic: String = ""
}

class RequestModelForCountyandCategory: ObservableObject {
    @Published var country: String = ""
    @Published var category: String = ""
}
