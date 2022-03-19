//
//  ContentView.swift
//  lab5_t1
//
//  Created by mac on 19/03/2022.
//  Copyright © 2022 mac. All rights reserved.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct FirstView: View {
    var body: some View {
        NavigationView {
            VStack {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
                NavigationLink (
                    destination: SecondView(),
                    label: {
                        Text("Nastepny widok")
                    }
                )
            }.navigationBarTitle(Text("Pierwszy widok"))
        }
    }
}

struct SecondView: View {
    var body: some View {
        VStack {
            Circle()
            .fill(Color.green)
            .frame(width: 100, height: 100)
            NavigationLink(
                destination: ThirdView(),
                label: {
                    Text("Nastepny widok")
                }
            )
        }.navigationBarTitle(Text("Drugi widok"))
    }
}

struct ThirdView: View {
    var body: some View {
        VStack {
            Triangle()
            .fill(Color.blue)
            .frame(width: 100, height: 100)
            Spacer().frame(width: 10, height: 10)
        }.navigationBarTitle(Text("Trzeci widok"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
