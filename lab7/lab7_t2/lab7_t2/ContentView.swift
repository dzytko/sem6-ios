//
//  ContentView.swift
//  lab7_t2
//
//  Created by mac on 10/04/2022.
//  Copyright © 2022 mac. All rights reserved.
//

import SwiftUI

struct Flat {
    var name: String
    var area: Double
    var roomCount: Int
    var isDuplex: Bool
    var photoPath: String
    
    internal init(name: String, area: Double, roomCount: Int, isDuplex: Bool, photoPath: String) {
        self.name = name
        self.area = area
        self.roomCount = roomCount
        self.isDuplex = isDuplex
        self.photoPath = photoPath
    }
}

struct House {
    var name: String
    var houseArea: Double
    var roomCount: Int
    var floorCount: Int
    var landArea: Double
    var photoPath: String
    
    internal init(name: String, houseArea: Double, roomCount: Int, floorCount: Int, landArea: Double, photoPath: String) {
        self.name = name
        self.houseArea = houseArea
        self.roomCount = roomCount
        self.floorCount = floorCount
        self.landArea = landArea
        self.photoPath = photoPath
    }
}

struct ContentView: View {
    var houses: [House] = [
        House(name: "House 1", houseArea: 111.11, roomCount: 1, floorCount: 4, landArea: 111.11, photoPath: "house1"),
        House(name: "House 2", houseArea: 222.22, roomCount: 2, floorCount: 5, landArea: 222.22, photoPath: "house2"),
        House(name: "House 3", houseArea: 333.33, roomCount: 3, floorCount: 6, landArea: 333.33, photoPath: "house3"),
    ]
    var flats: [Flat] = [
        Flat(name: "Flat 1", area: 444.44, roomCount: 7, isDuplex: true, photoPath: "flat1"),
        Flat(name: "Flat 2", area: 555.55, roomCount: 8, isDuplex: false, photoPath: "flat2"),
        Flat(name: "Flat 3", area: 666.66, roomCount: 9, isDuplex: false, photoPath: "flat3"),
    ]
    
    var body: some View {
        List {
            Section(header: Text("Houses"), content: {
                ForEach(houses, id: \.self.name) { house in
                    HStack {
                        Text(house.name).padding()
                        Spacer()
                        Image(house.photoPath)
                        .resizable()
                        .frame(width: 200, height: 150)
                    }
                }
            })
            Section(header: Text("Flats"), content: {
                ForEach(flats, id: \.self.name) { flat in
                    HStack {
                        Text(flat.name).padding()
                        Spacer()
                        Image(flat.photoPath)
                        .resizable()
                        .frame(width: 200, height: 150)
                    }
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
