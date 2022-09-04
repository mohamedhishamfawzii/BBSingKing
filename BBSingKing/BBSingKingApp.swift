//
//  BBSingKingApp.swift
//  BBSingKing
//
//  Created by Hisham El Barody on 04/09/2022.
//

import SwiftUI

@main
struct BBSingKingApp: App {

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(OrientationInfo())
        }
    }
}
