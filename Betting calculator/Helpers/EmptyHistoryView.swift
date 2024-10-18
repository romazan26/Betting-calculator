//
//  EmptyView.swift
//  Betting calculator
//
//  Created by Роман on 18.10.2024.
//

import SwiftUI

struct EmptyHistoryView: View {
    var body: some View {
        ZStack {
            Color.white.opacity(0.05).cornerRadius(12)
            VStack {
                Text("Empty")
                    .foregroundStyle(.white)
                    .font(.title)
                Text("You haven't added any entries")
                    .foregroundStyle(.white.opacity(0.7))
                Image(.empty)
                    .resizable()
                    .frame(width: 198, height: 198)
            }
        }.frame(height: 284)
            .frame(maxWidth: .infinity)
    }
}

#Preview {
    ZStack {
        Color.main
        EmptyHistoryView()
    }
}
