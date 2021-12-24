//
//  ContentView.swift
//  test-project
//
//  Created by 이원빈 on 2021/12/20.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        //View Code
        return Text("Hello, world!").padding()
            
    }
    //Methods
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPod touch (7th generation)")
            .preferredColorScheme(.dark)
            ContentView()
                .previewDevice("iPod touch (7th generation)")
                .preferredColorScheme(.light)
        }
            
    }
}
