//
//  UserPresenter.swift
//  TestApp
//
//  Created by Mehmet Ali Erbaş on 11/12/24.
//

import UIKit
import Foundation

class UserPresenter: Presenter {
    var router: ViewRouter?
    
    var interactor: Interactor? {didSet{interactor?.getUsers()}}
    
    var view: View?
    
    func interactorDidFetchUsers(with result: Result<[User], any Error>) {
        switch result {
        case .success(let success):
            view?.update(with: success)
        case .failure(let failure):
            view?.update(with: failure.localizedDescription)
        }
    }
}
