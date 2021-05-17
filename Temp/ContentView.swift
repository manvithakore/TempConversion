//
//  ContentView.swift
//  Temp
//
//  Created by Manvi Thakore on 2021-05-16.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    @State private var value = ""
    
    let inputUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    let outputUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var conversion: Double {
        let input = Double(value) ?? 0
        let inputU = inputUnits[inputUnit]
        let outputU = outputUnits[outputUnit]
        var final = input
        
        if inputU == outputU {
            return final
        }
        else if inputU == "Celsius" && outputU == "Fahrenheit" {
            final = ((input / 5) * 9) + 32
        }
        else if inputU == "Celsius" && outputU == "Kelvin" {
            final = input + 273.15
        }
        else if inputU == "Fahrenheit" && outputU == "Celsius" {
            final = ((input - 32) * 5) / 9
        }
        else if inputU == "Fahrenheit" && outputU == "Kelvin" {
            final = ((input - 32) * 5) / 9 + 273.15
        }
        else if inputU == "Kelvin" && outputU == "Celsius" {
            final = input - 273.15
        }
        else {
            final = (((input - 273.15) / 5) * 9) + 32
        }
        return final;
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input unit")) {
                    Picker("Temperature Input Unit", selection: $inputUnit) {
                        ForEach(0 ..< inputUnits.count) {
                            Text("\(self.inputUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section() {
                    TextField("Temperature", text: $value).keyboardType(.decimalPad)
                }
                
                Section(header: Text("Output unit")) {
                    Picker("Temperature Output Unit", selection: $outputUnit) {
                        ForEach(0 ..< outputUnits.count) {
                            Text("\(self.outputUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Conversion")) {
                    Text("\(conversion)")
                }
            }
            .navigationBarTitle("Temp Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
