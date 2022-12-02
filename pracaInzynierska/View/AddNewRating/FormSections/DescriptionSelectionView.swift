//
//  DescriptionSelectionView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/15/22.
//

import SwiftUI

struct DescriptionSelectionView: View {
    
    @ObservedObject var addNewRatingVM = AddNewRatingViewModel()
    
    var body: some View {
        Section(header: Text("Description").foregroundColor(.white)) {
            TextEditor(text: $addNewRatingVM.newRating.description)
        }
    }
}

struct DescriptionSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionSelectionView()
    }
}
