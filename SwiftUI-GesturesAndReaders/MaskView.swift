//
//  MaskView.swift
//  SwiftUI-LongPressGesture
//
//  Created by Krish Mishra on 24/02/26.
//

import SwiftUI

struct MaskView: View {
    
    @State var rating : Int = 0
    
    var body: some View {
        ZStack {
           starsView
                .overlay(
                    overlayView
                        .mask(starsView) // the rectangle masks into the starsView
                )
        }
    }
    
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    //.foregroundStyle(Color.yellow)
                    .fill(LinearGradient(colors: [Color.red, Color.blue], startPoint: .leading, endPoint: .trailing))
                    .frame(width : geometry.size.width * CGFloat(rating)/5)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundStyle(Color.gray)
                    .onTapGesture {
                        withAnimation {
                            rating = index
                        }
                    }
            }
            
        }
    }
}

#Preview {
    MaskView()
}
