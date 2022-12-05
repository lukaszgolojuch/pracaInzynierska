//
//  DescriptionSelectionView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/15/22.
//

import SwiftUI

struct DescriptionSelectionView: View {
    
    @Binding var rating: Rating

    var body: some View {
        Section(header: Text("Description").foregroundColor(.white)) {
            TextEditor(text: $rating.description)
        }
    }
}
