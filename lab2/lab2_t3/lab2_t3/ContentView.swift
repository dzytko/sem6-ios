//
//  ContentView.swift
//  lab2_t3
//
//  Created by mac on 05/03/2022.
//  Copyright © 2022 mac. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var e1 = 0
    @State var e2 = 0
    @State var e3 = 0
    
    @State var result = ""
    
    var body: some View {
        VStack(alignment:.leading){
            HStack(){
                Text("Podaj bok 1:")
                TextField("", text: Binding(
                    get:{String(self.e1)},
                    set:{self.e1 = Int($0) ?? 0})
                ).frame(width: CGFloat(70)).border(Color.black)
            }
            HStack(){
                Text("Podaj bok 2:")
                TextField("", text: Binding(
                    get:{String(self.e2)},
                    set:{self.e2 = Int($0) ?? 0})
                ).frame(width: CGFloat(70)).border(Color.black)
            }
            HStack(){
                Text("Podaj bok 3:")
                TextField("", text: Binding(
                    get:{String(self.e3)},
                    set:{self.e3 = Int($0) ?? 0})
                ).frame(width: CGFloat(70)).border(Color.black)
            }
            Text("Podano: \(e1), \(e2), \(e3)")
            Button(action:{
                if (self.e1 > 0 && self.e2 > 0 && self.e3 <= 0 &&
                    self.e1 + self.e2 > self.e3 &&
                    self.e1 + self.e3 > self.e2 &&
                    self.e2 + self.e3 > self.e1){
                    self.result = "Da sie zbudowac trojkat"
                }
                else {
                    self.result = "Nie da sie zbudowac trojkata"
                }
            },
            label: {Text("Trojkat")})
                .background(Color.blue)
                .foregroundColor(.red)
                .cornerRadius(CGFloat(10))
                .padding([.top, .bottom])
            Text(result).foregroundColor(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
