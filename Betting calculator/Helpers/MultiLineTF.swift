//
//  MultiLineTF.swift
//  TigerChallenges
//
//  Created by Роман on 21.05.2024.
//

import Foundation
import SwiftUI

struct MultiLineTF: UIViewRepresentable {
   
    @Binding var txt: String
    @State var placehold: String
    
    func makeCoordinator() -> Coordinator {
        return MultiLineTF.Coordinator(parent1: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MultiLineTF>) -> UITextView {
        let tview = UITextView()
        tview.isEditable = true
        tview.isUserInteractionEnabled = true
        tview.isScrollEnabled = true
        tview.text = txt.isEmpty ? placehold : txt
        tview.textColor = .gray
        tview.font = .systemFont(ofSize: 20)
        tview.backgroundColor = .clear
        tview.delegate = context.coordinator
        return tview
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MultiLineTF>) {

        
    }
    class Coordinator: NSObject, UITextViewDelegate {
        
        var parent: MultiLineTF
    
        
        
        init(parent1: MultiLineTF) {
            self.parent = parent1
        }
        func textViewDidChange(_ textView: UITextView) {
            
            self.parent.txt = textView.text
            
            
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            
                textView.text = ""
                textView.textColor = .white
    
        }
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text.isEmpty {
                textView.text = parent.placehold
                textView.textColor = .gray
            }
        }
    }
}
