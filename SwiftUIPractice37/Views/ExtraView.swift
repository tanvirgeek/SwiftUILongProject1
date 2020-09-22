//
//  ExtraView.swift
//  SwiftUIPractice37
//
//  Created by MD Tanvir Alam on 19/9/20.
//  Copyright © 2020 MD Tanvir Alam. All rights reserved.
//

import SwiftUI

struct ExtraView: View {
    @State var number1 : Int
    var number2 : Int
    var girfriendName = ["Ifa", "Shuvo", "Rodoshi"]
    @State var girlFriendOpacity = 0.0
    @State var girlfriendIndex = Int.random(in: 0...2)
    var body: some View {
        VStack{
            HStack {
                Spacer().frame(width: 50, height: 50)
                Text("\(number1 + number2)").onTapGesture (count:2){
                    self.number1 += 2
                    
                }
                Text("My girlfriend is")
                Button(action: {
                    self.girlFriendOpacity = 1
                    self.girlfriendIndex = Int.random(in: 0...2)
                }) {
                    Text("Button")
                        .foregroundColor(Color.green)
                }.padding().background(Color.gray)
                    

                Spacer()
            }
            Text(girfriendName[girlfriendIndex]).opacity(girlFriendOpacity)
                
            Spacer()
        }
        
    }
}

struct ExtraView_Previews: PreviewProvider {
    static var previews: some View {
        ExtraView(number1: 10, number2: 20)
    }
}
