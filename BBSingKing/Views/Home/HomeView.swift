//
//  HomeView.swift
//  BBSingKing
//
//  Created by Hisham El Barody on 04/09/2022.
//

import Foundation
import SwiftUI

struct HomeView : View{
    
    //creates an animation namespace to allow matched geometry effects, which can be shared by other views. This owns its data.
    @Namespace var homeNamespace;
    
    //we need to create a reference type (ViewModel) inside our home and make sure it stays alive for use in that view and others you share it with.
    @StateObject var homeViewModel: HomeViewModel = HomeViewModel();

    // When we put @State before a property, we effectively move its storage out from our struct and into shared storage managed by SwiftUI. This means SwiftUI can destroy and recreate our struct whenever needed (and this can happen a lot!), without losing the state it was storing.
    @State private var selectedCharacter : CharacterModel? = nil
    @State private var showFavorites : Bool = false;
    @State private var showDetailView : Bool = false;
    
    // to observe if the serach textfield is focused or not
    @FocusState private var isEditing : Bool
    
    var body: some View{
            NavigationView {
                ZStack(){
                    Color.white.ignoresSafeArea()
                    VStack{
                        SearchBarView(searchText: $homeViewModel.searchText, isEditing: $isEditing)
                        characterListView
                    }
                    .toolbar(content: toolBarContent)
                    .navigationTitle("Breaking Bad")
                }
            }
            .overlay(
                ZStack {
                    if showDetailView {
                        DetailsView(showDetailView: $showDetailView,character:selectedCharacter, namespace: homeNamespace, saveFavorite: homeViewModel.saveFavorite)
                    }
                }
            )
            .navigationViewStyle(StackNavigationViewStyle())
        
    }
    
}


extension HomeView {
    
    private var characterListView : some View{
        ZStack{
            
            if(!showFavorites && homeViewModel.allCharacters.isEmpty){
                if !homeViewModel.searchText.isEmpty{
                    Text("No results")
                }else{
                    ProgressView()
                }
            }
            if (showFavorites && homeViewModel.favoriteCharacters.isEmpty){
                VStack{
                    if isEditing{
                        Text("No results")
                    }else{
                        Text("No favorites")
                        
                    }
    
                }
            }
            
            ScrollView(showsIndicators: false){
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 100, maximum: 150),spacing: 5)], spacing: 10) {
                    ForEach(showFavorites ? homeViewModel.favoriteCharacters : homeViewModel.allCharacters){ character in
                        
                        CharacterCardView(character: character, namespace: homeNamespace)
                            .onTapGesture {
                                selectedCharacter = character
                                withAnimation() {
                                    showDetailView.toggle()
                                    self.isEditing = false
                                    
                                }
                            }
                        
                    }
                    
                    
                }
                .padding(.horizontal)
            }
        }
    }
    
    @ToolbarContentBuilder
    private func toolBarContent() -> some ToolbarContent{
        ToolbarItemGroup( placement: .bottomBar){
            Spacer();
            VStack {
                Image(systemName: "person.2.fill")
                    .foregroundColor(!showFavorites ? Color.green : Color.gray)
            }
            .onTapGesture {
                withAnimation{
                    showFavorites = false;
                }
            }
            Spacer();
            VStack {
                Image(systemName: "heart.fill")
                    .foregroundColor(showFavorites ? Color.green : Color.gray)
                    .padding()
            }
            .onTapGesture {
                withAnimation{
                    showFavorites = true;
                }
            }
            Spacer();
            
        }
    }
    
}
