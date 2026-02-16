import SwiftUI

struct ContentView: View {
    
    @State private var diceNum: Int = 1
    @State private var message = "Roll a die!"
    
    enum Dice: Int, CaseIterable, Identifiable {
        case four = 4
        case six = 6
        case eight = 8
        case ten = 10
        case twelve = 12
        case twenty = 20
        case hundred = 100
        
        var id: Int {
            self.rawValue
        }
        var roll: Int {
            return Int.random(in: 1...self.rawValue)
        }
    }
    
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
                ForEach(Dice.allCases) { die in
                    Button("\(die.rawValue)-sided") {
                        message = ("You rolled a \(die.roll) on a \(die)-sided die.")
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
}

#Preview {
    ContentView()
}
