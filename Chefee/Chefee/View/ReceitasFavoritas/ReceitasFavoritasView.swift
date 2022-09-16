//
//  ContentView.swift
//  Chefee
//
//  Created by Vitor Cheung on 08/09/22.
//

import SwiftUI
import CoreData

struct ReceitasFavoritasView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Receita.nome, ascending: true)],
        animation: .default)
    
    private var receitas: FetchedResults<Receita>

    var body: some View {
        NavigationView {
            List{
                ForEach(receitas) { receita in
                    NavigationLink(destination: DetalhesDaReceitaView(receita: receita)){
                            cardComidaView(receita: receita)
                                .padding()
                    }
                }.onDelete(perform: deleteItems)
                
            }.navigationTitle("Favoritadas")
            
        }
    }

    private func addItem() {
        withAnimation {
            let newReceita = Receita(context: viewContext)
            newReceita.nome = "nome"

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { receitas[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ReceitasFavoritasView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
