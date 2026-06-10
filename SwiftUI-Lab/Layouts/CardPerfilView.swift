//
//  CardPerfilView.swift
//  SwiftUI-Lab
//
//  Created by Diggo Silva on 28/05/26.
//

import SwiftUI

struct CardPerfilView: View {
    
    @Binding var usuario: Usuario
    
    var body: some View {
        HStack {
            if let dadosDaFoto = usuario.fotoIcone, let uiImage = UIImage(data: dadosDaFoto) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(Color.gray)
            }
            
            VStack(alignment: .leading) {
                Text(usuario.nome)
                    .font(Font.headline)
                
                Text(usuario.username)
                    .font(.system(.subheadline, design: .default, weight: .light))
                    .foregroundStyle(Color.gray)
            }
            
            Spacer()
            
            BotaoFavoritoView(estaFavoritado: $usuario.favorito)
                .buttonStyle(.plain)
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 5)
        .padding()
    }
}

#Preview {
    CardPerfilView(usuario: .constant(Usuario(nome: "Sonic The Hedgehog", username: "@sonichedgehog", fotoIcone: nil, favorito: false)))
}
