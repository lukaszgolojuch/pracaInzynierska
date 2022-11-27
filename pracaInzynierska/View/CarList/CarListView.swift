//
//  CarListView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import SwiftUI
import SwiftUITrackableScrollView

struct CarListView: View {
    
    @ObservedObject var carListVM = CarListViewModel()
    @State private var scrollViewContentOffset = CGFloat(0)
    @State private var screenNumber = 0.0
    @State private var actualCar: Car = car
    static let screenWidth = UIScreen.main.bounds.size.width
    
    init() {
        carListVM.fetchCarData()
    }
    
    var body: some View {
        VStack{
            TrackableScrollView(.horizontal, showIndicators: false, contentOffset: $scrollViewContentOffset) {
                HStack(spacing: 20) {
                    ForEach(carListVM.cars, id: \.id) { carObject in
                        HeaderStackView(carObject: carObject)
                            .padding()
                            .id(carObject)
                        }
                }
                .onChange(of: scrollViewContentOffset, perform: { value in
                    var z = scrollViewContentOffset/CarListView.screenWidth
                    z.round(.down)
                    screenNumber = z
                    print(actualCar.make)
                })
                .onChange(of: screenNumber) { newValue in
                    print("Screen has changed")
                    
                    if carListVM.cars.indices.contains(Int(screenNumber)) {
                        actualCar = carListVM.cars[Int(screenNumber)]
                    }
                    
                    print(actualCar.make)
                }
            }.onAppear {
                UIScrollView.appearance().isPagingEnabled = true
            }
            .onDisappear {
                actualCar = car
            }
            List {
                Section("Car Data") {
                    Text(actualCar.make)
                }
            }
            Spacer()
        }
    }
}

struct CarListView_Previews: PreviewProvider {
    static var previews: some View {
        CarListView()
    }
}
