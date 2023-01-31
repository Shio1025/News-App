//
//  SearchPage.swift
//  iOS-App
//
//  Created by Shio Birbichadze on 28.01.23.
//

import SwiftUI

struct SearchPage: View {
    @StateObject var viewModel: ViewModel

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.gray, .primary, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack {
                firstSearchComponent
                    .padding(.all, 20)
                secondSearchComponent
                    .padding(.all,20)
                if viewModel.processFinished {
                    navigationView
                        .padding(.all,20)
                }
            }
            if let error = viewModel.error {
                ErrorBanner(message: error)
                    .padding(.all,10)
                    .edgesIgnoringSafeArea(.top)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            viewModel.clearAllData()
        }
    }
    
    var navigationView: some View {
        NavigationLink {
            ResultList(viewModel: viewModel)
        } label: {
            VStack(alignment: .center) {
                Text("\(viewModel.data.count) article was Found")
                    .foregroundColor(.white)
                    .font(.caption2)
                    .bold()
                Text("Click to View Result")
                    .font(.caption)
                    .bold()
                    .foregroundColor(.white)
            }
            .padding(.all, 20)
            .background(.green)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        }
    }
    
    var firstSearchComponent: some View {
        VStack {
            TextField("Write Topic: ", text: $viewModel.model1.topic)
                .foregroundColor(.red)
            Text("Searching About - \(viewModel.model1.topic)")
                .padding(.bottom)
            Button("Search") {
                viewModel.requestData(request: RequestByTopic(q: viewModel.model1.topic))
            }
        }
        .padding(.all, 20)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2),radius: 25, x: 0, y: 0)
    }
    
    var secondSearchComponent: some View {
        VStack {
            TextField("Write Country: ", text: $viewModel.model2.country)
                .foregroundColor(.red)
            TextField("Choose Topic(Optional): ", text: $viewModel.model2.category)
                .foregroundColor(.red)
                .padding(.bottom)
            Button("Search") {
                viewModel.requestData(request: RequestByCounryAndCategory(country: viewModel.model2.country,
                                                                          category: viewModel.model2.category))
            }
        }
        .padding(.all, 20)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2),radius: 25, x: 0, y: 0)
    }
}

struct SearchPage_Previews: PreviewProvider {
    static var previews: some View {
        SearchPage(viewModel: ViewModel())
    }
}





