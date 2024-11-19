//
//  View.swift
//  TestApp
//
//  Created by Mehmet Ali Erbaş on 11/12/24.
//

import UIKit
import Foundation

protocol View {
    var presenter: Presenter? { get set }
    
    func update(with users: [User])
    func update(with error: String)
}
