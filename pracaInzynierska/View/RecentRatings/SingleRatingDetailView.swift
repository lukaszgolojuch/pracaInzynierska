//
//  SingleRatingDetailView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import SwiftUI

struct SingleRatingDetailView: View {
    let startView = StarViews()
    let rating: Rating
    let colors = AppColors()
    
    var body: some View {
        
        VStack(alignment: .leading){
            Spacer()
            HStack{
                VStack(alignment: .center){
                    HeaderRatingView(rating: rating)
                }
            }.padding(20)
                .frame(width: UIScreen.main.bounds.width, height: getStackTwoHeight(), alignment: .center)
                        
            VStack{
                DataListView(rating: rating)
            }
            .frame(width: UIScreen.main.bounds.width, height: getStackOneHeight(), alignment: .top)
            .background(colors.darkGrey)
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            .ignoresSafeArea(edges: .bottom)
        }
    }
    
    func getStackOneHeight() -> CGFloat {
        return (UIScreen.main.bounds.height * 0.80)
    }
    
    func getStackTwoHeight() -> CGFloat {
        return (UIScreen.main.bounds.height * 0.20)
    }
}
