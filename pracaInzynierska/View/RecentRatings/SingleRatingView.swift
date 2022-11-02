//
//  SingleRatingView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import SwiftUI

struct SingleRatingView: View {
    let startView = StarViews()
    
    var body: some View {
        VStack{
            
            HeaderRatingView()
            
            Divider()
            
            HStack{
                VStack(alignment: .leading, spacing: 10){
                    Section(header: Text("Description")) {
                        Text("This is BMW series 5 description")
                            .font(.custom(
                            "Helvetica Neue",
                            fixedSize: 20))
                    }
                }
                
                Spacer()
            }
            
            HStack{
                Spacer()
                
                NavigationLink {
                    SingleRatingDetailView()
                } label: {
                    Text("Read more")
                }
            }.padding()
        }.padding(20)
    }
}

struct SingleRatingView_Previews: PreviewProvider {
    static var previews: some View {
        SingleRatingView()
    }
}
