//
//  ContentView.swift
//  homework3
//
//  Created by User14 on 2020/10/28.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var birthday = Date()
    @State private var age = 20
    var weather=["winter","spring","summer","fall"]
    @State private var slectWeather = 0
    @State private var red: Double = 0
    @State private var blue: Double = 0
    @State private var green: Double = 0
    @State private var showNextPage = false
    var body: some View {
        VStack{
            Image("b")
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 300, alignment: .center)
                .clipped()
                //.position(x: 200, y: 200)
            Form{
                HStack{
                    Text("Name:")
                    TextField("input your name",text: $name)
                }
                DatePicker("birthday:", selection: $birthday, in: ...Date(), displayedComponents: .date)
                HStack{
                    Text("age:")
                    Stepper(value: $age, in: 10...100){
                        Text("\(age)")
                    }
                }
                HStack{
                    Text("travelTime:")
                    Picker(selection: $slectWeather, label: Text("weater")){
                        Text(weather[0]).tag(0)
                        Text(weather[1]).tag(1)
                        Text(weather[2]).tag(2)
                        Text(weather[3]).tag(3)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                chooseColor(red: $red,green: $green,blue: $blue)
                
                Button("~Color~"){
                    showNextPage = true
                }
                .background(Color( red: red, green: green, blue: blue))
                .frame(width: 300, height: 50)
                .sheet(isPresented:$showNextPage){
                    nextPageView(showNextPage: self.$showNextPage,slectWeather: self.$slectWeather)
                }
            }
        }
    }
}

struct nextPageView: View {
    @Binding var showNextPage: Bool
    @Binding var slectWeather: Int
    @State private var showAlert = false
    var body: some View{
        if slectWeather == 0 {
            VStack{
                Image("w")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 360, height: 300, alignment: .center)
                    .clipped()
                Text("北投地熱谷位在北投溫泉公園旁邊，是北投溫泉的源頭之一，因為終年瀰漫著硫磺煙霧，讓人聯想到恐怖的地獄，所以又被稱為「地獄谷」或「鬼湖」。這裡的溫泉是大屯山火山群內水溫最高的溫泉，硫磺煙霧濔漫的景色，如夢似幻，有如仙境一般，是日據時代臺灣八景十二勝之一。溫泉池四周設有欄杆、賞景涼亭和親水溝渠。")
                }
            .padding()
            .background(Color(red: 0.9, green: 0.8, blue: 0.8))
            .cornerRadius(20)
        }
        else if slectWeather == 1 {
            VStack{
                Image("sp")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 360, height: 300, alignment: .center)
                    .clipped()
                Text("武陵農場是台灣人一生必去朝聖一次的賞櫻勝地。腹地寬敞的武陵農場內有不少必遊的賞櫻景點，櫻花盛開時武陵農場更像沈浸在粉紅色的花海世界中，喜歡拍照的遊客可安排個武陵農場一日遊，拍攝春天限定的浪漫網美照，感受春天粉嫩的氣息。")
                }
            .padding()
            .background(Color(red: 0.8, green: 0.8, blue: 0.9))
            .cornerRadius(20)
        }else if slectWeather == 2 {
            VStack{
                Image("s")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 360, height: 300, alignment: .center)
                    .clipped()
                Text("陽明山竹子湖的繡球花，將終日雲霧繚繞的陽明山裝點地美不勝收，大面積的繡球花海彷彿秘境般的夢幻，每年總會吸引大批民眾及渴望拍出漂亮又吸睛的IG打卡照的網美們為陽明山再創新一波的賞花熱潮！")
                }
            .padding()
            .background(Color(red: 0.9, green: 0.8, blue: 0.9))
            .cornerRadius(20)
        }else{
            VStack{
                Image("f")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 360, height: 300, alignment: .center)
                    .clipped()
                Text("銀白色的芒草隨風搖曳，搭配天邊的白雲，風景如畫，富有濃濃的滄桑感，這藏在都會的芒草秘境，秋天要的美照都在這裡！\n被滿山的芒草包圍，秋意的氛圍湧上心頭，芒草隨著微風吹拂，眼前的畫面相當詩情畫意，這裡人煙稀少，怎麼拍都像一幅畫，是IG秋日熱門美拍。")
                }
            .padding()
            .background(Color(red: 0.8, green: 0.9, blue: 0.9))
            .cornerRadius(20)
        }
        
        Button(action:{
            showAlert = true
        }){
            Text("喜歡嗎？")
        }.alert(isPresented: $showAlert){
            () -> Alert in
            let ans = ["喜歡","超喜歡"].randomElement()!
                    return Alert(title: Text(ans))
        }
    }
                    
}
             
struct nextPageView_Previews: PreviewProvider{
    static var previews: some View{
        nextPageView(showNextPage: .constant(true),slectWeather: .constant(0))
    }
}

struct chooseColor: View{
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    
    var body: some View{
        VStack{
            HStack{
                Text("red")
                    .foregroundColor(.red)
                Slider(value: $red, in: 0...1)
                    .accentColor(.red)
            }
            HStack{
                Text("green")
                    .foregroundColor(.green)
                Slider(value: $green, in: 0...1)
                    .accentColor(.green)
            }
            HStack{
                Text("blue")
                    .foregroundColor(.blue)
                Slider(value: $blue, in: 0...1)
                    .accentColor(.blue)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
