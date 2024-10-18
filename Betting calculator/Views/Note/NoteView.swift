//
//  NoteView.swift
//  Betting calculator
//
//  Created by Роман on 18.10.2024.
//

import SwiftUI

struct NoteView: View {
    @StateObject var vm: NoteViewModel
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack {
                //MARK: - Top bar
                HStack{
                    Text("Notes")
                        .foregroundStyle(.white)
                        .font(.title)
                    
                    Spacer()
                    
                    //MARK: - Add note button
                    Button {
                        vm.isPresentAddNote = true
                    } label: {
                        Image(systemName: "plus.square.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.orangeOpacity)
                    }

                }
                ScrollView {
                    if vm.notes.isEmpty {
                        EmptyView()
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    NoteView(vm: NoteViewModel())
}
