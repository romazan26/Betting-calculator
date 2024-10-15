//
//  ButtomMainTopBarView.swift
//  Betting calculator
//
//  Created by Роман on 15.10.2024.
//

import SwiftUI

struct ButtomMainTopBarView: View {
    var image = "scroll.fill"
    var color: Color = .orangeApp
    var body: some View {
        ZStack {
            color
            Image(systemName: image)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(.white)
        }
        .frame(width: 64)
        .cornerRadius(12)
    }
}

#Preview {
    ButtomMainTopBarView()
}
