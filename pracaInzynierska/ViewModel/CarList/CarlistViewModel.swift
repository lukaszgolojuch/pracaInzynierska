//
//  CarlistViewModel.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/19/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class CarListViewModel: ObservableObject {
    
    @Published var cars = [Car]()
    private let db = Firestore.firestore()
  
    func fetchCarData() {
        db.collection("Cars").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.cars = snapshot.documents.map { d in
                            print("[DEBUG] Car data has been fetched for " + d.documentID)
                            return Car(id: d.documentID,
                                          make: d["make"] as? String ?? "",
                                          model: d["model"] as? String ?? "",
                                          type: d["type"] as? String ?? "",
                                          description: d["description"] as? String ?? "",
                                          fuelConsumptionCityMin: d["fuelConsumptionCityMin"] as? Float ?? 0.0,
                                          fuelConsumptionCityMax: d["fuelConsumptionCityMax"] as? Float ?? 0.0,
                                          fuelConsumptionHighwayMin: d["fuelConsumptionHighwayMin"] as? Float ?? 0.0,
                                          fuelConsumptionHighwayMax: d["fuelConsumptionHighwayMax"] as? Float ?? 0.0,
                                          fuelConsumtionCombinedMin: d["fuelConsumtionCombinedMin"] as? Float ?? 0.0,
                                          fuelConsumtionCombinedMax: d["fuelConsumtionCombinedMax"] as? Float ?? 0.0,
                                          productionYearFrom: d["productionYearFrom"] as? Int ?? 2022,
                                          productionYearTo: d["productionYearTo"] as? Int ?? 2022,
                                          enginePowerFrom: d["enginePowerFrom"] as? Int ?? 0,
                                          enginePowerTo: d["enginePowerTo"] as? Int ?? 0,
                                       priceFrom: d["priceFrom"] as? Float ?? 0.0,
                                       priceTo: d["priceTo"] as? Float ?? 0.0
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
