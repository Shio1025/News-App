//
//  ContentView.swift
//  iOS-App
//
//  Created by Shio Birbichadze on 28.01.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.gray, .primary, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                EntryPage(viewModel: viewModel)
            }
        }
        .navigationViewStyle(.stack)
        .background(.clear)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
