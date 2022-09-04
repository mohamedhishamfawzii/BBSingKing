//
//  CharacterModel.swift
//  BBSingKing
//
//  Created by Hisham El Barody on 04/09/2022.
//
import Foundation

struct CharacterModel: Identifiable, Codable {
    
    let id: Int
    let name, birthday: String
    let occupation: [String]
    let img: String
    let status, nickname: String
    let appearance: [Int]
    let portrayed, category: String
    let betterCallSaulAppearance: [Int]
    var isFavorite : Bool?
    
    enum CodingKeys: String, CodingKey {
        case id = "char_id"
        case name, birthday
        case occupation
        case img
        case status, nickname
        case appearance
        case portrayed
        case category
        case betterCallSaulAppearance = "better_call_saul_appearance"
        case isFavorite
    }
    
    mutating func toggleFavorite(){
        if let isFavorite = isFavorite, isFavorite {
            self.isFavorite = false;
        }else{
            self.isFavorite = true;
        }
    }
    
}
