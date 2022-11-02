//
//  DataListView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import SwiftUI

struct DataListView: View {
    var body: some View {
        List {
            Section(header: Text("Description")) {
                Text("This is BMW series 5 description")
            }
            
            Section(header: Text("Fuel consuption")) {
                HStack {
                    Text("City:")
                        .bold()
                    Text("12l/100km")
                }
                HStack {
                    Text("Highway:")
                        .bold()
                    Text("12l/100km")
                }
                HStack {
                    Text("Combined:")
                        .bold()
                    Text("12l/100km")
                }
            }
            
            Section(header: Text("Car data")) {
                HStack {
                    Text("Production year:")
                        .bold()
                    Text("2019")
                }
                HStack {
                    Text("Millage:")
                        .bold()
                    Text("120000km")
                }
                HStack {
                    Text("Transmission:")
                        .bold()
                    Text("Automatic")
                }
                HStack {
                        Text("Fuel type:")
                            .bold()
                        Text("Diesel")
                }
            }
        }
    }
}

struct DataListView_Previews: PreviewProvider {
    static var previews: some View {
        DataListView()
    }
}
