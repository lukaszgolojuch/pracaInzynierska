//
//  Statics.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import UIKit

let car = Car(manufacturer: Manufacturer(name: "BMW", logo: "BMW-logo"), model: "Seria 5 (G30)", type: .Sedan, productionYears: ProductionYears(productionBegin: 2019, productionEnd: 2022), enginePower: EnginePower(minimumPower: 150, maximumPower: 625), priceNew: PriceNew(priceFrom: 150000, priceTo: 500000))

let defaultRating = Rating(id: "", car: "", make: "", model: "", stars: 4, type: "", description: "", fuelConsumptionCity: 10.0, fuelConsumptionHighway: 12.0, fuelConsumtionCombined: 11.0, productionYear: 2013, millage: 100000, transmission: "", fuelType: "")
