//
//  PageIntroView.swift
//  AircraftInspection
//
//  Created by Роман on 05.04.2024.
//

import SwiftUI

struct PageIntroView: View {
    var page: PageIntro
    
    var body: some View {

        ZStack(alignment: .bottom) {
            Image(page.imageUrl)
                .resizable()
                .scaledToFit()
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 410,
                           height: 290)
                    .offset(y: 50)
                    .foregroundStyle(.black)
                Text(page.text)
                    .font(.system(size: 34, weight: .heavy))
                    .foregroundColor(.white)
                    .padding(.bottom, 50)
                    .padding(.horizontal)
            }
        }
                        
 
    }
}


#Preview {
    PageIntroView(page: PageIntro.samplePage)
}
