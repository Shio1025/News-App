//
//  ViewModel.swift
//  iOS-App
//
//  Created by Shio Birbichadze on 28.01.23.
//

import Foundation
import Combine

final class ViewModel: ObservableObject {
    
    @Published var data: [Article] = []
    @Published var error: String? = nil
    @Published var processFinished: Bool = false
    
    //For Search Info
    @Published var model1 = RequestModelForTopic()
    @Published var model2 = RequestModelForCountyandCategory()
    
    
    var cancellables = Set<AnyCancellable>()
    
    init() { }
    
    func requestData(request: RequestParams) {
        APICaller.shared.fetchData(request: request)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    self.processFinished = true
                    break
                case .failure(let error):
                    self.processFinished = false
                    self.error = error.localizedDescription
                }
            } receiveValue: {[weak self] data in
                self?.data = data
            }.store(in: &cancellables)
    }
    
    func clearAllData() {
        processFinished = false
        error = nil
        model1 = RequestModelForTopic()
        model2 = RequestModelForCountyandCategory()
    }
}
