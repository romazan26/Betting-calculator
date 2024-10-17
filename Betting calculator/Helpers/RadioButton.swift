//
//  RadioButton.swift
//  Betting calculator
//
//  Created by Роман on 17.10.2024.
//

import SwiftUI

struct RadioButton: View {
    @Binding var selected: BetResult
    var result: BetResult

    var body: some View {
        Button(action: {
            self.selected = result
        }) {
            HStack {
                Image(systemName: selected == result ? "largecircle.fill.circle" : "circle")
            }
        }
        .foregroundColor(selected == result ? .orangeApp : .gray)
    }
}
