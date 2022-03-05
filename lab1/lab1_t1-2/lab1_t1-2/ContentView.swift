import SwiftUI

struct ContentView: View {
    var validDays = [
        "poniedzialek",
        "wtorek",
        "sroda",
        "czwartek",
        "piatek",
        "sobota",
        "niedziela"
    ]
    @State var day = ""
    @State var dayChoice = ""

    var body: some View {
        VStack() {
            Text("Podaj wybrany dzien tygodnia")
                    .foregroundColor(Color.red)
                    .rotation3DEffect(.degrees(45), axis: (1, 0, 0))
            TextField("Wpisz dzien tygodnia", text: $day).multilineTextAlignment(.center)
            Button(action: {
                if (self.validDays.contains(self.day.lowercased())){
                    self.dayChoice = self.day
                }
                else {
                    self.dayChoice = ""
                }
            }){
                Text("Zatwierdz wybor")
            }.background(Color.green)
            Text("Wybrano: \(dayChoice)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
