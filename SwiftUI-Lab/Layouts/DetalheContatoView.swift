//
//  DetalheContatoView.swift
//  SwiftUI-Lab
//
//  Created by Diggo Silva on 31/05/26.
//

import SwiftUI

struct DetalheContatoView: View {
    
    @Binding var usuario: Usuario
    
    @State private var exibirEdicao = false
    
    var body: some View {
        VStack(spacing: 20) {
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
            
            Text(usuario.username)
                .font(.subheadline)
            
            Spacer()
        }
        .padding()
        
        .toolbar {
            Button("Editar") {
                exibirEdicao = true
            }
        }
        .sheet(isPresented: $exibirEdicao) {
            CadastroContatoView(contatos: .constant([]))
        }
    }
}

#Preview {
    DetalheContatoView(usuario: .constant(Usuario(nome: "Sonic The Hedgehog", username: "@sonichedgehog", fotoIcone: nil, favorito: false)))
}
