//
//  CharacterImageViewModel.swift
//  BBSingKing
//
//  Created by Hisham El Barody on 04/09/2022.
//

import Foundation
import SwiftUI
import Combine

class CharacterImageViewModel : ObservableObject{
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let character : CharacterModel
    private let dataService: CharacterImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(character: CharacterModel){
        self.character = character;
        self.dataService = CharacterImageService(character: character)
        self.addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
        
    }
}
