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
        print("[DEBUG] 1")
        //Read the documents at a specific path
        db.collection("Ratings").getDocuments { snapshot, error in
            print("[DEBUG] 2")
            if error == nil {
                print("[DEBUG] 3")
                if let snapshot = snapshot {
                    print("[DEBUG] 4")
                    DispatchQueue.main.async {
                        print("[DEBUG] 5")
                        self.ratings = snapshot.documents.map { d in
                            print("[DEBUG] 6")
                            return Rating(id: d.documentID,
                                          car: d["car"] as? String ?? "",
                                          stars: d["stars"] as? Int ?? 0,
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
                print("[DEBUG] 7")
            }
        }
    }
}
