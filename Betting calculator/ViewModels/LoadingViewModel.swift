//
//  LoadingViewModel.swift
//  Betting calculator
//
//  Created by Роман on 05.11.2024.
//

import SwiftUI

final class LoadingViewModel: ObservableObject{
    private var timeLoading: Int = 0
    @Published var isPresent: Bool = false
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool?
    
    func starttimer(){
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
            if self.timeLoading < 100{
                self.timeLoading += 1
            }else {
                timer.invalidate()
                self.isPresent = true
            }
        }
    }
}
