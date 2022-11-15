//
//  HeaderRatingView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import SwiftUI

struct HeaderRatingView: View {
    let startView = StarViews()
    let rating: Rating
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 5){
                
                Text(rating.make)
                    .font(.custom(
                            "Helvetica Neue",
                            fixedSize: 25))
                Text(rating.model)
                    .font(.custom(
                            "Helvetica Neue",
                            fixedSize: 20))
                
            }
            
            Spacer()
            
            startView.numberOfStarsView(numberOfStars: 4).tint(.yellow)
            
        }
    }
}

//struct HeaderRatingView_Previews: PreviewProvider {
//    static var previews: some View {
//        HeaderRatingView()
//    }
//}
