//
//  ContentView.swift
//  Art Tracker
//
//  Created by Роман on 01.10.2024.
//

import SwiftUI

struct LoadingView: View {
    @StateObject var vm = LoadingViewModel()
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            Image(.logo)
                .resizable()
                .frame(width: 200, height: 200)
            ProgressView()
                .colorScheme(.dark)
                .padding(.top, 350)
        }
        .fullScreenCover(isPresented: $vm.isPresent, content: {
            if vm.isFirstLaunch ?? true {
                IntroView()
            }else{
                MainView()
            }
        })
        .onAppear(perform: {
            vm.starttimer()
        })
    }
}

#Preview {
    LoadingView()
}
