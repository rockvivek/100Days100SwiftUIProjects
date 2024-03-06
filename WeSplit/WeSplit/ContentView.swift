//
//  ContentView.swift
//  WeSplit
//
//  Created by Vivek Shrivastava on 07/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var amount: String = ""
    @State private var numberOfPeople: String = ""
    @State private var tipPercentage = 2 //contains index

    var tippercentages:[Int] = [0, 10, 15, 20, 25]
    
    var totalAmount: Double {
        //computed properity
        let tipSelection = Double(tippercentages[tipPercentage])
        let orderAmount = Double(amount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    var amountPerPerson: Double {
        //computed properity
        return totalAmount / (Double(numberOfPeople) ?? 1)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)
                    TextField("number of people", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                }
                Section(header: Text("How Much tip do you want to leave?")) {
                    //picker view
                    Picker("tips selection", selection: $tipPercentage) {
                        ForEach(0 ..< tippercentages.count) {
                            //it give the index
                            Text("\(tippercentages[$0])%")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section(header: Text("Total Amount")) {
                    Text("$\(totalAmount, specifier: "%.2f")")
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(amountPerPerson, specifier: "%.2f")")
                }
            }
            .navigationTitle("We Split")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
