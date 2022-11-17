//
//  CategorySelectionView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/15/22.
//

import SwiftUI

struct CategorySelectionView: View {
    
    @ObservedObject var addNewRatingVM = AddNewRatingViewModel()

    enum CarTypes: String, CaseIterable, Identifiable {
        case Sedan, Hatchback, Cabriolet, Van, Pickup, Coupe
        var id: String { return self.rawValue }
    }
    
    var body: some View {
        Section() {
            Picker(selection: $addNewRatingVM.newRating.type, label: Text("Car type: ")) {
                ForEach(CarTypes.allCases, id: \.id) { item in
                            Text(item.rawValue)
                }
            }
        }
    }
}

struct CategorySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySelectionView()
    }
}
