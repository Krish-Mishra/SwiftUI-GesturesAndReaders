//
//  MagnificationGestureView.swift
//  SwiftUI-LongPressGesture
//
//  Created by Krish Mishra on 23/02/26.
//

import SwiftUI

struct MagnificationGestureView: View {
    
    @State var currAmount : CGFloat = 0
    @State var lastAmount : CGFloat = 0
    
    var body: some View {
        
        VStack(spacing: 20) {
            HStack {
                Circle().frame(width: 35, height: 35)
                Text("Krish Mishra")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            Rectangle()
                .frame(height: 300)
                .scaleEffect(1.0 + currAmount)
                .gesture(
                    MagnifyGesture()
                        .onChanged{ value in
                            currAmount = value.magnification - 1
                        }
                        .onEnded { value in
                            withAnimation(.bouncy) {
                                currAmount = 0
                            }
                        }
                )
            
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
            Text("This is the caption for my photo")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
        
        
        
        
        
        
        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .font(Font.title)
//            .padding(40)
//            .background(Color.red.cornerRadius(10))
//            .scaleEffect(1 + currAmount + lastAmount)
//            .gesture(
//                MagnifyGesture()
//                    .onChanged { value in
//                        currAmount = value.magnification - 1
//                    }
//                    .onEnded { value in
//                        lastAmount += currAmount
//                        currAmount = 0
//                    }
//            )
    }
}

#Preview {
    MagnificationGestureView()
}
