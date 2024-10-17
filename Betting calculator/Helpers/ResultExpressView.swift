//
//  ResultExpressView.swift
//  Betting calculator
//
//  Created by Роман on 17.10.2024.
//

import SwiftUI

struct ResultExpressView: View {
    var winning: Double
    var coefficient: Double
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Text("Result")
                    .font(.title2)
                Spacer()
            }
            Text("Winning: \(winning.formatted())")
            Text("The express coefficient: \(coefficient.formatted())")
        }
        .frame(minHeight: 125)
        .foregroundStyle(.white)
        .padding()
        .background {
            Color.white
                .opacity(0.05)
                .cornerRadius(12)
        }
    }
}

#Preview {
    ZStack {
        Color.main
        ResultExpressView(winning: 500, coefficient: 5)
    }
}
