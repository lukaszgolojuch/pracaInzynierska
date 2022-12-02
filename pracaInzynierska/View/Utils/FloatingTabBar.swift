//
//  FloatingTabBar.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/29/22.
//

import SwiftUI

struct FloatingTabbar : View {
     
    @Binding var selected : Int
    @Binding var isPresenting : Bool
    @State var expand = false
    let colors = AppColors()
     
    var body : some View{
         
        HStack{
             
            Spacer(minLength: 0)
             
            HStack{
                if !self.expand{
                     
                    Button(action: {
                        self.expand.toggle()
                    }) {
                        Image(systemName: "arrow.left").foregroundColor(colors.gold).padding()
                    }
                }
                else{
                    Button(action: {
                        self.selected = 0
                        self.isPresenting = false
                        self.expand = false
                    }) {
                        Image(systemName: "doc.plaintext.fill").foregroundColor(self.selected == 0 ? colors.gold : .gray).padding(.horizontal)
                    }
                     
                    Spacer(minLength: 15)
                     
                    Button(action: {
                        self.isPresenting = false
                        self.selected = 1
                        self.expand = false
                    }) {
                        Image(systemName: "star.fill").foregroundColor(self.selected == 1 ? colors.gold : .gray).padding(.horizontal)
                    }
                     
                    Spacer(minLength: 15)
                     
                    Button(action: {
                        self.isPresenting = false
                        self.selected = 2
                        self.expand = false
                    }) {
                        Image(systemName: "photo.artframe").foregroundColor(self.selected == 2 ? colors.gold : .gray).padding(.horizontal)
                    }
                    
                    Spacer(minLength: 15)
                    
                    Button(action: {
                        self.isPresenting = false
                        self.isPresenting = true
                        self.expand = false
                    }) {
                        Image(systemName: "camera").foregroundColor(self.selected == 3 ? colors.gold : .gray).padding(.horizontal)
                    }
                }
            }.padding(.vertical,self.expand ? 20 : 8)
            .padding(.horizontal,self.expand ? 35 : 8)
            .background(self.expand == false ? colors.lightGrey : .white)
            .clipShape(Capsule())
            .padding(22)
            .onLongPressGesture {
                    self.expand.toggle()
            }
            .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6))
        }
    }
}

