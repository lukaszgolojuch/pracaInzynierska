//
//  HeaderRatingView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import SwiftUI

struct HeaderRatingView: View {
    let startView = StarViews()
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 5){
                
                Text("BMW")
                    .font(.custom(
                            "Helvetica Neue",
                            fixedSize: 25))
                Text("Series 5")
                    .font(.custom(
                            "Helvetica Neue",
                            fixedSize: 20))
                
            }
            
            Spacer()
            
            startView.numberOfStarsView(numberOfStars: 4).tint(.yellow)
            
        }
    }
}

struct HeaderRatingView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderRatingView()
    }
}
