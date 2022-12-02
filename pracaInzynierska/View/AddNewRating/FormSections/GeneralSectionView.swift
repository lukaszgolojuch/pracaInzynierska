//
//  GeneralSectionView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/15/22.
//

import SwiftUI

struct GeneralSectionView: View {
    
    @ObservedObject var addNewRatingVM = AddNewRatingViewModel()
    @State var car: String = "Car model"
    
    enum TransmissionType: String, CaseIterable, Identifiable {
        case Manual, Automatic
        var id: String { return self.rawValue }
    }
    
    enum CarEnum: String, CaseIterable {
        case BmwSeries52016 = "BMW Series 5 2016"
        case CupraFormentor2021 = "Cupra Formentor 2021"
        case Fiat5002007 = "Fiat 500 2007"
        case MercedesBenzGClass2018 = "Mercedes-Benz G Class 2018"
        case PorscheCayenne2019 = "Porsche Cayenne 2019"
        case JeepWrangler2017 = "Jeep Wrangler 2017"
        case Porsche9112019 = "Porsche 911 2019"

        var info: (carMake: String, carModel: String) {
            switch self {
            case .BmwSeries52016:
                return ("BMW", "Series 5")
            case .CupraFormentor2021:
                return ("Cupra", "Formentor")
            case .Fiat5002007:
                return ("Fiat", "500")
            case .MercedesBenzGClass2018:
                return ("Mercedes-Benz", "G Class")
            case .PorscheCayenne2019:
                return ("Porsche", "Cayenne")
            case .JeepWrangler2017:
                return ("Jeep", "Wrangler")
            case .Porsche9112019:
                return ("Porsche", "911")
            }
        }
        
        var id: String { return self.rawValue }
    }
    
    var body: some View {
        Section(header: Text("General").foregroundColor(.white)) {
            Picker(selection: $car, label: Text("Car model: ")) {
                ForEach(CarEnum.allCases, id: \.id) { item in
                    Text(item.rawValue)
                }
            }
            .onChange(of: car) { newValue in
                print("Name changed to \(car)!")
                addNewRatingVM.newRating.make = (CarEnum(rawValue: car)?.info.carMake)!
                addNewRatingVM.newRating.model = (CarEnum(rawValue: car)?.info.carModel)!
                }

            TextField("Make", text: $addNewRatingVM.newRating.make)
            TextField("Model", text: $addNewRatingVM.newRating.model)
            TextField("Production year", value: $addNewRatingVM.newRating.productionYear, formatter: NumberFormatter())
                .keyboardType(.decimalPad)
            TextField("Millage", value: $addNewRatingVM.newRating.millage, formatter: NumberFormatter())
                .keyboardType(.decimalPad)
            Picker(selection: $addNewRatingVM.newRating.transmission, label: Text("Transmission: ")) {
                ForEach(TransmissionType.allCases, id: \.id) { item in
                        Text(item.rawValue)
                }
            }
        }
    }
}

struct GeneralSectionView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSectionView()
    }
}
