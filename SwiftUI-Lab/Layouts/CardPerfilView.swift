//
//  CardPerfilView.swift
//  SwiftUI-Lab
//
//  Created by Diggo Silva on 28/05/26.
//

import SwiftUI

struct CardPerfilView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading) {
                Text("Rodrigo Silva")
                    .font(Font.headline)
                
                Text("Desenvolver iOS")
                    .font(.system(.subheadline, design: .default, weight: .light))
                    .foregroundStyle(Color.gray)
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 5)
        .padding()
    }
}

#Preview {
    CardPerfilView()
}
