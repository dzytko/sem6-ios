import SwiftUI

struct ColorView: View {
    @Binding var color: Color
    let colors: [Color] = [.red, .green, .blue, .pink]

    var body: some View {
        VStack {
            Picker("Kolory", selection: $color) {
                ForEach(colors, id: \.self) { color in
                    Text(color.description.capitalized)
                            .foregroundColor(color)
                            .padding()
                }
            }.labelsHidden()
        }.navigationBarTitle(Text("Drugi widok"))
    }
}

struct ContentView: View {
    @State private var chosenColor: Color = Color.red

    var body: some View {
        NavigationView {
            VStack() {
                Text("Text").foregroundColor(chosenColor)

                NavigationLink(
                        destination: ColorView(color: $chosenColor),
                        label: {
                            Text("Wybor koloru")
                        })
            }.navigationBarTitle(Text("Pierwszy widok"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
