//
//  SingleRatingView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import SwiftUI

struct SingleRatingView: View {
    let startView = StarViews()
    let rating: Rating
    let colors = AppColors()
    
    var body: some View {
        
        VStack {
            VStack(alignment: .trailing, spacing: 7) {
                HeaderRatingView(rating: rating)
                
                HStack{
                    VStack(alignment: .leading, spacing: 10){
                        Section(header: Text("Description")) {
                            Text(rating.description)
                                .font(.custom("Helvetica Neue", fixedSize: 20))
                        }
                    }
                Spacer()
                }
                
                NavigationLink {
                    SingleRatingDetailView(rating: rating)
                } label: {
                    Text("Read more")
                }
                
            }.padding(20)
        }.background(colors.lightGrey)
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            .padding()
            .frame(height: 160)
            
    }
}

