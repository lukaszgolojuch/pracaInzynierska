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
                    .foregroundColor(.white)
                Text(rating.model)
                    .font(.custom(
                            "Helvetica Neue",
                            fixedSize: 20))
            }
            
            startView.numberOfStarsView(numberOfStars: rating.stars).tint(.yellow)
        }
    }
    
    func printuj() {
        print("DEBUG START")
        print(self.rating.make)
        print(self.rating.model)
        print("DEBUG END")
    }
}
