//
//  changeMoneyButton.swift
//  calculatorWithSU
//
//  Created by Ham Seonwoo on 2023/06/29.
//

import SwiftUI

enum Tonghwa: String {
    case usd = "$"
    case jpn = "円"
    case twd = "NT$"
    case sgd = "S$"
    
}

enum Hwanyeol: Double {
    case usdd = 0.00076021909627
    case jpnn = 0.109649122807018
    case twdd = 0.023590413799
    case sgdd = 0.001027601372875
}

struct changeMoneyButton: View {
    
    @State var category: String = ""
    @State var money: Double = 0.0
    //화면에 보여주는 화폐 심볼 변경
    @State var changingSymbol: String = ""
    @State var changedMoney: Double = 0.0
    @State var hwanyeoll: Double = 0.0
    
    //텍스트필드를 통해 받아올 값의 타입을 number로 !
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    
    var changeddMoney =  {(input: Double,symbol :String) -> Double in
        var result: Double = 0.0
        
        switch symbol {
        case "usd":
            result = input * (Hwanyeol.usdd.rawValue)
            return result
        case "jpn":
            result = input * (Hwanyeol.jpnn.rawValue)
            return result
        case "twd":
            result = input * (Hwanyeol.twdd.rawValue)
            return result
        case "sgd":
            result = input * (Hwanyeol.sgdd.rawValue)
            return result
        default:
            break
        }
        
        return result
    }
    
    
    var body: some View {
        
        VStack{
            Spacer()
            // 원화 입력
            
            HStack{
                TextField("환전할 금액 입력", value: $money, formatter: formatter)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(13)
                Text("₩")
                    .padding()
                    .font(.title)
                    .bold()
            }.padding()
            
            
            // 계산된 값 출력
            HStack{
                Text("\(String(format: "%.3f", changedMoney))")
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(13)
                // 여기에 통화가 변경될 것 -> 변수 필요함
                Text("\(changingSymbol)")
                    .padding()
                    .font(.title)
                    .bold()
            }.padding()
            
            Spacer()
            //통화 선택 버튼
            VStack{
                HStack{
                    Button {
                        category += "usd"
                        changingSymbol = Tonghwa.usd.rawValue
                        changedMoney = changeddMoney(money, category)
                        hwanyeoll = 1 / Hwanyeol.usdd.rawValue
                    } label: {
                        ButtonView(buttonString: "  $   USD  ", backgroundColor: Color.gray)
                    }.cornerRadius(13)
                    Button {
                        category += "jpn"
                        changingSymbol = Tonghwa.jpn.rawValue
                        changedMoney = changeddMoney(money, category)
                        hwanyeoll = 1 / Hwanyeol.jpnn.rawValue
                    } label: {
                        ButtonView(buttonString: "  円   JPN  ", backgroundColor: Color.gray)
                    }.cornerRadius(13)
                }
                //통화 선택 버튼
                HStack{
                    Button {
                        category += "twd"
                        changingSymbol = Tonghwa.twd.rawValue
                        changedMoney = changeddMoney(money, category)
                        hwanyeoll = 1 / Hwanyeol.twdd.rawValue
                    } label: {
                        ButtonView(buttonString: "NT$ TWD ", backgroundColor: Color.gray)
                    }.cornerRadius(13)
                    Button {
                        category += "sgd"
                        changingSymbol = Tonghwa.sgd.rawValue
                        changedMoney = changeddMoney(money, category)
                        hwanyeoll = 1 / Hwanyeol.sgdd.rawValue
                    } label: {
                        ButtonView(buttonString: "  S$  SGD  ", backgroundColor: Color.gray)
                    }
                }.cornerRadius(13)
            }
            
            Button {
                money = 0.0
                changedMoney = 0.0
                category = ""
                changingSymbol = ""
            } label: {
                ButtonView(buttonString: "Reset", backgroundColor: Color.gray)
            }
            .cornerRadius(13)
            .bold()
            .padding()
            
            Text("1 \(changingSymbol) 당 \(String(format: "%.3f", hwanyeoll))원 ").font(.title3)
            
            Spacer()
            
        }.padding()
    }
}

    


struct changeMoneyButton_Previews: PreviewProvider {
    static var previews: some View {
        changeMoneyButton()
    }
}
