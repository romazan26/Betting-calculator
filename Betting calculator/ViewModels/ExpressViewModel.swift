//
//  MainViewModel.swift
//  Betting calculator
//
//  Created by Роман on 17.10.2024.
//

import Foundation

final class ExpressViewModel: ObservableObject {
    @Published var mainViewSwitch: Bool = false
    
    @Published var simpleBet = ""
    @Published var numberOfOutComes = 0

    @Published var totalCooficient = 0.0
    @Published var totalProfit = 0.0
    
    @Published var simpleCooficent1 = "0.0"
    @Published var simpleCooficent2 = "0.0"
    @Published var simpleCooficent3 = "0.0"
    @Published var simpleCooficent4 = "0.0"
    @Published var simpleCooficent5 = "0.0"
    @Published var simpleCooficent6 = "0.0"
    @Published var simpleCooficent7 = "0.0"
    @Published var simpleCooficent8 = "0.0"
    @Published var simpleCooficent9 = "0.0"
    @Published var simpleCooficent10 = "0.0"
    @Published var simpleCooficent11 = "0.0"
    
    //MARK: - Calculate Express
    func calculate() {
        if let cof1 = Double(simpleCooficent1),
           let cof2 = Double(simpleCooficent2),
           let cof3 = Double(simpleCooficent3),
           let cof4 = Double(simpleCooficent4),
           let cof5 = Double(simpleCooficent5),
           let cof6 = Double(simpleCooficent6),
           let cof7 = Double(simpleCooficent7),
           let cof8 = Double(simpleCooficent8),
           let cof9 = Double(simpleCooficent9),
           let cof10 = Double(simpleCooficent10),
           let cof11 = Double(simpleCooficent11) {
            let allConf = [cof1, cof2, cof3, cof4, cof5, cof6, cof7, cof8, cof9, cof10, cof11]
                .filter{$0 > 0}
                .reduce(1.0, *)
            if allConf > 0{
                totalCooficient = allConf
            }
            if let bet = Double(simpleBet) {
                totalProfit = bet * totalCooficient
            }
        }
        print("totalProfit: \(totalProfit)")
        print("totalcooficient: \(totalCooficient)")
    }
}
