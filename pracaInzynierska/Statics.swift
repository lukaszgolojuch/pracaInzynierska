//
//  Statics.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import UIKit

let car = Car(manufacturer: Manufacturer(name: "BMW", logo: "BMW-logo"), model: "Seria 5 (G30)", type: .Sedan, productionYears: ProductionYears(productionBegin: 2019, productionEnd: 2022), enginePower: EnginePower(minimumPower: 150, maximumPower: 625), priceNew: PriceNew(priceFrom: 150000, priceTo: 500000))

let rating = Rating(id: UUID(), car: car, stars: 4, description: "This is description for ratings")
