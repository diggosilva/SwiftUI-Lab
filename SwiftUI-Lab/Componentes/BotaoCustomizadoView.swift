//
//  BotaoCustomizadoView.swift
//  SwiftUI-Lab
//
//  Created by Diggo Silva on 27/05/26.
//

import SwiftUI

struct BotaoCustomizadoView: View {
    @State private var isWaiting = false
    @State private var message = "Aguardando..."
    var body: some View {
        VStack {
            Text(message)
            
            Button("Confirmar Compra") {
                message = "Sucesso!"
                isWaiting.toggle()
            }
            .font(Font.system(.headline).bold())
            .foregroundStyle(Color.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(LinearGradient(colors: [Color.blue, Color.purple], startPoint: .leading, endPoint: .trailing))
            .clipShape(Capsule())
        }
        .padding()
    }
}

#Preview {
    BotaoCustomizadoView()
}
