//
//  ListRowCell.swift
//  iOS-App
//
//  Created by Shio Birbichadze on 28.01.23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListRowCell: View {
    @StateObject var model: Article
    
    var body: some View {
        HStack {
            WebImage(url: model.urlToImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            VStack(alignment: .leading) {
                Text(model.smallTitle)
                    .font(.title)
                    .padding(.bottom)
                    .foregroundColor(.accentColor)
                Text(model.smallDesc)
                    .font(.body)
                    .foregroundColor(.black)
            }
            Spacer()
            NavigationLink {
                NewsPage(article: model)
            } label: {
                Image(systemName: "chevron.right")
                    .padding(.trailing)
                    .foregroundColor(.black)
            }
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2),radius: 25, x: 0, y: 0)
    }
}

struct NewsListRowCell_Previews: PreviewProvider {
    static var previews: some View {
        ListRowCell(model: Article(title: "petreegegvdsfvdsfv",
                                   description: "asldkvnaskdsdfvsdf",
                                   url: URL(string: "https://s.yimg.com/os/creatr-uploaded-images/2023-01/a1c4ff30-9e5e-11ed-b942-8a6b88c5fdba")!,
                                   urlToImage: nil,
                                   publishedAt: .now))
    }
}
