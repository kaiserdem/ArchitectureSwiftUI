//
//  AnimalsContentView.swift
//  ArchitectureSwiftUI
//
//  Created by Kaiserdem on 11.06.2021.
//

import SwiftUI
import Combine

struct AnimalsContentView: View {
    
    var selectedAnimalPublisher = PassthroughSubject<Animal,Never>()
    
    @ObservedObject var sot: AnimalSourceOfTruth

    var body: some View {
        List(sot.animals, id: \.id) { animal in
            Button(animal.name) {
                self.selectedAnimalPublisher.send(animal)
            }
        }
    }
}
/*
 struct UsersContentView: View {
     
     var selectedUserPublisher = PassthroughSubject<User,Never>()
     
     //ObservedObject для связки с вю моделю
     @ObservedObject var sot: UsersSourceOfTruth
     
     
     var body: some View {
         List(sot.users) { user in
             Button(user.name) {
                 self.selectedUserPublisher.send(user)
             }
         }
     }
 }

 */
