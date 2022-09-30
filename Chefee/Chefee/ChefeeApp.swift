//
//  ChefeeApp.swift
//  Chefee
//
//  Created by Vitor Cheung on 08/09/22.
//

import SwiftUI

@main
struct ChefeeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TabView{
                HomeView(receitas: [])
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }

                GeladeiraView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .tabItem {
                        Label("Geladeira", systemImage: "fork.knife")
                    }

                ReceitasFavoritasView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .tabItem {
                        Label("favoritas", systemImage: "star")
                    }
                

            }
            
        }
    }
}
