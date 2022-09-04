//
//  CharacterCardView.swift
//  BBSingKing
//
//  Created by Hisham El Barody on 04/09/2022.
//

import Foundation
import SwiftUI

struct CharacterCardView : View{
    
    @State var character : CharacterModel?
    let namespace: Namespace.ID
    
    var body : some View{
        if let character = character{
            VStack{
                ZStack(alignment: .bottom){
                    CharacterImageView(character: character)
                        .matchedGeometryEffect(id: character.name, in: namespace)
                        .frame(height: 200)
                        .frame(minWidth:0, maxWidth: .infinity)
                    
                    Text(character.name).foregroundColor(Color.white)
                        .font(.title2)
                        .scaledToFill()
                        .minimumScaleFactor(0.2)
                        .lineLimit(1)
                        .frame(minWidth:0,maxWidth:.infinity)
                        .frame(height:15)
                        .padding()
                        .background(Color.green.opacity(0.7))
                    
                }
                
                .clipShape(RoundedRectangle(cornerRadius: 10,style:.continuous))
            }
        }
    }
    
}

