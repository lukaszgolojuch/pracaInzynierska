//
//  VinCheckView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import SwiftUI

struct VinCheckView: View {
    @State private var newItemName: String = ""
    
    var body: some View {
        VStack{
            HStack{
                TextField("VIN number", text: $newItemName)
                    .font(.custom(
                            "Helvetica Neue",
                            fixedSize: 30))
            }
            .padding(.horizontal, 30).padding(.top, 30)
            
            Divider()
                .frame(height: 1)
                .padding(.horizontal, 30)
                .background(.blue)
            
            HStack{
                Spacer()
                Button("Decode") {
                    print("Button pressed!")
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
            
            Spacer()
        }.padding()
    }
}

struct VinCheckView_Previews: PreviewProvider {
    static var previews: some View {
        VinCheckView()
    }
}
