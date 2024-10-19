//
//  AddNoteView.swift
//  Betting calculator
//
//  Created by Роман on 19.10.2024.
//

import SwiftUI

struct AddNoteView: View {
    @StateObject var vm: NoteViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState var keyboardFocus: Bool
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack(alignment: .leading) {
                TextField("Title", text: $vm.simpleTitleNote)
                    .padding()
                    .focused($keyboardFocus)
                    .foregroundStyle(.white)
                    .background {
                        Color.white.opacity(0.05).cornerRadius(12)
                    }
                MultiLineTF(txt: $vm.simpleDescriptionNote, placehold: "Note")
                    .frame(maxWidth: .infinity)
                    .focused($keyboardFocus)
                Spacer()
                Button {
                    vm.addNote()
                    dismiss()
                } label: {
                    CustomButtonView(title: "Save")
                }

            }.padding()
        }.onTapGesture {
            keyboardFocus = false
        }
    }
}

#Preview {
    AddNoteView(vm: NoteViewModel())
}
