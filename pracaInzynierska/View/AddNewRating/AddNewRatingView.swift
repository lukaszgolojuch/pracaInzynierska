//
//  AddNewRatingView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/7/22.
//

import SwiftUI

struct AddNewRatingView: View {
    
    @ObservedObject var addNewRatingVM = AddNewRatingViewModel()

    var body: some View {
        Form {
            GeneralSectionView()
            StarsRatingSectionView()
            CategorySelectionView()
            DescriptionSelectionView()
            FuelConsumptionSelectionView()
                
            Section {
                Button(action: {
                    addNewRatingVM.saveDataToFirestore()
                }) {
                    Text("Publish now")
                        .foregroundColor(Color.blue)
                }
            }.padding(.bottom, 30)
        }
    }
}

struct AddNewRatingView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewRatingView()
    }
}
