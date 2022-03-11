//
//  ContentView.swift
//  lab3_t2
//
//  Created by mac on 11/03/2022.
//  Copyright © 2022 mac. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var tireStock = [
        "prod1" :[
            "size1": 1,
            "size2": 2,
            "size3": 3],
        "prod2" :[
            "size1": 4,
            "size2": 5,
            "size3": 6],
        "prod3" :[
            "size1": 7,
            "size2": 8,
            "size3": 9]
        ]
    var tireSizes = ["size1", "size2", "size3"]
    var tireProducres = ["prod1", "prod2", "prod3"]
    @State var tireSizeSelection = "size1"
    @State var tireProducerSelection = "prod1"
    @State var tireCount = ""
    @State var availability: String = ""
    var body: some View {
        VStack(){
            Picker(selection: $tireProducerSelection,
                   label: Text("")) {
                    ForEach(self.tireProducres, id: \.self){
                        Text($0)
                    }
            }.frame(width: 100, height: 150)
            Picker(selection: $tireSizeSelection,
                   label: Text("")) {
                    ForEach(self.tireSizes, id: \.self){
                        Text($0)
                    }
            }.frame(width: 100, height: 150)
            TextField("Ilosc opon", text: $tireCount).multilineTextAlignment(.center)
        
            Text("\(checkAvailability(tireCount: self.tireCount, producer: self.tireProducerSelection, tireSize: self.tireSizeSelection, tireStock: self.tireStock))")
        }
    }
    
    func checkAvailability(tireCount: String, producer: String, tireSize: String, tireStock: [String: [String: Int]]) -> String {
        guard let tireCountInt = Int(tireCount) else {
            return "Podaj ilosc opon"
        }
        if (producer.isEmpty) {
            return "Podaj producenta"
        }
        if (tireSize.isEmpty) {
            return "Podaj rozmiar"
        }
        
        if (tireStock[producer]![tireSize]! >= tireCountInt) {
            return "Dostepne"
        }
        else {
            return "Niedostepne"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
