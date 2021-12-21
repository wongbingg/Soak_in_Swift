//
//  ContentView.swift
//  ButtonDemo
//
//  Created by 이원빈 on 2021/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //
        VStack {
            Button("Click Me", action: {
                
                print("Hello World")
                
            })
            
            //Button instance with trailling closure
            Button("Click Me"){
                print("Hello World")
            }
            //Button instance with lavel view
            Button {
                print("Hello World")
            } label: {
                HStack {
                    Image(systemName: "pencil")
                    Text("Edit")
                }
            }

            
                
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
