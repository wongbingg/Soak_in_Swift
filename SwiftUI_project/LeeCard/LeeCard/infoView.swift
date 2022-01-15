//
//  infoView.swift
//  LeeCard
//
//  Created by 이원빈 on 2022/01/13.
//

import SwiftUI

struct infoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50)
            .overlay(HStack {
                Image(systemName: imageName)
                    .foregroundColor(.green)
                Text(text)
                    .foregroundColor(Color("AccentColor"))
            })
            .padding(.all)
    }
}


struct infoView_Previews: PreviewProvider {
    static var previews: some View {
        infoView(text: "Hello", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
