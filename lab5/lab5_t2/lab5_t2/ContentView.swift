//
//  ContentView.swift
//  lab5_t2
//
//  Created by mac on 19/03/2022.
//  Copyright © 2022 mac. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: Brand1View(),
                    label: {
                        Text("Marka 1")
                    })
                NavigationLink(
                    destination: Brand2View(),
                    label: {
                        Text("Marka 2")
                    })
                NavigationLink(
                    destination: Brand3View(),
                    label: {
                        Text("Marka 3")
                    })
            }
        }
    }
}

struct Brand1View: View {
    var body: some View {
        Text("Brand 1 models")
    }
}

struct Brand2View: View {
    var body: some View {
        Text("Brand 2 models")
    }
}

struct Brand3View: View {
    var body: some View {
        Text("Brand 3 models")
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
