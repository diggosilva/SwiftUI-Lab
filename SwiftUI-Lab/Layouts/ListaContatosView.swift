//
//  ListaContatosView.swift
//  SwiftUI-Lab
//
//  Created by Diggo Silva on 30/05/26.
//

import SwiftUI

struct ListaContatosView: View {
    private let userDefaults = UserDefaults.standard
    private let keyContatos = "MeusContatos"
    
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
            .onAppear {
                carregarContatos()
            }
            .onChange(of: contatos) {
                salvarContatos()
            }
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
    
    func salvarContatos() {
        if let dadosCodificados = try? JSONEncoder().encode(contatos) {
            userDefaults.set(dadosCodificados, forKey: keyContatos)
        }
    }
    
    func carregarContatos() {
        if let dadosSalvos = userDefaults.data(forKey: keyContatos),
           let contatosDecodificados = try? JSONDecoder().decode([Usuario].self, from: dadosSalvos) {
            self.contatos = contatosDecodificados
        }
    }
}

#Preview {
    ListaContatosView()
}
