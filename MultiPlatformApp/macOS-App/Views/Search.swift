//
//  Search.swift
//  macOS-App
//
//  Created by Shio Birbichadze on 29.01.23.
//

import SwiftUI

struct Search: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        HStack {
            VStack {
                firstSearchComponent
                    .padding(.all, 20)
                secondSearchComponent
                    .padding(.all,20)
            }
    
            if viewModel.processFinished {
                ArticlesGrid(viewModel: viewModel)
            } else {
                Text("No Articles")
                    .foregroundColor(.accentColor)
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity)
            }
        }
        .background(BlurView(blur: .behindWindow,
                             vibrancy: .behindWindow,
                             material: .fullScreenUI))
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            viewModel.clearAllData()
        }
    }
    
    var firstSearchComponent: some View {
        VStack {
            TextField("Write Topic: ", text: $viewModel.model1.topic)
                .foregroundColor(.white)
                .background(BlurView(blur: .behindWindow,
                                     vibrancy: .behindWindow,
                                     material: .selection))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            Text("Searching About - \(viewModel.model1.topic)")
                .padding(.bottom)
                .foregroundColor(.black)
                .font(.caption)
            Button("Search") {
                viewModel.requestData(request: RequestByTopic(q: viewModel.model1.topic))
            }
            .background(BlurView(blur: .behindWindow,
                                 vibrancy: .behindWindow,
                                 material: .hudWindow))
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        }
        .padding(.all, 20)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2),radius: 25, x: 0, y: 0)
    }
    
    var secondSearchComponent: some View {
        VStack {
            TextField("Write Country: ", text: $viewModel.model2.country)
                .foregroundColor(.white)
                .background(BlurView(blur: .behindWindow,
                                     vibrancy: .behindWindow,
                                     material: .selection))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            TextField("Choose Topic(Optional): ", text: $viewModel.model2.category)
                .foregroundColor(.white)
                .background(BlurView(blur: .behindWindow,
                                     vibrancy: .behindWindow,
                                     material: .selection))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            Button("Search") {
                viewModel.requestData(request: RequestByCounryAndCategory(country: viewModel.model2.country,
                                                                          category: viewModel.model2.category))
            }
            .background(BlurView(blur: .behindWindow,
                                 vibrancy: .behindWindow,
                                 material: .hudWindow))
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        }
        .padding(.all, 20)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2),radius: 25, x: 0, y: 0)
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search(viewModel: ViewModel())
    }
}
