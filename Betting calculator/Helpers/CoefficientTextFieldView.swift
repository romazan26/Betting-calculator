//
//  CoefficientTextFieldView.swift
//  Betting calculator
//
//  Created by Роман on 17.10.2024.
//

import SwiftUI

struct CoefficientTextFieldView: View {
    var number = 1
    @Binding var coefficient: String
    var body: some View {
        HStack{
            Text("\(number)st rate coefficient")
            Spacer()
            TextField("", text: $coefficient)
                .keyboardType(.decimalPad)
                .padding()
                .background {
                    Color.white
                        .opacity(0.05)
                        .cornerRadius(12)
                }
        }
        .padding(10)
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        Color.main
        CoefficientTextFieldView( coefficient: .constant("0.5"))
    }
}
