//
//  Interactor.swift
//  TestApp
//
//  Created by Mehmet Ali Erbaş on 11/12/24.
//

import Foundation

protocol Interactor {
    var presenter: Presenter? { get set }
    
    func getUsers()
}
