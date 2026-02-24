//
//  ScrollViewReader.swift
//  SwiftUI-LongPressGesture
//
//  Created by Krish Mishra on 24/02/26.
//

import SwiftUI

struct ScrollViewReaderView: View {
    @State var ref : Int = 0;
    @State var s : String = ""
    var body: some View {
        VStack {
            TextField("Go to Item number", text: $s)
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("Click here to go") {
                withAnimation(.spring){
                    if let index = Int(s) {
                        ref = index
                    }
                }
            }
            
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<50) { index in
                        Text("Item \(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index) //for giving the proxy, exact location
                    }
                    .onChange(of: ref) { oldValue, newValue in
                        withAnimation(.spring){
                            proxy.scrollTo(newValue, anchor: .top)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollViewReaderView()
}
