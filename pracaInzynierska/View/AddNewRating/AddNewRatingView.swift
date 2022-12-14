//
//  AddNewRatingView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/7/22.
//

import SwiftUI

struct AddNewRatingView: View {
    
    @ObservedObject var addNewRatingVM = AddNewRatingViewModel()
    @State var generatedRating: Rating = defaultRating
    let colors = AppColors()

    var body: some View {
        
        VStack(alignment: .leading){
            Spacer()
            HStack{
                VStack(alignment: .center){
                    Text("Add New Rating")
                        .bold()
                }
            }.padding(20)
                .frame(width: UIScreen.main.bounds.width, height: getStackTwoHeight(), alignment: .center)
                        
            VStack{
                Form {
                    GeneralSectionView(rating: $generatedRating)
                    StarsRatingSectionView(rating: $generatedRating)
                    CategorySelectionView(rating: $generatedRating)
                    DescriptionSelectionView(rating: $generatedRating)
                    FuelConsumptionSelectionView(rating: $generatedRating)
                        
                    Section {
                        Button(action: {
                            addNewRatingVM.newRating = generatedRating
                            addNewRatingVM.saveDataToFirestore()
                        }) {
                            Text("Publish now")
                                .foregroundColor(Color.blue)
                        }
                    }
                }.padding(.bottom, 60)
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

struct AddNewRatingView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewRatingView()
    }
}
