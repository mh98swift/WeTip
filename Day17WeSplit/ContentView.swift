//
//  ContentView.swift
//  Day17WeSplit
//
//  Created by VCM1 on 03/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    //comit
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    @State private var amount = 0.0
    @State private var numberOfPeople = 2
    
    let tipPercents = [10,12,15,20,25,0]
    @State private var tipPercent = 15
    
    var totalTipPerPerson: Double{
        let countOfPeople: Double = Double(numberOfPeople + 1)
        let tipAmount: Double = (amount * Double(tipPercent)) / 100
        let totalCheckWithTip = tipAmount + amount
        let amountPerPersonWithTip = totalCheckWithTip / countOfPeople
        
        return amountPerPersonWithTip
    }
    
    var body: some View {
        
        
        NavigationView{
            Form{
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .keyboardType(.decimalPad)
                    .foregroundColor(Color.gray)
                Section{
                    Picker("How Many People", selection: $numberOfPeople) {
                        ForEach(1..<9) {
                            Text("\($0)")
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("How many People")
                }
                
                Section{
                    Picker("Tip Amount", selection: $tipPercent) {
                        ForEach(tipPercents, id:\.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip would you like to leave")
                }
                
                Text(totalTipPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .foregroundColor(Color.gray)
                
               
            }.background(Color.mint)
                .foregroundColor(Color.white)
                .navigationTitle("WeTip").foregroundColor(.indigo)
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
