//
//  ContentView.swift
//  Betting calculator
//
//  Created by Роман on 14.10.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack {
                //MARK: - Top tool bar
                HStack{
                    IncomeView(money: 1)
                    VStack{
                        ButtomMainTopBarView()
                        ButtomMainTopBarView(image: "gearshape.fill")
                    }
                    ButtomMainTopBarView(image: "text.document.fill", color: .orangeOpacity)
                }
                .frame(height: 100)
                .frame(maxWidth: .infinity)
                
                //MARK: - Choose view button
                HStack{
                    CustomButtonView(title: "System")
                    CustomButtonView(title: "Express", color: .white.opacity(0.05))
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    MainView()
}
