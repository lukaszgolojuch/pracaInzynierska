//
//  Car.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import UIKit

struct Car: Identifiable, Codable  {
    var id: String
    var make: String
    var model: String
    var type: String
    var description: String
    var fuelConsumptionCityMin: Float
    var fuelConsumptionCityMax: Float
    var fuelConsumptionHighwayMin: Float
    var fuelConsumptionHighwayMax: Float
    var fuelConsumtionCombinedMin: Float
    var fuelConsumtionCombinedMax: Float
    var productionYearFrom: Int
    var productionYearTo: Int
    var enginePowerFrom: Int
    var enginePowerTo: Int
    var priceFrom: Float
    var priceTo: Float
}
