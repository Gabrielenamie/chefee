//
//  cardIngredienteView.swift
//  Chefee
//
//  Created by Vitor Cheung on 09/09/22.
//

import SwiftUI

struct cardIngredienteView: View {
    var ingrediente: Ingrediente
    var body: some View {
        VStack{
            if let image = UIImage(systemName: "plus"){
                Image(uiImage: image)
            }
            Text(ingrediente.nome ?? "maracuja")
        }
        .frame(width: 200, height: 200)
    }
}

struct cardIngredienteView_Previews: PreviewProvider {
    static var previews: some View {
        cardIngredienteView(ingrediente: Ingrediente())
    }
}
