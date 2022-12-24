//
//  AddressView.swift
//  CupCakeCornerApp
//
//  Created by Kiran Sonne on 24/11/22.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
   
    var body: some View {
        Form {
            Section {
                TextField("Name",text: $order.name)
                TextField(" Street Address", text: $order.streetAddress)
                TextField("City",text: $order.city)
                TextField("Zip",text: $order.zip)
            }
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Check Out")
                }
            }
            .disabled(order.hasValidAddress == false)
            
        }
        .navigationTitle("Delivery Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
