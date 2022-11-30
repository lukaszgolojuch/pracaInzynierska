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
            Text(rating.car)
                .font(.custom(
                    "Helvetica Neue",
                    fixedSize: 20))
            
            Spacer()
            
            startView.numberOfStarsView(numberOfStars: rating.stars).foregroundColor(.yellow)
        }
    }
}
