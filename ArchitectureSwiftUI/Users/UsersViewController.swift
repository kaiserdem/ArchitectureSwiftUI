//
//  UsersViewController.swift
//  ArchitectureSwiftUI
//
//  Created by Kaiserdem on 11.06.2021.
//

import Combine
import SwiftUI

class UsersViewController: UIHostingController<UsersContentView> {
    var selectedUserToken: Cancellable?

    let networkingService: NetworkingService
    
    override init(rootView: UsersContentView) {
        self.networkingService = NetworkingService()
        super.init(rootView: rootView)
        
        configureComunications()
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getUsers()
    }
    
    func getUsers() {
        networkingService.getUsers { [weak self] users in
            self?.rootView.sot.users = users
        }
    }
    
    func configureComunications() {
        selectedUserToken = rootView.selectedUserPublisher.sink { user in
            self.presentAlert(with: "\(user.name)")
        }
    }
}
