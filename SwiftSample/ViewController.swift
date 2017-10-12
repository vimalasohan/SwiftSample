//
//  ViewController.swift
//  SwiftSample
//
//  Created by BankOfAmerica on 9/28/17.
//  Copyright © 2017 Vimal. All rights reserved.
//

import UIKit
import UIComponents
import NetworkComponents

class ViewController:UIViewController {
    @IBOutlet var tableViewSample: UITableView!
    var tableRowCount = Int()
    var networkClass:NetworkConnection = NetworkConnection()
    var responseString:Array<Any> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle(identifier: "com.UIComponents")
        self.tableViewSample.register(UINib(nibName:"ReusableCell", bundle:bundle), forCellReuseIdentifier: "ReusableCell")
        self.tableViewSample.estimatedRowHeight = 44.0
        self.tableViewSample.rowHeight = UITableViewAutomaticDimension
        makeServiceCall()
    }
    func makeServiceCall()
    {
        networkClass.getJSONFromUrl(urlString:"http://services.groupkt.com/state/get/USA/all", completionHandler: {genres in
            self.responseString = genres
            self.tableRowCount = self.tableRowCount + genres.count
            DispatchQueue.main.async {
                self.tableViewSample.reloadData()
            }
        })
    }
}
extension ViewController: UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tableRowCount
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.tableViewSample.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! ReusableCell
        if self.responseString.count>0 {
            let location : LocationItem = self.responseString[indexPath.row] as! LocationItem
            cell.cellTitleLabel.text = location.name
        }
        cell.cellImageView.image = UIImage(named: "Garden")
        return cell
    }

}

