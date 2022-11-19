//
//  ChefeeApp.swift
//  Chefee
//
//  Created by Vitor Cheung on 08/09/22.
//

import SwiftUI

@main
struct ChefeeApp: App {
    @StateObject var database = DataBase.shared
    @StateObject var geladeiraViewModel = GeladeiraViewModel()
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TabView{
                HomeView()
                    .environmentObject(database)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }

                GeladeiraView()
                    .environmentObject(geladeiraViewModel)
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .tabItem {
                        Label("Geladeira", systemImage: "fork.knife")
                    }

                ReceitasFavoritasView()
                    .environmentObject(database)
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .tabItem {
                        Label("favoritas", systemImage: "star")
                    }
            }
        }
    }
}
