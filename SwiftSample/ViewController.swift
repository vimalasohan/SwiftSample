//
//  ViewController.swift
//  SwiftSample
//
//  Created by BankOfAmerica on 9/28/17.
//  Copyright © 2017 Vimal. All rights reserved.
//

import UIKit
import UIComponents

class ViewController: UITableViewController {

    @IBOutlet var tableViewSample: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle(identifier: "com.UIComponents")
        tableViewSample.register(UINib(nibName:"ReusableCell", bundle:bundle), forCellReuseIdentifier: "ReusableCell")
        tableViewSample.estimatedRowHeight = 44.0
        tableViewSample.rowHeight = UITableViewAutomaticDimension
        //self.tableViewSample.register(ReusableCell.self, forCellReuseIdentifier: "ReusableCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.tableViewSample.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! ReusableCell
        cell.cellTitleLabel.text = "VimalVimalVimalVimalVimalVimalVimalVimalVimalVimalVimalVimalVimalVimalVimalVimalVimalVimalVimalVimalVimalVimalVimalVimalVimalVimalVimal"
        cell.cellImageView.image = UIImage(named: "Garden")
        return cell
    }

}

