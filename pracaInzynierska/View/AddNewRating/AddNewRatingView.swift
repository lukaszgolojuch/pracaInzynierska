//
//  AddNewRatingView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/7/22.
//

import SwiftUI

struct AddNewRatingView: View {
    
    @ObservedObject var addNewRatingVM = AddNewRatingViewModel()

    init() {
        addNewRatingVM.saveDataToFirestore()
    }
    
    var body: some View {
        Text("jfodis")
    }
}

struct AddNewRatingView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewRatingView()
    }
}
