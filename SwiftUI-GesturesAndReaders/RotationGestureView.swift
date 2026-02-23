//
//  RotationGestureView.swift
//  SwiftUI-LongPressGesture
//
//  Created by Krish Mishra on 23/02/26.
//

import SwiftUI

struct RotationGestureView: View {
    
    @State var rotation : Angle = .zero
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding(20)
            .background(Color.blue)
            .cornerRadius(10)
            .rotationEffect(rotation)
            .gesture(
                RotateGesture()
                    .onChanged { value in
                        rotation = value.rotation
                    }
                    .onEnded{ value in
                        withAnimation(.spring){
                            rotation = .zero
                        }
                    }
            )
    }
}

#Preview {
    RotationGestureView()
}
