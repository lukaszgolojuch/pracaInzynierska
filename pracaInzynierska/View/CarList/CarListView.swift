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
    let colors = AppColors()
    static let screenWidth = UIScreen.main.bounds.size.width
    
    init() {
        carListVM.fetchCarData()
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
    
        VStack(alignment: .leading){
            
            
            TrackableScrollView(.horizontal, showIndicators: false, contentOffset: $scrollViewContentOffset) {
                    HStack(spacing: 8) {
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
                
                
                
                }.ignoresSafeArea(.all)
                        
                .frame(width: UIScreen.main.bounds.width, height: getStackTwoHeight(), alignment: .center)
                        
            VStack{
                List {
                    CarDetailsSectionView(car: actualCar)
                    FuelConsumtionSectionView(car: actualCar)
                }.listStyle(InsetGroupedListStyle())
            }
            .frame(width: UIScreen.main.bounds.width, height: getStackOneHeight(), alignment: .top)
            .background(colors.darkGrey)
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            .ignoresSafeArea(edges: .bottom)
        }
    }
    
    func getStackOneHeight() -> CGFloat {
        return (UIScreen.main.bounds.height * 0.70)
    }
    
    func getStackTwoHeight() -> CGFloat {
        return (UIScreen.main.bounds.height * 0.30)
    }
}


struct CarListView_Previews: PreviewProvider {
    static var previews: some View {
        CarListView()
    }
}
