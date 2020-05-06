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
    
    override func loadView() {
        super.loadView()
        
        navigationItem.title = "Gigs"
        navigationItem.rightBarButtonItem =  .init(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func addItem() {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
