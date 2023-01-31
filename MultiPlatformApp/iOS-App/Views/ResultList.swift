//
//  ResultList.swift
//  iOS-App
//
//  Created by Shio Birbichadze on 28.01.23.
//

import SwiftUI

struct ResultList: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        ScrollView {
            ForEach(Array(viewModel.data)) { elem in
                ListRowCell(model: elem)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(BlurView(colors: [.darkGray,.black, .white]))
    }
}

struct ResultList_Previews: PreviewProvider {
    static var previews: some View {
        ResultList(viewModel: ViewModel())
    }
}
