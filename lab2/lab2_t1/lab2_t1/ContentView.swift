import SwiftUI

struct ContentView: View {
    var colorArray = [Color.red, Color.orange, Color.yellow, Color.green, Color.blue, Color.purple]
    
    var body: some View {
        ZStack{
            ForEach(0...5, id: \.self) { colorIdx in
                Rectangle()
                    .fill(self.colorArray[colorIdx])
                    .frame(width: 200, height: 200)
                    .offset(x: CGFloat(colorIdx) * 10.0, y: CGFloat(colorIdx) * 10.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
