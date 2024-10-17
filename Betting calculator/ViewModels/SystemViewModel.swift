//
//  SystemViewModel.swift
//  Betting calculator
//
//  Created by Роман on 17.10.2024.
//
import Foundation

enum BetResult: String, CaseIterable {
    case win = "Win"
    case refund = "Refund"
    case lose = "Loss"
}

final class SystemViewModel: ObservableObject {
    @Published var N: String = "2" // Количество исходов в экспрессе
    @Published var M: String = "3" // Общее количество событий
    @Published var stake: String = "" // Сумма ставки
    @Published var odds: [String] = Array(repeating: "", count: 12) // Массив коэффициентов (максимум 12)
    @Published var totalWin: Double = 0.0 // Общая сумма выигрыша
    @Published var playedExpress: Int = 0 // Количество сыгранных экспрессов
    @Published var unplayedExpress: Int = 0 // Количество несыгранных экспрессов
    @Published var percentageWin: Double = 0.0 // Пр
    @Published var results: [BetResult] = Array(repeating: .win, count: 12) // Результаты событий (по умолчанию все выиграли)
    
    // Функция для расчета системы ставок
    func calculateWin() {
           let NInt = Int(N) ?? 0
           let MInt = Int(M) ?? 0
           let stakeDouble = Double(stake) ?? 0.0

           // Преобразование коэффициентов из строк в Double
           let oddsDouble: [Double] = odds.prefix(MInt).compactMap { Double($0) }

           totalWin = calculateSystemBet(N: NInt, M: MInt, stake: stakeDouble, odds: oddsDouble, results: results)

           // Рассчитываем проценты и количество сыгранных/несыгранных экспрессов
           let initialStake = stakeDouble
           let profit = totalWin - initialStake
           percentageWin = (profit / initialStake) * 100
       }
    
    // Функция для расчета системы ставок с учетом результата (выиграла, возврат, проиграла)
    private  func calculateSystemBet(N: Int, M: Int, stake: Double, odds: [Double], results: [BetResult]) -> Double {
        guard M <= 12 && N <= M else { return 0 }
        let indices = Array(0..<M)
        let combinationsIndices = combinations(indices, choose: N)
        var totalWin: Double = 0.0
        playedExpress = 0
        unplayedExpress = 0

        for combination in combinationsIndices {
            var combinationWin: Double = 1.0
            var isWinning = true
            
            for index in combination {
                let result = results[index]
                switch result {
                case .win:
                    combinationWin *= odds[index]
                case .refund:
                    continue // Возврат не влияет на коэффициент
                case .lose:
                    isWinning = false // Проигранное событие делает экспресс невыигрышным
                }
            }

            if isWinning {
                playedExpress += 1
                totalWin += combinationWin
            } else {
                unplayedExpress += 1
            }
        }
        return totalWin * (stake / Double(combinationsIndices.count))
    }

    
    // Функция для генерации всех комбинаций размера N из M
    private func combinations<T>(_ array: [T], choose k: Int) -> [[T]] {
        if k == 0 { return [[]] }
        guard let first = array.first else { return [] }
        let rest = Array(array.dropFirst())
        let combsWithoutFirst = combinations(rest, choose: k)
        let combsWithFirst = combinations(rest, choose: k - 1).map { [first] + $0 }
        return combsWithFirst + combsWithoutFirst
    }
}
