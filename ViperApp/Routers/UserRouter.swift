//
//  UserRouter.swift
//  TestApp
//
//  Created by Mehmet Ali Erbaş on 11/12/24.
//

import Foundation

class UserRouter: ViewRouter {
    var viewEntry: (any ViewEntryPoint)?
    
    static func start(with name: ViewName) -> any ViewRouter {
        let router = UserRouter()
        var view: View!
        switch name {
        case .list: view = ListViewController()
        case .detail: break
        }
        
        var presenter: Presenter = UserPresenter()
        var interactor: Interactor = UserInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.viewEntry = (view as? ViewEntryPoint)
        print("view entry = ", router.viewEntry)
        return router
    }
}

enum ViewName: CaseIterable {
    case list
    case detail
}
