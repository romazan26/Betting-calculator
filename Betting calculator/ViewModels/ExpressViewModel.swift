//
//  MainViewModel.swift
//  Betting calculator
//
//  Created by Роман on 17.10.2024.
//

import Foundation
import CoreData

final class ExpressViewModel: ObservableObject {
    @Published var mainViewSwitch: Bool = false
    
    //MARK: - CoreData Property
    @Published var express: [Express] = []
    let manager = CoreDataManager.instance
    
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
    
    init(){
        getExpress()
    }
    
    //MARK: - Coredata function
    
    //MARK: Clear data
    func clearExpress() {
        var simpleBet = ""
        var numberOfOutComes = 0
        var totalCooficient = 0.0
        var totalProfit = 0.0
        var simpleCooficent1 = "0.0"
        var simpleCooficent2 = "0.0"
        var simpleCooficent3 = "0.0"
        var simpleCooficent4 = "0.0"
        var simpleCooficent5 = "0.0"
        var simpleCooficent6 = "0.0"
        var simpleCooficent7 = "0.0"
        var simpleCooficent8 = "0.0"
        var simpleCooficent9 = "0.0"
        var simpleCooficent10 = "0.0"
        var simpleCooficent11 = "0.0"
    }
    
    //MARK: Delete data
    func deleteExpress(expres: Express) {
        manager.context.delete(expres)
        saveExpress()
    }
    
    //MARK: - Add data
    func addExpress() {
        let newEexpress = Express(context: manager.context)
        newEexpress.winning = totalProfit
        newEexpress.coefficientt = totalCooficient
        saveExpress()
    }
    
    //MARK: - Get data
    func getExpress() {
        let request = NSFetchRequest<Express>(entityName: "Express")
        do{
            express = try manager.context.fetch(request)
        }catch let error{
            print("Error: \(error.localizedDescription)")
        }
    }
    
    //MARK: Sava data
    func saveExpress() {
        express.removeAll()
        manager.save()
        getExpress()
    }
    
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
        addExpress()
    }
}
