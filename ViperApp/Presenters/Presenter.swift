//
//  Presetnter.swift
//  TestApp
//
//  Created by Mehmet Ali Erbaş on 11/12/24.
//

import UIKit
import Foundation

enum FetchError: Error {
    case failed
}

protocol Presenter {
    var router: ViewRouter? { get set }
    var interactor: Interactor? { get set }
    var view: View? { get set}
    
    func interactorDidFetchUsers(with result: Result<[User], Error>)
}
