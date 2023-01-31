//
//  NewsPage.swift
//  macOS-App
//
//  Created by Shio Birbichadze on 28.01.23.
//

import SwiftUI
import SDWebImageSwiftUI
#if os(iOS)
import Foundation
#elseif os(macOS)
import AppKit
#endif

struct NewsPage: View {
    @StateObject var article: Article
    
    var body: some View {
        ScrollView {
            #if os(iOS)
            Spacer(minLength: 50)
            #endif
            HStack {
                Spacer()
                Text("Published at: " + article.dateToString)
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding([.trailing, .top])
            }
            WebImage(url: article.urlToImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            Text(article.title ?? "")
                .font(.title)
                .padding(.all)
                .foregroundColor(.accentColor)
            Text(article.description ?? "")
                .font(.body)
                .padding(.all)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            #if os(iOS)
            Spacer(minLength: 150)
            #elseif os(macOS)
            Spacer(minLength: 50)
            #endif
            Text("View Source")
                .foregroundColor(.accentColor)
                .bold()
                .onTapGesture {
                    guard let url = article.url else { return }
                    #if os(iOS)
                    UIApplication.shared.open(url)
                    #elseif os(macOS)
                    NSWorkspace.shared.open(url)
                    #endif
                }
        }
        #if os(macOS)
        .background(BlurView(blur: .behindWindow,
                             vibrancy: .withinWindow,
                             material: .fullScreenUI))
        #elseif os(iOS)
        .background(BlurView(colors: [.darkGray, .black, .darkGray]))
        .edgesIgnoringSafeArea(.all)
        #endif
    }
}

struct NewsPage_Previews: PreviewProvider {
    static var previews: some View {
        NewsPage(article: Article(title: "petre",
                                  description: "asldkvnaskd",
                                  url: URL(string: "https://s.yimg.com/os/creatr-uploaded-images/2023-01/a1c4ff30-9e5e-11ed-b942-8a6b88c5fdba")!,
                                  urlToImage: nil,
                                  publishedAt: .now))
    }
}
