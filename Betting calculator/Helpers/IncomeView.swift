//
//  IncomeView.swift
//  Betting calculator
//
//  Created by Роман on 15.10.2024.
//

import SwiftUI

struct IncomeView: View {
    var money = 0.0
    var body: some View {
        ZStack {
            Color.white.opacity(0.05)
            HStack {
                Image(.circleIncome)
                    .resizable()
                    .scaledToFit()
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Your income")
                        .foregroundStyle(.white.opacity(0.7))
                        .font(.system(size: 15))
                    Text("$\(money.formatted())")
                        .foregroundStyle(.white)
                        .font(.system(size: 30, weight: .bold))
                        
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            
        }
        .frame(width: 222, height: 100)
        .cornerRadius(12)
    }
}

#Preview {
    ZStack {
        Color.main
        IncomeView()
    }
}
