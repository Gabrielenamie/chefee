//
//  DetalhesDaReceitaView.swift
//  Chefee
//
//  Created by Vitor Cheung on 08/09/22.
//

import SwiftUI

struct DetalhesDaReceitaView: View {
    var receita: Receita
    @State var estaFavoritado: Bool
    
    init(receita: Receita) {
        self.receita = receita
        self.estaFavoritado = DataBase.shared.recitasFavoritadas.contains(where: { r in r.id == receita.id })
    }
    
    var body: some View {
        VStack{
            if let image = UIImage(systemName: "plus"){
                Image(uiImage: image)
            }
            receita.image ?? Image("sushi")
                .aspectRatio(contentMode: .fit) as! Image
          //      .resizable() as! Image
                
            Text(receita.nome ?? "Bolo")
                .font(.title)
                .bold()
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding([.top,.leading,.trailing])
            Text("Nota do autor: \(receita.notaDoAutor)⭐️")
                .bold()
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding([.leading,.trailing])
            Text("Tempo duração: \(receita.tempoDeDuracao ?? "1 hora")")
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding([.leading,.trailing])
            
            Text("Ingredientes:")
                .font(.title2)
                .bold()
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding([.top,.leading,.trailing])
            ForEach(0 ..< receita.ingredientes.count){ index in
                HStack{
                    Text("\(receita.quantidade[index]) \(receita.ingredientes[index].nome )")
                        .frame(maxWidth:.infinity, alignment: .leading)
                        .padding([.leading,.trailing])
                }
            }
            Text("Modo de preparo:")
                .font(.title2)
                .bold()
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding([.top,.leading,.trailing])
            Text(receita.modoDePreparo ?? "joga tudo fora")
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding([.leading,.trailing])
            Spacer()
        }
        .toolbar {
            Button {
                if !estaFavoritado {
                    DataBase.shared.recitasFavoritadas.append(receita)
                } else{
                    DataBase.shared.recitasFavoritadas.removeAll { r in
                        r.id == receita.id
                    }
                }
                estaFavoritado.toggle()
            } label: {
                if !estaFavoritado {
                    Image(systemName: "heart")
                } else{
                    Image(systemName: "heart.fill")
                }
                
            }
        }
    }
}

//struct DetalhesDaReceitaView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetalhesDaReceitaView(receita: Receita())
//    }
//}
