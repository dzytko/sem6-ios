//
//  ContentView.swift
//  lab2_t2
//
//  Created by mac on 05/03/2022.
//  Copyright © 2022 mac. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom){
            Image("doggo")
            HStack(alignment: .bottom){
                VStack(alignment: .leading){
                    Text("Title").foregroundColor(Color.green).font(.headline)
                    Text("Author").foregroundColor(Color.green)
                }
                Spacer()
            }
            .padding()
            .background(Color.white.opacity(0.5))
            .border(Color.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
