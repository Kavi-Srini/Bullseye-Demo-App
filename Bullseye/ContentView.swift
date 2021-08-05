//
//  ContentView.swift
//  Bullseye
//
//  Created by Nachammai K Srinimukesh on 12/24/19.
//  Copyright © 2019 Nachammai K Srinimukesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 0.50
    @State var target: Int = Int.random(in: 1...100)
    
    var body: some View {
        VStack {
            //Target row
            Spacer()
            HStack {
                Text("Put the bullseye as close as you can to : \(self.target)")        }
            
            Spacer()
            //Slider row
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            
            Spacer()
            //Button row
            Button(action: {
                print("Button pressed!")
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                var roundedValue: Int = Int (self.sliderValue.rounded())
                return Alert(title: Text("Hello there!"), message: Text("The slider value is \(roundedValue)"), dismissButton: .default(Text("Awesome!")))
            }
            
            //Score row
            Spacer()
            HStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start Over")
                }
                Spacer()
                Text("Score:")
                Text("9999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: {}){
                    Text("Info")
                }
            }
            .padding(.bottom,20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
