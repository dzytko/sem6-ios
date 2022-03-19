//
//  ContentView.swift
//  lab4_t1
//
//  Created by mac on 19/03/2022.
//  Copyright © 2022 mac. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private var exchangeRates = ["PLN": 1, "USD": 4.2, "EUR": 4.7, "GPB": 5.6]
    @State private var fromCurrency = "PLN"
    @State private var toCurrency = "PLN"
    @State private var amount: Int = 1
    
    var body: some View {
        VStack {
            Text("Kantor").padding()
            Group {
                Text("Waluta do kupienia")
                
                Spacer()
                
                TextField("Wartosc waluty do kupienia", text: Binding(
                    get: { String(self.amount) },
                    set: { self.amount = abs(Int($0) ?? self.amount) }
                    )
                )
                .multilineTextAlignment(.center)
                .padding(.top)
                
                Picker("", selection: $toCurrency) {
                    ForEach(Array(exchangeRates.keys), id: \.self) { key in
                        Text(key)
                    }
                }.labelsHidden()
            }
            
            Divider().padding()
            
            Group {
                Text("Waluta do zaplaty")
                
                Picker("Płatność za pomocą", selection: $fromCurrency) {
                    ForEach(Array(exchangeRates.keys), id: \.self) { key in
                        Text(key)
                    }
                }.labelsHidden()
                
                Text("Do zapłaty: \(self.exchangeRates[self.toCurrency]! / self.exchangeRates[self.fromCurrency]! * Double(self.amount), specifier: "%.2f") \(self.toCurrency)")
            }
            
            Spacer()
            Text("Godiny otwarcia: 8:00-20:00")
            Text("Kontakt: mail@mail.com")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
