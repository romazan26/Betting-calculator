//
//  ContentView.swift
//  Betting calculator
//
//  Created by Роман on 14.10.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var vmMain = ExpressViewModel()
    @StateObject var vmSystem = SystemViewModel()
    @StateObject var vmNotes = NoteViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                Color.main.ignoresSafeArea()
                VStack {
                    //MARK: - Top tool bar
                    HStack{
                        IncomeView(money: 1)
                        VStack{
                            //MARK: - History button
                            NavigationLink {
                                HistoryView(vmExpress: vmMain, vmSystem: vmSystem)
                            } label: {
                                ButtomMainTopBarView()
                            }

                           
                            ButtomMainTopBarView(image: "gearshape.fill")
                        }
                        
                        //MARK: - Notes view button
                        NavigationLink {
                            NotesView(vm: vmNotes)
                        } label: {
                            ButtomMainTopBarView(image: "text.document.fill", color: .orangeOpacity)
                        }
                    }
                    .frame(height: 100)
                    .frame(maxWidth: .infinity)
                    
                    //MARK: - Choose view button
                    HStack{
                        Button {
                            vmMain.mainViewSwitch = false
                        } label: {
                            CustomButtonView(title: "System", color: vmMain.mainViewSwitch ? .white.opacity(0.05) : .orangeApp)
                        }
                        
                        Button {
                            vmMain.mainViewSwitch = true
                        } label: {
                            CustomButtonView(title: "Express", color: !vmMain.mainViewSwitch ? .white.opacity(0.05) : .orangeApp)
                        }
                        
                        
                    }
                    Spacer()
                    if vmMain.mainViewSwitch {
                        ExpressView(vm: vmMain)
                    }else{
                        SystemView(vm: vmSystem)
                    }
                    
                }
                .padding()
            }
        }
    }
}

#Preview {
    MainView()
}
