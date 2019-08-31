//
//  ContentView.swift
//  Parked
//
//  Created by Matthew Michel on 8/9/19.
//  Copyright © 2019 Matthew Michel. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State var yetToLogin: Bool = true
    
    var body: some View {
        TabView {
            //
            // FIRST TAB *********************************************
            //
            TabOne().tabItem {
                VStack{
                    Image("first")
                    Text("Home")
                }
            }
            //
            // END FIRST TAB *****************************************
            //
            
            //
            // SECOND TAB ********************************************
            //
            TabTwo().tabItem {
                Image("second")
            }
            //
            // END SECOND TAB*****************************************
            //
            
            //
            // THIRD TAB *********************************************
            //
            TabThree().tabItem {
                Image("first")
            }
            //
            // END OF THIRD TAB **************************************
            //
        }.sheet(isPresented: $yetToLogin) {
            LoginScreen()
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

// TAB ONE
struct TabOne: View {
    var body: some View {
        VStack {
            Text("Welcome to Parked")
                .fontWeight(.semibold)
            Text("The Food Trucks Around You")
                .fontWeight(.thin)
        }
    }
    
}

// TAB TWO
struct TabTwo: View {
    var body: some View {
        VStack {
            Text("Around you map here.")
        }
    }
}

// TAB THREE
struct TabThree: View {
    
    var body: some View {
        testTruckList.AddToList(truck: testTruckList.truck1)
        testTruckList.AddToList(truck: testTruckList.truck2)
        testTruckList.AddToList(truck: testTruckList.truck3)
        //currentTruckItemList = getTruckListFromDynamo()
        
        return NavigationView {
            VStack {
                List(testTruckList.truckItemList) { truckO in
                    NavigationLink(destination: TruckDetailView(truckObject: truckO)) {
                            TruckListRow(truckItem: truckO)
                    }
                }
            }.navigationBarTitle("Around You")
        }
        
    }
}
