//
//  GeometryReaderView.swift
//  SwiftUI-LongPressGesture
//
//  Created by Krish Mishra on 24/02/26.
//

import SwiftUI

struct GeometryReaderView: View {
    
    func getPercentage(geo : GeometryProxy, containerWidth : CGFloat) -> Double {
        let maxDistance = containerWidth / 2
        let currX = geo.frame(in: .global).midX
        return Double(1 - (currX/maxDistance))
    }
    
    var body: some View {
        GeometryReader { outerGeo in
            ZStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<20) { index in
                            GeometryReader { geometry in
                                Image("Mandu")
                                    .resizable()
                                    .antialiased(true)
                                    .scaledToFill()
                                    .frame(width: 300, height: 250)
                                    .cornerRadius(20)
                                    .rotation3DEffect(
                                        .degrees(getPercentage(geo: geometry, containerWidth: outerGeo.size.width) * 30.0),
                                        axis: (x: 0.0, y: 1.0, z: 0.0)
                                    )
                            }
                            .frame(width: 300, height: 250)
                            .padding()
                        }
                    }
                }
            }
            .frame(width: outerGeo.size.width, height: outerGeo.size.height)
        }
        .ignoresSafeArea()
        
        
//        GeometryReader { geometry in
//            HStack(spacing: 0) {
//                Rectangle()
//                    .fill(Color.red)
//                    .frame(width : geometry.size.width * 0.67) //maintains 2/3rd part even after rotation
//                Rectangle().fill(Color.blue)
//            }
//            .ignoresSafeArea()
//        }
    }
}

#Preview {
    GeometryReaderView()
}
