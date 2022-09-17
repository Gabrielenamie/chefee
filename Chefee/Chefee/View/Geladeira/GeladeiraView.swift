//
//  GeladeiraView.swift
//  Chefee
//
//  Created by Vitor Cheung on 09/09/22.
//

import SwiftUI
import CoreData

struct GeladeiraView: View {
    @State private var searchText = ""
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Ingrediente.nome, ascending: true)],
        animation: .default)
    
    private var ingredientes: FetchedResults<Ingrediente>
    
    var body: some View {
        NavigationView {
            VStack{
                ScrollView{
                    ForEach(ingredientes) { ingrediente in
                        HStack{
                            cardIngredienteView(ingrediente: ingrediente)
                            cardIngredienteView(ingrediente: ingrediente)
                        }
                    }
                }
                .searchable(text: $searchText, prompt: "Look for something")
                .navigationTitle("Geladeira")
                Spacer()
                Button {
                    print("oi")
                } label: {
                    ZStack{
                        Color.red
                        Text("Procurar receita")
                    }
                    .frame(height: 50)
                    .cornerRadius(10)
                    .padding()
                }

            }
        }
    }
}

struct GeladeiraView_Previews: PreviewProvider {
    static var previews: some View {
        GeladeiraView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
