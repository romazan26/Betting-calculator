//
//  NoteView.swift
//  Betting calculator
//
//  Created by Роман on 18.10.2024.
//

import SwiftUI

struct NotesView: View {
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
                    NavigationLink {
                        AddNoteView(vm: vm)
                    } label: {
                        Image(systemName: "plus.square.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.orangeOpacity)
                    }

                }
                ScrollView {
                    if vm.notes.isEmpty {
                        EmptyHistoryView()
                    }else{
                        ForEach(vm.notes) { note in
                            NavigationLink {
                                NoteView()
                            } label: {
                                NoteCellView(vm: vm, note: note)
                            }

                           
                        }
                    }
                }
            }
            .padding()
        }
        .sheet(isPresented: $vm.isPresentAddNote) {
            AddNoteView(vm: vm)
        }
    }
}

#Preview {
    NotesView(vm: NoteViewModel())
}
