//
//  ContentView.swift
//  ingIngUseEnum
//
//  Created by Ham Seonwoo on 2023/06/26.
//

import SwiftUI

enum GameState {
    case start
    case inGame
    case end
}


struct ContentView: View {
    var comChoiceArray: [String] = ["scissor","rock", "paper"]
    
    @State var computerChoice: Int = Int.random(in: 0...2)
    @State var myChoice: Int = 0
    @State var count: Int = 0
    
    @State var resultText: String = ""
    
    @State var gameState: GameState = .start
    
    var body: some View {
        switch gameState {
        case .start:
            VStack{
                Text("가위 바위 보 게임")
                    .bold()
                    .font(.title)
                
                HStack{
                Label:do {
                    Image("scissor")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image("rock")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image("paper")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                }.padding()
                Button {
                    gameState = .inGame
                } label: {
                    Text("Game Start")
                        .bold()
                        .padding()
                }

            }.padding()
        case .inGame:
            if count <= 5 {
                VStack{
                    HStack{
                        Button {
                            myChoice = 0
                            findResult()
                        } label: {
                            VStack{
                                Image("scissor")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Text("Scissor")
                            }
                        }.padding()
                        Button {
                            myChoice = 1
                            findResult()
                        } label: {
                            VStack{
                                Image("rock")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Text("rock")
                            }
                        }.padding()
                        Button {
                            myChoice += 2
                            findResult()
                        } label: {
                            VStack{
                                Image("paper")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Text("paper")
                            }
                        }.padding()
                    }
                    
                    HStack{
                        VStack{
                            Image("\(comChoiceArray[myChoice])")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Text(" 나 : \(comChoiceArray[myChoice])")
                            
                        }
                    }
                    
                Label:do {
                    if resultText == "" {
                        Text("얼른 선택하세요 ~ ")
                            .padding()
                            .bold()
                            .background(Color.red)
                    } else {
                        Text(" 컴퓨터 : \(comChoiceArray[computerChoice])")
                        Text(" 결과는 \(resultText) 입니다. ")
                            .font(.title3)
                            .bold()
                            .padding()
                            .background(Color.green) // 배경색 지정
                            .foregroundColor(.white)
                    }
                }
                    
                    Button {
                        print("1 \(computerChoice) -1 \(myChoice) -2 \(resultText) -3")
                        computerChoice = Int.random(in: 0...2)
                        myChoice = 0
                        resultText = ""

                        print("3 \(computerChoice) -1 \(myChoice) -2 \(resultText) -3")
                    } label: {
                        Text("다음 게임")
                    }
                    
                    
                }
            }else {
                Text("\(count-1)번 이겨서 게임이 종료되었습니다.")
                
                Button {
                    gameState = .end
                    resetStr()
                    count = 0
                } label: {
                    VStack{
                        Image("anyeong")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                        Text("종료하기")
                            .bold()
                            .padding()
                    }.padding()
                }

            }
        case .end:
            VStack{
                Button {
                    gameState = .start
                } label: {
                    Image("start")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    Text("새 게임하기")
                        .bold()
                        .padding()
                }

            }
        }
    }
    
    func findResult() {
        
        guard myChoice != computerChoice else {
            resultText = "무승부"
            return
        }
        
        if ((myChoice == 0 && computerChoice == 2) ||
            (myChoice == 1 && computerChoice == 0) ||
            (myChoice == 2 && computerChoice == 1) ){
            resultText = "승리"
            count += 1
        } else {
            resultText = "패배"
        }
    }
    func resetStr() {
        computerChoice = Int.random(in: 0...2)
        myChoice = 0
        resultText = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
