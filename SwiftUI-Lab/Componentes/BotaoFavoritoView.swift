//
//  BotaoFavoritoView.swift
//  SwiftUI-Lab
//
//  Created by Diggo Silva on 01/06/26.
//

import SwiftUI

struct BotaoFavoritoView: View {
    
    @Binding var estaFavoritado: Bool
    
    var body: some View {
        Button(action: {
            estaFavoritado.toggle()
        }) {
            Image(systemName: estaFavoritado ? "heart.fill" : "heart")
        }
    }
}

#Preview {
    BotaoFavoritoView(estaFavoritado: .constant(true))
}
