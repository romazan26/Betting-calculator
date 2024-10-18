//
//  HistoryView.swift
//  Betting calculator
//
//  Created by Роман on 18.10.2024.
//

import SwiftUI

struct HistoryView: View {
    @StateObject var vmExpress: ExpressViewModel
    @StateObject var vmSystem: SystemViewModel
    @State private var mainViewSwitch = false
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack {
                //MARK: - Choose view button
                HStack{
                    Button {
                        mainViewSwitch = false
                    } label: {
                        CustomButtonView(title: "System", color: mainViewSwitch ? .white.opacity(0.05) : .orangeApp)
                    }

                    Button {
                        mainViewSwitch = true
                    } label: {
                        CustomButtonView(title: "Express", color: !mainViewSwitch ? .white.opacity(0.05) : .orangeApp)
                    }
                }
                ScrollView{
                    //MARK: - List Express
                    if mainViewSwitch {
                        if vmExpress.express.isEmpty {
                            EmptyHistoryView()
                        }else{
                            ForEach(vmExpress.express) { express in
                                ExpressCellView(vm: vmExpress, express: express)
                            }
                        }
                    }else{
                        if vmSystem.systems.isEmpty {
                            EmptyHistoryView()
                        }else{
                            ForEach(vmSystem.systems) { system in
                                SystemCellView(system: system, vm: vmSystem)
                            }
                        }
                        
                    }
                }
            }
            .padding()
            .navigationTitle("History")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    HistoryView(vmExpress: ExpressViewModel(), vmSystem: SystemViewModel())
}
