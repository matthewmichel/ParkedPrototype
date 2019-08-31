//
//  SingleViewHome.swift
//  Parked
//
//  Created by Matthew Michel on 8/29/19.
//  Copyright © 2019 Matthew Michel. All rights reserved.
//

import SwiftUI

struct SingleViewHome: View {
    
    var testList = [testTruckList.truck1, testTruckList.truck2, testTruckList.truck3, testTruckList.truck4, testTruckList.truck5, testTruckList.truck6]
    var favoritesList = [testTruckList.truck4, testTruckList.truck1, testTruckList.truck5]
    
    @State var showingProfile: Bool = false
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var body: some View {
        
        return NavigationView {
            VStack {
//                HStack(alignment: .bottom) {
//                    Image("parkedLogo_Unofficial")
//                    .resizable()
//                    .frame(width: 215.5, height: 75.75, alignment: .center)
//
//                    Spacer()
//
//                    profileButton
//                }.padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading) {
                        
                        Text("Around You")
                            .font(.title)
                        
                        // AROUND YOU MAP
                        MapView(truckCoordinate: testTruckList.truck1.locationCoordinate, scrollEnabled: true, testMapAnnotations: testList, latDelta: 0.003, longDelta: 0.003)
                            .frame(height: 300)
                        
                        // POPULAR TRUCKS
                        Text("Popular")
                            .font(.title)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(self.testList) { truck in
                                    NavigationLink(destination: TruckDetailView(truckObject: truck)) {
                                            //HorizontalScrollViewTruck(truckObject: truck)
                                        truckHorizontal(truck: truck)
                                    }
                                }
                            }
                        }
                        
                        // FAVORITE TRUCKS
                        Text("Favorites")
                            .font(.title)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(self.favoritesList) { truck in
                                    NavigationLink(destination: TruckDetailView(truckObject: truck)) {
//                                            VStack(alignment: .leading) {
//                                                truck.truckImage
//                                                .resizable()
//                                                .frame(width: 155, height: 155)
//                                                self.cornerRadius(15)
//                                                Text(truck.truckName)
//                                                    .font(.caption)
//                                            }.padding(.leading, 15)
                                        truckHorizontal(truck: truck)
                                        
                                        
                                    }
                                    
                                }
                            }
                        }
                    }.padding()
                }
            }
            .navigationBarTitle("Parked")
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                AccountView()
            }
        }
        
        
        
    }
}

#if DEBUG
struct SingleViewHome_Previews: PreviewProvider {
    static var previews: some View {
        SingleViewHome()
    }
}
#endif
