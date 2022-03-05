//
//  ContentView.swift
//  lab2_t4
//
//  Created by mac on 05/03/2022.
//  Copyright © 2022 mac. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var num1: Int = 0;
    @State var num2: Int = 0;
    
    @State var result = ""
    
    var body: some View {
        VStack(){
            HStack(){
                Text("Liczba 1: ")
                TextField("", text: Binding(
                    get:{String(self.num1)},
                    set:{self.num1 = Int($0) ?? 0}
                )).frame(width: CGFloat(70)).border(Color.black)
            }
            HStack(){
                Text("Liczba 2: ")
                TextField("", text: Binding(
                    get:{String(self.num2)},
                    set:{self.num2 = Int($0) ?? 0}
                )).frame(width: CGFloat(70)).border(Color.black)
            }
            Button(action:{
                self.result = String(self.num1 + self.num2)
            }, label: {Text("+")})

            Button(action:{
                self.result = String(self.num1 - self.num2)
            }, label: {Text("-")})

            Button(action:{
                self.result = String(self.num1 * self.num2)
            }, label: {Text("*")})

            Button(action:{
                if (self.num2 == 0) {
                    self.result = "Dzielenie przez 0"
                    return
                }
                self.result = String(self.num1 / self.num2)
                }, label: {Text("/")}).frame(width: CGFloat(70))
            
            Text(result).padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
