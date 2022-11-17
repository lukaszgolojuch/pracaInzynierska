//
//  GeneralSectionView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/15/22.
//

import SwiftUI

struct GeneralSectionView: View {
    
    @ObservedObject var addNewRatingVM = AddNewRatingViewModel()
    
    enum TransmissionType: String, CaseIterable, Identifiable {
        case Manual, Automatic
        var id: String { return self.rawValue }
    }
    
    var body: some View {
        Section(header: Text("General")) {
            TextField("Make", text: $addNewRatingVM.newRating.make)
            TextField("Model", text: $addNewRatingVM.newRating.model)
            TextField("Production year", value: $addNewRatingVM.newRating.productionYear, formatter: NumberFormatter())
                .keyboardType(.decimalPad)
            TextField("Millage", value: $addNewRatingVM.newRating.millage, formatter: NumberFormatter())
                .keyboardType(.decimalPad)
            Picker(selection: $addNewRatingVM.newRating.transmission, label: Text("Transmission: ")) {
                ForEach(TransmissionType.allCases, id: \.id) { item in
                        Text(item.rawValue)
                }
            }
        }
    }
}

struct GeneralSectionView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSectionView()
    }
}
