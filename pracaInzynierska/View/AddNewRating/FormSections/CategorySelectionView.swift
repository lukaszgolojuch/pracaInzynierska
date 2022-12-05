//
//  CategorySelectionView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/15/22.
//

import SwiftUI

struct CategorySelectionView: View {
    
    @Binding var rating: Rating

    enum CarTypes: String, CaseIterable, Identifiable {
        case Sedan, Hatchback, Cabriolet, Van, Pickup, Coupe
        var id: String { return self.rawValue }
    }
    
    var body: some View {
        Section() {
            Picker(selection: $rating.type, label: Text("Car type: ")) {
                ForEach(CarTypes.allCases, id: \.id) { item in
                            Text(item.rawValue)
                }
            }
        }
    }
}
