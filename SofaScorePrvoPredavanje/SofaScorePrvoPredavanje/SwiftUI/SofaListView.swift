//
//  SofaListView.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 05.04.2022..
//

import SwiftUI

struct SofaListView: View {
    @State private var textFieldText: String = ""
    @State private var scrollToIndex: Int = 0
    
    var body: some View {
        VStack {
            
            TextField("", text: $textFieldText)
                .placeholder(when: textFieldText.isEmpty) {
                    Text("unesi # ovdje")
                        .foregroundColor(.secondary)
                }
                .padding()
                .frame(height: 55)
                .border(Color.white)
                .background(Color.blue.opacity(0.7))
                .cornerRadius(20)
                .padding(.horizontal)
                .keyboardType(.numberPad)
                .padding(.vertical, 20)
            
            Button("Odvedi me") {
                withAnimation(.default) {
                    if let index = Int(textFieldText) {
                        scrollToIndex = index
                        hideKeyboard()
                    } 
//                    proxy.scrollTo(49, anchor: .bottom)
                }
            }
            
            ScrollView{
                ScrollViewReader{ proxy in 
                    ForEach(0..<100) { index in
                        Text("ovo je kartica broj #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { newValue in
                        withAnimation(.default) {
                            proxy.scrollTo(newValue, anchor: nil)   
                        }
                    }
                }
            }
        }
    }
}

struct SofaListView_Previews: PreviewProvider {
    static var previews: some View {
        SofaListView()
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
