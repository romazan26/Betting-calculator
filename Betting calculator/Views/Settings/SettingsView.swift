//
//  SettingsView.swift
//  KTO_Training Notebook
//
//  Created by Роман on 13.10.2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @Binding var isPresent: Bool
    @Environment(\.dismiss) var dismiss
    @State private var isPresentShare = false
    @State private var isPresentPolicy = false
    @State var urlShare = "https://www.apple.com/app-store/"
    @State var urlPolicy = "https://www.apple.com/app-store/"
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.7)
                .ignoresSafeArea()
                .onTapGesture {
                    isPresent.toggle()
                }
            VStack{
                Spacer()
                VStack{
                    //MARK: - Title View
                    HStack {
                        Spacer()
                        Text("Settings")
                            .foregroundStyle(.white)
                            .font(.system(size: 24, weight: .heavy))
                            .offset(x: 6)
                        Spacer()
                        
                    }.padding()
                    
                    
                    //MARK: - Share App Button
                    Button(action: {isPresentShare.toggle()}, label: {
                        SettingButton(text: "Share the app", image: "heart.fill")
                    })
                    
                    
                    //MARK: - Rate App Button
                    Button {
                        SKStoreReviewController.requestReview()
                    } label: {
                        SettingButton(text: "Rate our app", image: "star.fill")
                    }
                    
                    //MARK: - Privacy button
                    Button(action: {isPresentPolicy.toggle()}, label: {
                        SettingButton(text: "Usage Policy", image: "leaf.fill")
                    })
                    .padding(.bottom, 30)
                    
                }
                .background {
                    Color.grayApp
                        .cornerRadius(12)
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $isPresentShare, content: {
            ShareSheet(items: urlShare )
        })
        .sheet(isPresented: $isPresentPolicy, content: {
            WebViewPage(urlString: URL(string: urlPolicy)!)
        })
    }
}

#Preview {
    SettingsView(isPresent: .constant(true))
}

struct ShareSheet: UIViewControllerRepresentable{
    var items: String
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let av = UIActivityViewController(activityItems: [items], applicationActivities: nil)
        return av
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
