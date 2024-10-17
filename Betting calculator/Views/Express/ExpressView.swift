//
//  ExpressView.swift
//  Betting calculator
//
//  Created by Роман on 17.10.2024.
//

import SwiftUI

struct ExpressView: View {
    @StateObject var vm: ExpressViewModel
    @FocusState var keyboardFocus: Bool
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack {
                VStack {
                    //MARK: - Bet
                    Text("The amount of the bet")
                        .foregroundStyle(.white.opacity(0.7))
                    TextField("Text", text: $vm.simpleBet)
                        .foregroundStyle(.white)
                        .focused($keyboardFocus)
                        .padding()
                        .background {
                            Color.white
                                .opacity(0.05)
                                .cornerRadius(12)
                        }
                    HStack {
                        Text("Number of outcomes")
                            .foregroundStyle(.white)
                        Spacer()
                        Picker("", selection: $vm.numberOfOutComes) {
                            ForEach(2..<12) { number in
                                Text("\(number)")
                            }
                        }
                    }.foregroundColor(.white)
                }
                .padding()
                .background {
                    Color.white
                        .opacity(0.05)
                        .cornerRadius(12)
                }
                
                //MARK: - Cooficient text fields
                ScrollView {
                    VStack(spacing: 0) {
                        CoefficientTextFieldView(number: 1, coefficient: $vm.simpleCooficent1)
                        CoefficientTextFieldView(number: 2, coefficient: $vm.simpleCooficent2)
                        if vm.numberOfOutComes > 0 {CoefficientTextFieldView(number: 3, coefficient: $vm.simpleCooficent3).focused($keyboardFocus)}
                        if vm.numberOfOutComes > 1 {CoefficientTextFieldView(number: 4, coefficient: $vm.simpleCooficent4).focused($keyboardFocus)}
                        if vm.numberOfOutComes > 2 {CoefficientTextFieldView(number: 5, coefficient: $vm.simpleCooficent5).focused($keyboardFocus)}
                        if vm.numberOfOutComes > 3 {CoefficientTextFieldView(number: 6, coefficient: $vm.simpleCooficent6).focused($keyboardFocus)}
                        if vm.numberOfOutComes > 4 {CoefficientTextFieldView(number: 7, coefficient: $vm.simpleCooficent7).focused($keyboardFocus)}
                        if vm.numberOfOutComes > 5 {CoefficientTextFieldView(number: 8, coefficient: $vm.simpleCooficent8).focused($keyboardFocus)}
                        if vm.numberOfOutComes > 6 {CoefficientTextFieldView(number: 9, coefficient: $vm.simpleCooficent9).focused($keyboardFocus)}
                        if vm.numberOfOutComes > 7 {CoefficientTextFieldView(number: 10, coefficient: $vm.simpleCooficent10).focused($keyboardFocus)}
                        if vm.numberOfOutComes > 8 {CoefficientTextFieldView(number: 11, coefficient: $vm.simpleCooficent11).focused($keyboardFocus)}
                    }
                    .padding()
                    .background {
                        Color.white
                            .opacity(0.05)
                            .cornerRadius(12)
                    }
                    ResultExpressView(winning: vm.totalProfit, coefficient: vm.totalCooficient)
                }
                
                //MARK: - Calculate button
                Button {
                    vm.calculate()
                } label: {
                    CustomButtonView(title: "Calculate")
                }

            }
        }
        .onTapGesture {
            keyboardFocus = false
        }
    }
}

#Preview {
    ExpressView(vm: ExpressViewModel())
}
