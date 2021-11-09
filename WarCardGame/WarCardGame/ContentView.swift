//
//  ContentView.swift
//  WarCardGame
//
//  Created by Steven Wijaya on 14.09.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "back"
    @State var cpuCard = "back"
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        ZStack{
            Image("background").resizable().ignoresSafeArea()
            VStack{
                Spacer()
                Image("logo").aspectRatio(contentMode: .fit)
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button(action: {
                    //Update cards
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    playerCard = "card\(playerRand)"
                    cpuCard = "card\(cpuRand)"
                    //Update score
                    if playerRand > cpuRand{
                        playerScore += 1
                    }
                    else if playerRand < cpuRand{
                        cpuScore += 1
                    }
                    else{
                        playerScore += 0
                        cpuScore += 0
                    }
                }, label: {
                    HStack{
                        Image("dealbutton")
                    }
                })
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player 1")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .padding(.bottom)
                        Text(String(playerScore))
                            .font(.title)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                        .font(.title)
                            .foregroundColor(Color.white)
                            .padding(.bottom)
                        Text(String(cpuScore))
                            .font(.title)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
