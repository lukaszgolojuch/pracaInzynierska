//
//  SingleRatingDetailView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import SwiftUI

struct SingleRatingDetailView: View {
    let startView = StarViews()
    
    var body: some View {
        VStack{
                
            HeaderRatingView()
                
            Divider()
                
            DataListView()
                
        }.padding(20)
    }
}

struct SingleRatingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SingleRatingDetailView()
    }
}
