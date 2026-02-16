import SwiftUI

struct ContentView: View {
    
    @State private var diceNum: Int = 1
    @State private var message = "Roll a die!"
    private let diceTypes = [4, 6, 8, 10, 12, 20, 100]
    
    var body: some View {
        VStack {
            Text("Dungeon Dice!")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.red) //WUSSTE ICH NICHT
            
            Spacer()
            Text(message)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                //WUSSTE NICHT WIE MAN CENTER
                
            
            Spacer()
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))]){
                    ForEach(diceTypes, id: \.self) { diceType in
                        Button("\(diceType)-sided") {
                            rollDie(sides: diceType)
                        }
                        .buttonStyle(.glassProminent)
                        .tint(.red) // WUSSTE NICHT WIE ICH DEN HINTERGRUND VOM BUTTON EINSTELLE
                        .lineLimit(1)
                        .fixedSize(horizontal: true, vertical: false)
                        .font(.title2)
                    }
                .font(.largeTitle)
                }
        }
        .padding()
    }
    
    func rollDie(sides: Int) {
        diceNum = Int.random(in: 1...sides)
        message = ("You rolled a \(diceNum) on a \(sides)-sided die.")
    }
}

#Preview {
    ContentView()
}
