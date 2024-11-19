//
//  ListViewController.swift
//  ViperApp
//
//  Created by Mehmet Ali Erbaş on 11/12/24.
//

import UIKit
import SnapKit
import Foundation

class ListViewController: UIViewController, View {
    //MARK: Properties
    //view
    @IBOutlet weak var tableView: UITableView!
    
    //variable
    var presenter: Presenter?
    var users: [User] = []
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup
        setupView()
    }
    
    //MARK: Functions
    private func setupView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = .white
    }
    
    func update(with users: [User]) {
        DispatchQueue.main.async {
            self.users = users
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        print("an user fetch error: ", error)
    }
    
    //MARK: Actions
}

//MARK: TableView Extension
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let data = users[indexPath.row]
        cell.textLabel?.text = data.name
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let selectedUser = users[indexPath.row]
        print("selected user data: ", selectedUser)
    }
}
