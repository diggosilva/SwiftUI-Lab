//
//  ListaContatosView.swift
//  SwiftUI-Lab
//
//  Created by Diggo Silva on 30/05/26.
//

import SwiftUI

struct ListaContatosView: View {
    
    @State private var contatos = [
        Usuario(nome: "Mario Bros", username: "@mariobros", fotoIcone: "https://t2.tudocdn.net/680322?w=1920", favorito: false),
        Usuario(nome: "Luigi Bros", username: "@luigibros", fotoIcone: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRY3uMtSWAztU-krcKEZ4i2WZSzm62Fj9_MIQ&s", favorito: false),
        Usuario(nome: "Link Zelda", username: "@linkzelda", fotoIcone: "https://cdn.wikimg.net/en/zeldawiki/images/thumb/0/0a/LANS_Link_Render.png/320px-LANS_Link_Render.png", favorito: false),
    ]
    
    @State private var exibirCadastro = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($contatos) { $amigo in
                    NavigationLink(destination: DetalheContatoView(usuario: amigo)) {
                        CardPerfilView(usuario: $amigo)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
            }
            .navigationTitle("Contatos")
            .scrollContentBackground(.hidden)
            .toolbar {
                Button(action: {
                    exibirCadastro = true
                }) {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $exibirCadastro) {
            CadastroContatoView(contatos: $contatos)
        }
    }
}

#Preview {
    ListaContatosView()
}
