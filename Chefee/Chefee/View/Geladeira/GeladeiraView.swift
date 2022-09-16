//
//  GeladeiraView.swift
//  Chefee
//
//  Created by Vitor Cheung on 09/09/22.
//

import SwiftUI
import CoreData

struct GeladeiraView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Ingrediente.nome, ascending: true)],
        animation: .default)
    
    private var ingredientes: FetchedResults<Ingrediente>
    
    var body: some View {
        ForEach(ingredientes) { ingrediente in
            cardIngredienteView(ingrediente: ingrediente)
        }
        
    }
}

struct GeladeiraView_Previews: PreviewProvider {
    static var previews: some View {
        GeladeiraView()
    }
}
