//
//  ResultSystemView.swift
//  Betting calculator
//
//  Created by Роман on 17.10.2024.
//

import SwiftUI

struct ResultSystemView: View {
    @StateObject var vm: SystemViewModel
    var body: some View {
        VStack(spacing: 10) {
            Text("Result")
                .foregroundStyle(.white)
                .font(.title)
            HStack {
                VStack(alignment: .leading){
                    HStack {
                        Text("Winning: \(String(format: "%.2f", vm.totalWin))")
                        Text("(\(String(format: "%.2f", vm.percentageWin))%)")
                            .foregroundStyle(.orangeApp)
                    }
                    Text("Played express trains: \(vm.playedExpress)")
                    Text("No express trains played: \(vm.unplayedExpress)")
                }
                Spacer()
            }
            
            Divider()
            
            HStack(spacing: 30) {
                Text("N°")
                    .frame(width: 30, alignment: .leading)
                Text("Ratio")
                    .frame(width: 60, alignment: .leading)
                Text("Bet")
                    .frame(width: 60, alignment: .leading)
                Text("Win")
                    .frame(width: 60, alignment: .leading)
            }
            ForEach(0..<min(Int(vm.M) ?? 0, 12), id: \.self) { i in
                HStack(spacing: 30) {
                    Text("\(i + 1).")
                        .frame(width: 25, alignment: .leading)
                    Text("\(vm.odds[i].isEmpty ? "0" : vm.odds[i])")
                        .frame(width: 60)
        
                    Text("33.33")
                        .frame(width: 60, alignment: .leading)
                    Text(vm.results[i] == .win ? "1" : "0")
                        .frame(width: 60)
                }
            }
        }
        .padding()
        .foregroundStyle(.white)
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
        ResultSystemView(vm: SystemViewModel())
    }
}
