//
//  ContentView.swift
//  CupCakeCornerApp
//
//  Created by Kiran Sonne on 24/11/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = Order()
    @State private var cakeAmount = 3
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type){
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                }
                
                Section {
                    VStack {
                        Stepper(" Number of Cake \(cakeAmount)", value: $cakeAmount)
                    }
                }
                
                
                Section {
                    Toggle("any special request?", isOn: $order.specialRequestEnabled.animation())
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting",isOn: $order.extraFrosting)
                        Toggle("Add extra sprinkles",isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery Details")
                    }
                }
                
                
                
            }
            .navigationTitle("CupCake Corner")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
