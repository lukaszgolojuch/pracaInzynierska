//
//  Rating.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import Foundation

struct Rating: Identifiable, Codable {
    var id: String
    var car: String
    var make: String
    var model: String
    var stars: Int
    var description: String
    var fuelConsumptionCity: Float
    var fuelConsumptionHighway: Float
    var fuelConsumtionCombined: Float
    var productionYear: Int
    var millage: Int
    var transmission: String
    var fuelType: String
}
