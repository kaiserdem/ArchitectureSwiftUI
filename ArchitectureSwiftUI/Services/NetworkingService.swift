//
//  NetworkingService.swift
//  ArchitectureSwiftUI
//
//  Created by Kaiserdem on 11.06.2021.
//

import Foundation

struct User: Codable, Identifiable {
    let name: String
    let id: Int
}

//final class NetworkingService {
//
//    func getUsers(_ completion: @escaping([User]) -> Void) {
//
//        completion([User(name: "Danil", id: 1),
//                    User(name: "Oliviya", id: 2),
//                    User(name: "Alena", id: 3),
//                    User(name: "Yaroslav", id: 4),
//                    User(name: "Vitya", id: 5),
//                    User(name: "Misha", id: 6)])
//    }
//}


final class NetworkingService {

    func getUsers(completion: @escaping ([User]) -> Void) {
        let url = URL(string: "https://kl-universal-links-server.herokuapp.com/api/users")!
        URLSession.shared.dataTask(with: url) {
            if let error = $2 {
                print(error)
            } else if let data = $0 {
                do {
                    let users = try JSONDecoder().decode([User].self, from: data)
                    DispatchQueue.main.async {
                        completion(users)
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
