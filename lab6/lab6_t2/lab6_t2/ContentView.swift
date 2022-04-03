import SwiftUI

enum CoffeeType: String, CaseIterable {
    case Americano, Latte, Mocha, Cappuccino
}

enum JuiceFlavour: String, CaseIterable {
    case Pomaranczowy, Jablkowy, Owocowy, Mango
}

struct CoffeeTypeView: View {
    @Binding var coffeeType: CoffeeType

    var body: some View {
        VStack {
            Picker("Kawa", selection: $coffeeType) {
                ForEach(CoffeeType.allCases, id: \.self) { coffeeType in
                    Text(coffeeType.rawValue)
                }
            }.padding()
        }.navigationBarTitle(Text("Wybór kawy"))
    }
}

struct JuiceAndCoffeeView: View {
    var body: some View {
        Text("JuiceAndCoffeeView")
    }
}

struct JuiceFlavourView: View {
    @Binding var juiceFlavour: JuiceFlavour

    var body: some View {
        VStack {
            Picker("Smak soku", selection: $juiceFlavour) {
                ForEach(JuiceFlavour.allCases, id: \.self) { flavour in
                    Text(flavour.rawValue)
                }
            }.padding()
        }.navigationBarTitle(Text("Wybór smaku soku"))
    }
}

struct ContentView: View {
    @State var juiceFlavour: JuiceFlavour = JuiceFlavour.Pomaranczowy
    @State var coffeeType: CoffeeType = CoffeeType.Cappuccino

    var body: some View {
        NavigationView {
            VStack {
                Text("Smak soku: \(juiceFlavour.rawValue)")
                        .padding(.top)
                Text("Rodzaj kawy: \(coffeeType.rawValue)")

                List {
                    NavigationLink(
                            destination: JuiceFlavourView(juiceFlavour: $juiceFlavour),
                            label: {
                                Text("Wybór smaku soku")
                            })

                    NavigationLink(
                            destination: CoffeeTypeView(coffeeType: $coffeeType),
                            label: {
                                Text("Wybór rodzaju kawy")
                            })
                }
            }.navigationBarTitle(Text("Restauracja"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
