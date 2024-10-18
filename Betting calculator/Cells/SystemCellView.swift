//
//  SystemCellView.swift
//  Betting calculator
//
//  Created by Роман on 18.10.2024.
//

import SwiftUI

struct SystemCellView: View {
    @ObservedObject var system: System
    @StateObject var vm: SystemViewModel
    var body: some View {
        VStack(spacing: 10) {
            Text("Result")
                .foregroundStyle(.white)
                .font(.title)
            HStack {
                VStack(alignment: .leading){
                    HStack {
                        Text("Winning: \(String(format: "%.2f", system.totalWin))")
                        Text("(\(String(format: "%.2f", system.percentageWin))%)")
                            .foregroundStyle(.orangeApp)
                    }
                    Text("Played express trains: \(system.playedExpress)")
                    Text("No express trains played: \(system.unplayedExpress)")
                }
                Spacer()
                Button {
                    vm.deleteSystem(system)
                } label: {
                    Image(systemName: "trash")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.white)
                }
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
            if let events = system.eventEntry?.allObjects as? [EventEntity] {
                ForEach(events, id: \.self) { event in
                    HStack{
                        Text("\(event.index)")
                            .frame(width: 25, alignment: .leading)
                        Text("\(event.odds)")
                            .frame(width: 60)
                        Text("33.33")
                            .frame(width: 60, alignment: .leading)
                        Text(event.result ?? "")
                            .frame(width: 60)
                    }
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
    SystemCellView(system: System(), vm: SystemViewModel())
}
