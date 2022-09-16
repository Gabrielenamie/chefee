//
//  cardComidaView.swift
//  Chefee
//
//  Created by Vitor Cheung on 08/09/22.
//

import SwiftUI

struct cardComidaView: View {
    var receita: Receita
    var body: some View {
        HStack{
            if let image = UIImage(systemName: "plus"){
                Image(uiImage: image)
            }
            VStack {
                HStack {
                    Text(receita.nome ?? "Bicoito")
                        .bold()
                        .font(.title2)
                        .padding([.leading])
                    Spacer()
                }
                HStack {
                    Text("Tempo de duração: \(receita.tempoDeDuracao ?? "45 mim")")
                        .padding([.leading])
                        .font(.caption)
                    Spacer()
                }
                HStack {
                    Text("Nota do autor: \(receita.notaDoAutor)")
                        .font(.caption)
                        .padding([.leading])
                    Spacer()
                }
//                Text("Nota do autor: \(receita.notaDoAutor)")
            }
        }
    }
}

struct cardComidaView_Previews: PreviewProvider {
    static var previews: some View {
//        let r: Receita = {
//            let r = Receita()
//            r.notaDoAutor = 5.0
//            return r
//        }()
        
        cardComidaView(receita: Receita())
    }
}
