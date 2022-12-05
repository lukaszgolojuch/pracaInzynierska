//
//  StarsRatingSectionView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/15/22.
//

import SwiftUI

struct StarsRatingSectionView: View {
    
    @Binding var rating: Rating

    var label = "Rating: "
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            Spacer()
            
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating.stars ? offColor : onColor)
                    .onTapGesture {
                        rating.stars = number
                    }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating.stars {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}
