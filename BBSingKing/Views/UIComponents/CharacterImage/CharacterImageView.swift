//
//  CharacterImageView.swift
//  BBSingKing
//
//  Created by Hisham El Barody on 04/09/2022.
//

import Foundation
import SwiftUI

struct CharacterImageView: View{
    
    @StateObject var vm: CharacterImageViewModel
    
    init(character : CharacterModel) {
        _vm = StateObject(wrappedValue: CharacterImageViewModel(character: character))
    }
    
    var body : some View{
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .clipped()

            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color(uiColor: UIColor.white))
            }
        }
    }

}
