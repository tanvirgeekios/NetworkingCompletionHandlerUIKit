//
//  ViewController.swift
//  NetworkingPracticeMedium
//
//  Created by MD Tanvir Alam on 24/2/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var arrayOfData = [ModifiedDataModel]()

    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        
        //populate the array
        GetData().getPosts { (posts) in
            if let posts = posts{
                self.arrayOfData = posts.map(ModifiedDataModel.init)
            }
            self.table.reloadData()
        }
    }

    //Mark:- TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrayOfData[indexPath.row].title
        return cell
    }
}

