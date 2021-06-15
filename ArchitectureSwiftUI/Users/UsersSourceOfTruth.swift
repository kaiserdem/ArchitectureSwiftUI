//
//  UsersSourceOfTruth.swift
//  ArchitectureSwiftUI
//
//  Created by Kaiserdem on 11.06.2021.
//

import SwiftUI

class UsersSourceOfTruth: ObservableObject {
    
    @Published public var users = [User]()
}
