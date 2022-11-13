//
//  Statics.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import UIKit

let car = Car(manufacturer: Manufacturer(name: "BMW", logo: "BMW-logo"), model: "Seria 5 (G30)", type: .Sedan, productionYears: ProductionYears(productionBegin: 2019, productionEnd: 2022), enginePower: EnginePower(minimumPower: 150, maximumPower: 625), priceNew: PriceNew(priceFrom: 150000, priceTo: 500000))

let rating = Rating(id: "324234", car: "BMW Series 5 f10", stars: 4, description: "This is description for ratings", fuelConsumptionCity: 10.0, fuelConsumptionHighway: 12.0, fuelConsumtionCombined: 11.0, productionYear: 2013, millage: 100000, transmission: "manual", fuelType: "diesel")

let defaultRating = Rating(id: "43242", car: "BMW Series 5 f10", stars: 4, description: "This is description for ratings", fuelConsumptionCity: 10.0, fuelConsumptionHighway: 12.0, fuelConsumtionCombined: 11.0, productionYear: 2013, millage: 100000, transmission: "manual", fuelType: "diesel")
