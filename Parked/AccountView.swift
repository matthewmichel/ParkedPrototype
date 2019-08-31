//
//  AccountView.swift
//  Parked
//
//  Created by Matthew Michel on 8/31/19.
//  Copyright © 2019 Matthew Michel. All rights reserved.
//

import SwiftUI

struct AccountView: View {
    
    var user = testUser
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                Text("Account")
                    .font(.title)
                user.accountImage
                Text(user.firstName + " " + user.lastName)
                    .font(.subheadline)
                Text(user.guid)
                    .font(.caption)
            }.padding()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

class TestAccount {
    let firstName: String = "Matt"
    let lastName: String = "Michel"
    let accountImage: Image = Image(uiImage: UIImage(systemName: "person.crop.circle.fill", withConfiguration: UIImage.SymbolConfiguration(textStyle: .title1))!)
    let guid = UUID().uuidString
}

let testUser = TestAccount()
