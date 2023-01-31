//
//  ArticlesGrid.swift
//  macOS-App
//
//  Created by Shio Birbichadze on 29.01.23.
//

import SwiftUI

struct ArticlesGrid: View {
    @StateObject var viewModel: ViewModel
    @State var selectedArticle: Article? = nil
    
    var body: some View {
        
        if let selectedArticle = selectedArticle {
            ZStack {
                NewsPage(article: selectedArticle)
                Text("Back")
                    .background(.clear)
                    .foregroundColor(.accentColor)
                    .position(x: 50,
                              y: 20)
                    .onTapGesture {
                        self.selectedArticle = nil
                    }
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity)
        } else {
            List {
                ForEach(viewModel.data) { elem in
                    ListRowCell(model: elem)
                        .padding()
                        .onTapGesture {
                            selectedArticle = elem
                        }
                }
            }
            .background(BlurView(blur: .behindWindow,
                                 vibrancy: .behindWindow,
                                 material: .fullScreenUI))
        }
    }
}

struct ArticlesGrid_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesGrid(viewModel: ViewModel())
        
    }
}
