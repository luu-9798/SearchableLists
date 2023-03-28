//
//  ContentView.swift
//  SearchableLists
//
//  Created by Trung Luu on 3/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    let messages = [
        "Dad, can you lend me money?",
        "What is money made out of?",
        "Where does money come from?",
        "I love money"
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.self) { msg in
                    Text(msg)
                }
            }.searchable(text: $searchText)
                .navigationBarTitle("Order Number")
        }
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return messages
        } else {
            return messages.filter {
                $0.lowercased().contains(searchText.lowercased())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
