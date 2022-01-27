//
//  ContentView.swift
//  MVVMpatternPractice
//
//  Created by 이원빈 on 2022/01/27.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = PersonViewModel()
    
    var body: some View {
        VStack{
            Text("\(viewModel.person.name)'s Age is \(viewModel.person.age)")
            HStack {
                Button(action: {viewModel.preAge()}) {
                    Text("Previous year")
                }
                Text("/")
                Button(action: {viewModel.addAge()}) {
                    Text("Add an year")
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
