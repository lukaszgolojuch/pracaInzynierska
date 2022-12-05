//
//  GeneralSectionView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/15/22.
//

import SwiftUI

struct GeneralSectionView: View {
    
    @State var car: String = "Car model"
    @Binding var rating: Rating
    
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
                rating.car = car
                rating.make = (CarEnum(rawValue: car)?.info.carMake)!
                rating.model = (CarEnum(rawValue: car)?.info.carModel)!
                }

            HStack{
                Text("Make: ")
                TextField("Make", text: $rating.make)
            }
            
            HStack{
                Text("Model: ")
                TextField("Model", text: $rating.model)
            }
            
            HStack{
                Text("Production year: ")
                TextField("Production year", value: $rating.productionYear, formatter: NumberFormatter())
                    .keyboardType(.decimalPad)
            }
            
            HStack{
                Text("Actual millage: ")
                TextField("Millage", value: $rating.millage, formatter: NumberFormatter())
                    .keyboardType(.decimalPad)
            }
            
            Picker(selection: $rating.transmission, label: Text("Transmission: ")) {
                ForEach(TransmissionType.allCases, id: \.id) { item in
                        Text(item.rawValue)
                }
            }
        }
    }
}
