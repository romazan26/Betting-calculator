//
//  ExpressCellView.swift
//  Betting calculator
//
//  Created by Роман on 18.10.2024.
//

import SwiftUI

struct ExpressCellView: View {
    @StateObject var vm: ExpressViewModel
    let express: Express
    var body: some View {
        ZStack {
            Color.white.opacity(0.05).cornerRadius(12)
            HStack {
                VStack(alignment: .leading) {
                    Text("Winning: \(express.winning.formatted())")
                    Text("The express coefficient: \(express.coefficientt.formatted())")
                }.foregroundStyle(.white)
                    .font(.system(size: 15))
                
                Spacer()
                
                Button {
                    vm.deleteExpress(expres: express)
                } label: {
                    Image(systemName: "trash")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.white)
                }

            }
            .padding()
        }.frame(height: 84)
    }
}

//#Preview {
//    ZStack {
//        Color.main
//        ExpressCellView()
//    }
//}
