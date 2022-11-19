//
//  RecentRatingsViewModel.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/12/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class RecentRatingsViewModel: ObservableObject {
    
    @Published var ratings = [Rating]()
    
    private let db = Firestore.firestore()
    
    func fetchRatingData() {
        //Read the documents at a specific path
        db.collection("Ratings").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.ratings = snapshot.documents.map { d in
                            return Rating(id: d.documentID,
                                          car: d["car"] as? String ?? "",
                                          make: d["make"] as? String ?? "",
                                          model: d["model"] as? String ?? "",
                                          stars: d["stars"] as? Int ?? 0,
                                          type: d["type"] as? String ?? "",
                                          description: d["description"] as? String ?? "",
                                          fuelConsumptionCity: d["fuelConsumptionCity"] as? Float ?? 0.0,
                                          fuelConsumptionHighway: d["fuelConsumptionHighway"] as? Float ?? 0.0,
                                          fuelConsumtionCombined: d["fuelConsumtionCombined"] as? Float ?? 0.0,
                                          productionYear: d["productionYear"] as? Int ?? 2022,
                                          millage: d["millage"] as? Int ?? 0,
                                          transmission: d["transmission"] as? String ?? "",
                                          fuelType: d["fuelType"] as? String ?? ""
                            )
                        }
                    }
                }
            } else {
                print("[ERROR] Error Occured while fetching Recent Ratings Data from Firestore")
            }
        }
    }
}
