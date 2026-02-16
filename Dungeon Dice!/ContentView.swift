import SwiftUI

struct ContentView: View {
    
    @State private var diceNum: Int = 1
    @State private var message = "Roll a die!"
    
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
            
            Group {
                HStack {
                    Button {
                        rollDie(sides: 4)
                    } label: {
                        Text("4-sided")
                    }
                    Button {
                        rollDie(sides: 6)
                    } label: {
                        Text("6-sided")
                    }
                    Button {
                        rollDie(sides: 8)
                    } label: {
                        Text("8-sided")
                    }
                }
                HStack {
                    Button {
                        rollDie(sides: 10)
                    } label: {
                        Text("10-sided")
                    }
                    Button {
                        rollDie(sides: 12)
                    } label: {
                        Text("12-sided")
                    }
                    Button {
                        rollDie(sides: 20)
                    } label: {
                        Text("20-sided")
                    }
                }
                Button {
                    rollDie(sides: 100)
                } label: {
                    Text("100-sided")
                }
            }
            .buttonStyle(.glassProminent)
            .tint(.red) // WUSSTE NICHT WIE ICH DEN HINTERGRUND VOM BUTTON EINSTELLE
            .font(.title2)

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
