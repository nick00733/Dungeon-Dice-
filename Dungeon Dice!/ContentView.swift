import SwiftUI

struct ContentView: View {
    
    @State private var diceNum: Int = 1
    @State private var message = "Roll a die!"
    @State private var animationTrigger = false //change when animation should occur
    @State private var isDoneAnimating = true
    @State private var rolls: [Int] = [] //Empty
    private var grandTotal: Int { rolls.reduce(0, +)}
    
    enum Dice: Int, CaseIterable, Identifiable {
        case d4 = 4
        case d6 = 6
        case d8 = 8
        case d10 = 10
        case d12 = 12
        case d20 = 20
        case d100 = 100
        
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
            
            GroupBox {
                ForEach(rolls, id: \.self) { roll in
                    Text("\(roll)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider()
                }
                
                
                HStack{
                    Text("TOTAL: \(rolls.reduce(0, +))")
                        .font(.title2)
                        .bold()
                        .monospacedDigit()
                        .contentTransition(.numericText())
                        .animation(.default, value: grandTotal)
                    Spacer()
                    Button("Clear") {
                        rolls.removeAll()
                    }
                            .buttonStyle(.glass)
                            .tint(.red)
                            .disabled(rolls.isEmpty)
                }
                
            } label: {
                Text("Session Rolls:")
                    .font(.title2)
                    .bold()
            }

            
            Spacer()
            
            Text(message)
                .font(.title)
                .multilineTextAlignment(.center)
                .rotation3DEffect(isDoneAnimating ? .degrees(360) : .degrees(0), axis: (1, 0, 0))
                .onChange(of: animationTrigger) {
                    isDoneAnimating = false // set to the beginning false
                    withAnimation(.interpolatingSpring(duration: 0.6, bounce: 0.4)) {
                        isDoneAnimating = true
                    }
                }
                //WUSSTE NICHT WIE MAN CENTER
                
            
            Spacer()
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))]){
                ForEach(Dice.allCases) { die in
                    Button("\(die.rawValue)-sided") {
                        animationTrigger.toggle()
                        let roll = die.roll
                        message = ("You rolled a \(die.roll) on a \(die)")
                        rolls.append(roll)
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
