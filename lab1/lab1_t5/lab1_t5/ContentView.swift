//
//  ContentView.swift
//  lab1_t5
//
//  Created by mac on 05/03/2022.
//  Copyright © 2022 mac. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var val1 = ""
    @State var val2 = ""
    @State var result = ""
    
    var body: some View {
        VStack(){
            Text("Podaj dwie liczby rzeczywiste")
            TextField("Liczba 1", text: $val1).multilineTextAlignment(.center)
            TextField("Liczba 2", text: $val2).multilineTextAlignment(.center)
            Button(action: {
                guard let val1float = Float(self.val1) else {
                    self.result = "Liczba 1 nie jest poprawna"
                    return
                }
                
                guard let val2float = Float(self.val2) else {
                    self.result = "Liczba 1 nie jest poprawna"
                    return
                }
                
                if (val2float == 0) {
                    self.result = "Dzielenie przez 0"
                    return
                }
                
                self.result = String(val1float / val2float)
                
            }, label: {Text("Oblicz")})
            Text("\(result)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
