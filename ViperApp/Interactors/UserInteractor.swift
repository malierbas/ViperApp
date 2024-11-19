//
//  UserInteractor.swift
//  TestApp
//
//  Created by Mehmet Ali Erbaş on 11/12/24.
//

import UIKit
import Foundation

class UserInteractor: Interactor {
    var presenter: Presenter?
    
    func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                self.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
                return
            }
            
            print("data text: ", String(data: data, encoding: .utf8))
            
            do {
                let entities = try JSONDecoder().decode([User].self, from: data)
                self.presenter?.interactorDidFetchUsers(with: .success(entities))
            } catch {
                self.presenter?.interactorDidFetchUsers(with: .failure(error))
            }
        }
        
        task.resume()
    }
}
