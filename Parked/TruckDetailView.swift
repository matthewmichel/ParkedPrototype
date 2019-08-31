//
//  TruckDetailView.swift
//  Parked
//
//  Created by Matthew Michel on 8/12/19.
//  Copyright © 2019 Matthew Michel. All rights reserved.
//

import SwiftUI

struct TruckDetailView: View {
    
    var truckObject: TruckItem
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                MapView(truckCoordinate: truckObject.locationCoordinate, scrollEnabled: false)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 300)
                    
                    

                CircleImage(truckObject: truckObject)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                    
                    

                VStack(alignment: .leading) {
                    Text(truckObject.truckName)
                        .font(.title)
                        

                    HStack() {
                        Text(truckObject.truckFoodType)
                            .font(.subheadline)
                            
                        Spacer()
                        Text(truckObject.truckPricing)
                            .font(.subheadline)
                            
                    }
                }
                .padding()

                Spacer()
            }
        }
    }
}

#if DEBUG
struct TruckDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TruckDetailView(truckObject: testTruckList.truckItemList[0])
    }
}
#endif
