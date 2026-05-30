//
//  ListaContatosView.swift
//  SwiftUI-Lab
//
//  Created by Diggo Silva on 30/05/26.
//

import SwiftUI

struct ListaContatosView: View {
    var body: some View {
        List {
            ForEach(0..<5) { card in
                CardPerfilView()
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
            }
        }
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    ListaContatosView()
}
