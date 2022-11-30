//
//  AddNewRatingViewModel.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/11/22.
//

import Foundation
import Firebase

class AddNewRatingViewModel: ObservableObject {
    
    @Published var newRating: Rating
    
    private var db = Firestore.firestore()
    
    init() {
        newRating = defaultRating
    }
    
    func addNewRecord(with ratingData: [String: Any]) {
        let _ = db.collection("Ratings").addDocument(data: ratingData)
    }
    
    func saveDataToFirestore() {
        let docData: [String: Any] = [
            "car": newRating.car,
            "stars": newRating.stars,
            "description": newRating.description,
            "fuelConsumptionCity": newRating.fuelConsumptionCity,
            "fuelConsumptionHighway": newRating.fuelConsumptionHighway,
            "fuelConsumtionCombined": newRating.fuelConsumptionHighway,
            "productionYear": newRating.productionYear,
            "millage": newRating.millage,
            "transmission": newRating.transmission,
            "fuelType": newRating.fuelType
        ]
        
        addNewRecord(with: docData)
    }
}
