//
//  TabButton.swift
//  macOS-App
//
//  Created by Shio Birbichadze on 29.01.23.
//

import SwiftUI

struct TabButton: View {
    var image: String
    var title: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button {
            withAnimation {
                selectedTab = title
            }
        } label: {
            VStack {
                Image(systemName: image)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(selectedTab == title ? .white : .gray)
                if  title != "" {
                    Text(title)
                        .fontWeight(.semibold)
                        .font(.system(size: 10))
                        .foregroundColor(selectedTab == title ? .white : .gray)
                }
            }
            .padding(.vertical,6)
            .frame(width: 60)
            .contentShape(Rectangle())
            .background(.primary.opacity(selectedTab == title ? 0.2 : .zero))
            .cornerRadius(12)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct TabButton_Previews: PreviewProvider {
    
    static var previews: some View {
        Home()
    }
}
