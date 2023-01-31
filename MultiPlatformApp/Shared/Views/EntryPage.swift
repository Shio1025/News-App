//
//  EntryPage.swift
//  iOS-App
//
//  Created by Shio Birbichadze on 28.01.23.
//

import SwiftUI
import Foundation

struct EntryPage: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack()  {
            Text("News")
                .bold()
                .font(.headline)
                .foregroundColor(.white)
            Image("news")
                .resizable()
                .aspectRatio(contentMode: .fit)
                #if os(macOS)
                .frame(width: 300, height: 300)
                #elseif os(iOS)
                .frame(width: 150, height: 150)
                #endif
            #if os(macOS)
            Text("Let's Find Out What's New")
                .padding(.top)
                .foregroundColor(.white)
                .opacity(0)
                .animation(.easeIn(duration: 1))
            #elseif os(iOS)
            NavigationLink {
                SearchPage(viewModel: viewModel)
            } label: {
                Text("Let's Find Out What's New")
                    .padding(.top)
                    .foregroundColor(.accentColor)
            }
            #endif
        }
        .edgesIgnoringSafeArea(.all)
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity)
        #if os(macOS)
        .background(BlurView(blur: .behindWindow,
                     vibrancy: .withinWindow,
                     material: .fullScreenUI))
        #endif
        
        
    }
}

struct EntryPage_Previews: PreviewProvider {
    static var previews: some View {
        EntryPage(viewModel: ViewModel())
    }
}
