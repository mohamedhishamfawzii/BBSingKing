//
//  SearchBarView.swift
//  BBSingKing
//
//  Created by Hisham El Barody on 04/09/2022.
//

import Foundation
import SwiftUI

struct SearchBarView : View{
    
    @Binding var searchText: String
    @FocusState.Binding var isEditing: Bool
    
    var body : some View{
        
        HStack {
            TextField("Search ...", text: $searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    withAnimation{
                        self.isEditing = true
                    }
                }.focused($isEditing)
            
            if isEditing {
                Button(action: {
                    withAnimation{
                        self.isEditing = false
                    }
                    searchText = ""
                    
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 15)
                .transition(.move(edge: .trailing))
            }
        }.padding(.horizontal,5)
            .frame(height:40)
    }
}
