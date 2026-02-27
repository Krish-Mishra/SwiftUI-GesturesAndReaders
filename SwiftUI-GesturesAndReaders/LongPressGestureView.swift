//
//  LongPressGestureView.swift
//  SwiftUI-LongPressGesture
//
//  Created by Krish Mishra on 23/02/26.
//

import SwiftUI

struct LongPressGestureView : View {
    
    @State var isComplete : Bool = false
    @State var isSuccess : Bool = false
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(isSuccess ? Color.green : Color.yellow)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            
            HStack{
                Text("Click Here")
                    .padding()
                    .padding(.horizontal)
                    .foregroundStyle(Color.white)
                    .background(isSuccess ? Color.green : Color.blue)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 10.0, pressing : { (isPressing) in
                        // from start of press to min duration
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isComplete = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                                if !isSuccess {
                                    withAnimation(.easeInOut) {
                                        isComplete = false
                                    }
                                }
                            })
                        }
                    } ,perform : {
                        withAnimation(.easeInOut){
                            isSuccess = true
                        }
                    })
                
                Text("RESET")
                    .padding()
                    .padding(.horizontal)
                    .foregroundStyle(Color.white)
                    .background(Color.red)
                    .cornerRadius(10)
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
        }
        
        
        
        
        
        
        
        
        
        //        Text(isComplete ? "completed" : "long press")
        //            .padding()
        //            .padding(.horizontal)
        //            .background(isComplete ? Color.green : Color.gray)
        //            .cornerRadius(10)
        ////            .onTapGesture {
        ////                isComplete.toggle()
        ////            }
        //            .onLongPressGesture(minimumDuration: 0.7, maximumDistance: 10.0) {
        //                isComplete.toggle()
        //            }
    }
    
}

#Preview {
    LongPressGestureView()
}
