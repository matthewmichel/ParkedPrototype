//
//  TruckListRow.swift
//  Parked
//
//  Created by Matthew Michel on 8/9/19.
//  Copyright © 2019 Matthew Michel. All rights reserved.
//

import SwiftUI

struct TruckListRow : View {
    
    var truckItem: TruckItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(truckItem.truckName)
                    .font(.body)
                Text(truckItem.truckFoodType)
                    .font(.body)
                    .fontWeight(.thin)
                
            }
            Spacer()
            Text(truckItem.truckPricing)
                .font(.body)
                .foregroundColor(.gray)
            }.padding()
    }
}

#if DEBUG
struct TruckListRow_Previews : PreviewProvider {
    static var previews: some View {
        TruckListRow(truckItem: testTruckList.truck1)
    }
}
#endif
