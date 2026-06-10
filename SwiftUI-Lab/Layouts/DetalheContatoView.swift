//
//  DetalheContatoView.swift
//  SwiftUI-Lab
//
//  Created by Diggo Silva on 31/05/26.
//

import SwiftUI

struct DetalheContatoView: View {
    
    let usuario: Usuario
    
    var body: some View {
        VStack {
            if let dadosDaFoto = usuario.fotoIcone, let uiImage = UIImage(data: dadosDaFoto) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(Color.gray)
            }
            
            Text(usuario.nome)
                .font(.headline)
        }
    }
}

#Preview {
    DetalheContatoView(usuario: Usuario(nome: "Sonic The Hedgehog", username: "@sonichedgehog", fotoIcone: nil, favorito: false))
}
