//
//  Home.swift
//  macOS-App
//
//  Created by Shio Birbichadze on 29.01.23.
//

import SwiftUI

var screen = NSScreen.main!.visibleFrame
struct Home: View {
    @StateObject var viewModel = ViewModel()
    @State var selectedTab: String = ""
    
    var body: some View {
        HStack {
            VStack {
                TabButton(image: "person.circle",
                          title: "",
                          selectedTab: $selectedTab)
                TabButton(image: "magnifyingglass",
                          title: "Search",
                          selectedTab: $selectedTab)
                Spacer()
                TabButton(image: "questionmark.circle",
                          title: "About",
                          selectedTab: $selectedTab)
            }
            .padding()
            .padding(.top, 10)
            .background(BlurView(blur: .behindWindow,
                                 vibrancy: .behindWindow,
                                 material: .menu))
            
            //tab Bar content
            ZStack {
                switch selectedTab {
                case "": EntryPage(viewModel: viewModel)
                case "Search": Search(viewModel: viewModel)
                case "About": Text("About")
                default: Text("default")
                }
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity)
        }
        .frame(width: screen.width/1.2,
               height: screen.height - 50)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
