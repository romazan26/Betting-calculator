//
//  NoteCellView.swift
//  Betting calculator
//
//  Created by Роман on 19.10.2024.
//

import SwiftUI

struct NoteCellView: View {
    @StateObject var vm: NoteViewModel
    let note: Note
    var body: some View {
        ZStack {
            Color.white.opacity(0.05).cornerRadius(12)
            VStack(alignment: .leading) {
                HStack {
                    Text(note.titleNote ?? "")
                        .foregroundStyle(.white)
                        .font(.system(size: 17, weight: .bold))
                    
                    Spacer()
                    
                    Button {
                        vm.deleteNote(note: note)                    } label: {
                        Image(systemName: "trash")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.white)
                    }
                }
                Text(note.descriptNote ?? "")
                    .foregroundStyle(.white.opacity(0.5))
                    .font(.system(size: 15))
                    .multilineTextAlignment(.leading)
            }.padding()
        }
        .frame(height: 166)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    NoteCellView(vm: NoteViewModel(), note: Note())
}
