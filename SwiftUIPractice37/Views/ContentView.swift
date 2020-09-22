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
    @State private var goToGirlsDescription: String? = nil
    @ObservedObject private var keyboard = KeyboardResponder()
    @State var anAlert = false
    var body: some View {
        
        
        HStack {
            NavigationView {
                            
                            VStack (alignment:.leading, spacing:20){
                                ExtraView(number1: 10, number2: 20)
                                
                                Button(action: {
                                    self.goToGirlsDescription = "GirlsDescription"
                                }) {
                                    Text("Description of girls")
                                }.background(Color.black)
                                .foregroundColor(Color.white)
                 NavigationLink(destination: GirlsDescription(), tag: "GirlsDescription", selection: $goToGirlsDescription) {
                     EmptyView()
                 }

                                Text("Hello World")
                                .kerning(20)
                                Spacer()
                                    .frame(height:50)
                                Text("Tap Me")
                                    .onTapGesture {
                                        self.anAlert = true
                                }.alert(isPresented: $anAlert) {
                                    Alert(title: Text("Why are you tapping me!!"), message: Text("Am I soft?"), dismissButton: .default(Text("Go Away")))
                                }
                                
                                Group{
                                    TextField("Type first number", text: $number1)
                                    TextField("Type second number", text: $number2)
                                }
                                .foregroundColor(Color.red)
                                .keyboardType(.numberPad).padding(20)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .background(Color.black).border(Color.blue,width:5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.green.opacity(0.8), lineWidth: 10)
                                )
                                
                                Button(action: {
                                    self.isTapped.toggle()
                                    UIApplication.shared.endEditing()
                                    if let num1 = Double(self.number1), let num2 = Double(self.number2){
                                        self.sum = num1 + num2
                                        self.selection = "Second"
                                        self.number1 = ""
                                        self.number2 = ""
                                    }
                                    
                                }) {
                                    
                                    Text("Add Two Numbers")
                                        .padding()
                                        .foregroundColor(.blue)
                                        .background( isTapped ? Color.orange : Color.green)
                                        .font(.title)
                                        .border(Color.blue, width: 5)
                                        .shadow(color: Color.orange, radius:10 )
                                    
                                }
                                NavigationLink(destination: Text("\(self.sum, specifier:("%.2f"))"), tag: "Second", selection: $selection) {
                                    EmptyView()
                                }
                                
                            }
                             .onTapGesture {
                                UIApplication.shared.endEditing()
                            }
                           
            }
        }
        .padding(.bottom, keyboard.currentHeight)
        .animation(.easeOut(duration: 0.16))
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
