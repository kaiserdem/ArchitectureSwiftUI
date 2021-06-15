//
//  AnimalSourceOfTruth.swift
//  ArchitectureSwiftUI
//
//  Created by Kaiserdem on 11.06.2021.
//

import SwiftUI

class AnimalSourceOfTruth: ObservableObject {
    
    @Published var animals = [Animal]()
}
