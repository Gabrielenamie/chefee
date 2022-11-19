//
//  GeladeiraView.swift
//  Chefee
//
//  Created by Vitor Cheung on 09/09/22.
//

import SwiftUI
import CoreData

struct GeladeiraView: View {
    @EnvironmentObject var viewModel: GeladeiraViewModel
    @State private var searchText = ""
    @State var showingSheet: Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach( searchText.isEmpty ? viewModel.ingredienteNaGeladeira() : viewModel.ingredienteFilter(nome: searchText)) { ingrediente in
                        cardIngredienteView(ingrediente: ingrediente,
                                            color: !searchText.isEmpty ? .init(red: 1, green: 1, blue: 1, alpha: 1) : viewModel.selectIngredientes.contains(where: { ingre in ingre.id == ingrediente.id }) ? .init(red: 1, green: 0, blue: 0, alpha: 1) : .init(red: 1, green: 1, blue: 1, alpha: 1) )
                            .onTapGesture {
                                let indexingredienteNoArray = viewModel.selectIngredientes.firstIndex(where: { ingre in ingre.nome == ingrediente.nome })
                                if let indexingredienteNoArray = indexingredienteNoArray {
                                    viewModel.selectIngredientes.remove(at: indexingredienteNoArray)
                                    if !searchText.isEmpty{
                                        ingrediente.estaNaGeladeira.toggle()
                                            searchText = ""
                                    }
                                } else {
                                    viewModel.selectIngredientes.append(ingrediente)
                                }
                            }
                    }
                }
                .searchable(text: $searchText, prompt: "Look for something")
                .navigationTitle("Geladeira")
                Spacer()
                Button {
                    showingSheet.toggle()
                } label: {
                    ZStack{
                        Color.red
                        Text("Procurar receita")
                            .tint(.white)
                    }
                    .frame(height: 50)
                    .cornerRadius(10)
                    .padding()
                }
                .sheet(isPresented: $showingSheet) {
                    NavigationView {
                        if viewModel.recitasFiltadras().isEmpty{
                            Text("Nem uma receita foi encontrada")
                        } else {
                            ListaDeReceitas(receitas: viewModel.recitasFiltadras())
                        }
                    }
                }

            }
        }
    }
}
