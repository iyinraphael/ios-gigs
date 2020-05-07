//
//  GigsTableViewController.swift
//  ios-gigs
//
//  Created by Iyin Raphael on 5/6/20.
//  Copyright © 2020 Iyin Raphael. All rights reserved.
//

import UIKit

class GigsTableViewController: UIViewController {

    //MARK: - Properties
    var tableView: UITableView!
    let gigController = GigController()
    var gigs = [Gig]()
    let reuseId = "cell"
   
    
    override func loadView() {
        super.loadView()
        
        navigationItem.title = "Gigs"
        navigationItem.rightBarButtonItem =  .init(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        
        tableView = UITableView()
        tableView.delegate = self
        let _ = UITableViewCell(style: .subtitle, reuseIdentifier: reuseId)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let bearer = gigController.bearer, !bearer.token.isEmpty {
            gigController.getAllGigs { result in
                if let result = try? result.get() {
                    self.gigs = result
                }
            }
        }
        
        let loginViewController = LoginViewController()
        self.present(loginViewController, animated: true) {
            loginViewController.gigController = self.gigController
        }
    }
    
    @objc func addItem() {
        
    }

}

extension GigsTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gigs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath)
        let gig = gigs[indexPath.row]
        
        let df  = DateFormatter()
        df.dateStyle = .short
        
        cell.textLabel?.text = gig.title
        cell.detailTextLabel?.text = "Due \(df.string(from: gig.dueDate))"
        
        return cell
    }
    
    
    
}
