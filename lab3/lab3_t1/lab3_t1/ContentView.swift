//
//  ContentView.swift
//  lab3_t1
//
//  Created by mac on 11/03/2022.
//  Copyright © 2022 mac. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var pressCount = 0
    
    var body: some View {
        VStack(){
            Text("Wcisnij przycisk")
            Button(action: {
                self.pressCount += 1
            }, label: {Text("Wcisnij")})
                .background(Color.gray)
                .foregroundColor(Color.green)
                .cornerRadius(10)
            Text("Wcisnieto \(pressCount) razy!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
