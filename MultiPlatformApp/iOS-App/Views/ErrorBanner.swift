//
//  ErrorBanner.swift
//  iOS-App
//
//  Created by Shio Birbichadze on 29.01.23.
//

import SwiftUI

struct ErrorBanner: View {
    @State private var showBanner = false
    var message: String

    var body: some View {
        ZStack {
            if showBanner {
                HStack {
                    Text(message)
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(.leading)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding(.all,10)
                .background(.red)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .transition(.move(edge: .top))
                .animation(.default)
            }
        }
        .offset(y: -UIScreen.main.bounds.maxY/2 + 70)
        .onAppear {
            self.showBanner = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.showBanner = false
            }
        }
    }
}

struct ErrorBanner_Previews: PreviewProvider {
    static var previews: some View {
        ErrorBanner(message: "Oops, Soemthing Went Wrong")
    }
}
