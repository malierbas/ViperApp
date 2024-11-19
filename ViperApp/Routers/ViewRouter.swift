//
//  ViewRouter.swift
//  TestApp
//
//  Created by Mehmet Ali Erbaş on 11/12/24.
//

import UIKit
import Foundation

typealias ViewEntryPoint = View & UIViewController

protocol ViewRouter {
    var viewEntry: ViewEntryPoint? { get }
    
    static func start(with name: ViewName) -> ViewRouter
    
    
}
