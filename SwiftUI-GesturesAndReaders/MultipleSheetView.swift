//
//  MultipleSheetView.swift
//  SwiftUI-LongPressGesture
//
//  Created by Krish Mishra on 24/02/26.
//

//Avoid adding any logic like conditional statements inside the sheet area, it generally causes logical errors

import SwiftUI

// 1- use a binding
// 2- use multiple sheets
// 3- use $item approach

struct RandomModel : Identifiable {
    let id = UUID().uuidString
    let title: String
}

struct MultipleSheetView: View {
    
    @State var selectedModel : RandomModel? = nil
//    @State var showSheet : Bool = false
//    @State var showSheet2 : Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Button1") {
                selectedModel = RandomModel(title: "ONE")
                //showSheet.toggle()
            }
//            .sheet(isPresented: $showSheet) {
//                NextScreen(selectedModel: RandomModel(title: "ONE"))
//            }
            Button("Button2") {
                selectedModel = RandomModel(title: "TWO")
                //showSheet2.toggle()
            }
//            .sheet(isPresented: $showSheet2) {
//                NextScreen(selectedModel: RandomModel(title: "TWO"))
//                
//                //use multiple sheets method when there is no parent child heirarchy and few sheets are required
//            }
        }
        .sheet(item: $selectedModel) { model in
            NextScreen(selectedModel: model)
        }
//        .sheet(isPresented: $showSheet) {
//            NextScreen(selectedModel: selectedModel)
//        }
    }
}

struct NextScreen : View {
    
    let selectedModel : RandomModel // this makes the first toggle not show appropriate title on the next screen, use Binding instead for first approach
    
    //@Binding var selectedModel : RandomModel // we can use this fix only when we know that it is not static, because it changes with the main selectedModel of MultipleSheetView
    
    var body: some View {
        Text(selectedModel.title)
            .font(Font.largeTitle)
    }
}

#Preview {
    MultipleSheetView()
}
