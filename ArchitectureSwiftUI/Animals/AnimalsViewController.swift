//
//  AnimalsViewController.swift
//  ArchitectureSwiftUI
//
//  Created by Kaiserdem on 11.06.2021.
//

import SwiftUI
import Combine

class AnimalsViewController: UIHostingController<AnimalsContentView> {
    
    var selectedAnimalToken: Cancellable?
    
    let persistenceService: PersistenceService

    override init(rootView: AnimalsContentView) {
        self.persistenceService = PersistenceService()
        super.init(rootView: rootView)
        
        configureComunications()
    }

    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getAnimals()
    }

    func getAnimals() {
        rootView.sot.animals = persistenceService.getAnimals()
    }
    
    // наблюдение за всеми событиями что приходят
    func configureComunications() {
        selectedAnimalToken = rootView.selectedAnimalPublisher.sink { animal in
            self.presentAlert(with: "\(animal.name)")
        }
    }
}
