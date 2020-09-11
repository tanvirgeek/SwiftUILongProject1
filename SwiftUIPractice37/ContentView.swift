//
//  ContentView.swift
//  SwiftUIPractice37
//
//  Created by MD Tanvir Alam on 10/9/20.
//  Copyright © 2020 MD Tanvir Alam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var number1 : String = ""
    @State private var number2: String = ""
    @State private var isTapped:Bool = false
    @State var sum : Double = 0
    @State private var selection: String? = nil
    @ObservedObject private var keyboard = KeyboardResponder()
    var body: some View {
        
        NavigationView {
            VStack{
                TextField("Type first number", text: $number1)
                    .keyboardType(.numberPad).padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color.gray).border(Color.blue,width:5)
                
                TextField("Type second number", text: $number2)
                    .keyboardType(.numberPad).padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color.gray).border(Color.blue,width:5)
                
                Button(action: {
                    print("I am here in the action")
                    self.isTapped.toggle()
                    UIApplication.shared.endEditing()
                    if let num1 = Double(self.number1), let num2 = Double(self.number2){
                        print("I am here")
                        self.sum = num1 + num2
                        print("\(self.sum)")
                    }
                    self.selection = "Second"
                }) {
                    
                    Text("Add Two Numbers")
                        .padding()
                        .foregroundColor(.blue)
                        .background( isTapped ? Color.orange : Color.gray)
                        .font(.title)
                        .border(Color.blue, width: 5)
                        .shadow(radius: 10)
                    
                }
                NavigationLink(destination: Text("\(self.sum, specifier:("%.2f"))"), tag: "Second", selection: $selection) {
                    EmptyView()
                }
                
            }.padding()
            .padding(.bottom, keyboard.currentHeight)
            .edgesIgnoringSafeArea(.bottom)
            .animation(.easeOut(duration: 0.16))
            
        }
        
    }
}
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
