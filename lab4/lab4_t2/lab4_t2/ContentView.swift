//
//  ContentView.swift
//  lab4_t2
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

struct ContentView: View {
    private var shapes = ["Kolo", "Kwadrat", "Trojkat"]
    private var colors = ["Czerwony": Color.red, "Zielony": Color.green, "Niebiesi": Color.blue]
    @State private var frameSize = 1
    @State private var drawFrame = false
    @State private var selectedShape = "Kwadrat"
    @State private var selectedColor = "Czerwony"
    
    var body: some View {
        VStack {
            Picker(selection: $selectedShape, label: Text("Wybierz ksztalt")) {
                ForEach(shapes, id: \.self) { shape in
                    Text(shape)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            Picker(selection: $selectedColor, label: Text("Wybierz kolor")) {
                ForEach(Array(colors.keys), id: \.self) { key in
                    Text(key)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            TextField("Wybierz rozmiar ramki", text: Binding(
                get: { String(self.frameSize) },
                set: { self.frameSize = Int($0) ?? self.frameSize })
            ).multilineTextAlignment(.center)
            
            Toggle("Ramka", isOn: $drawFrame).padding(.horizontal)
            
            if selectedShape == "Kwadrat" {
                Rectangle()
                .fill(self.colors[self.selectedColor]!)
                .frame(width: 100, height: 100)
                .border(Color.black, width: self.drawFrame == true ? CGFloat(self.frameSize) : 0)
            }
            else if selectedShape == "Kolo" {
                Circle()
                .fill(self.colors[self.selectedColor]!)
                .frame(width: 100, height: 100)
                .border(Color.black, width: self.drawFrame == true ? CGFloat(self.frameSize) : 0)
            }
            else if selectedShape == "Trojkat" {
                Triangle()
                .fill(self.colors[self.selectedColor]!)
                .frame(width: 100, height: 100)
                .border(Color.black, width: self.drawFrame == true ? CGFloat(self.frameSize) : 0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
