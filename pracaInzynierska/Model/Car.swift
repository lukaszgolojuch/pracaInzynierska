//
//  Car.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import UIKit

struct ProductionYears {
    var productionBegin: Int
    var productionEnd: Int
}

struct EnginePower {
    var minimumPower: Int
    var maximumPower: Int
}

struct PriceNew {
    var priceFrom: Int
    var priceTo: Int
}

struct Manufacturer {
    var name: String
    var logo: String
}

enum CarType {
    case Sedan
    case Hatchback
    case Cabriolet
    case Van
    case Pickup
    case Coupe
    case StationWagon
}

struct Car {
    var manufacturer: Manufacturer
    var model: String
    var type: CarType
    var productionYears: ProductionYears
    var enginePower: EnginePower
    var priceNew: PriceNew
}
