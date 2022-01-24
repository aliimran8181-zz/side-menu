//
//  ViewController.swift
//  Side-Menu
//
//  Created by Ali on 07/01/2022.
//

import UIKit
import SideMenu
class ViewController: UIViewController {
    var menu: SideMenuNavigationController?
    override func viewDidLoad() {
        menu = SideMenuNavigationController(rootViewController: menulistController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: true)
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        super.viewDidLoad()
  
    }
    @IBAction func menuBtn(){
    present(menu!, animated: true)
    }

}
class menulistController: UITableViewController{
    var list = ["Home", "Profile", "Links", "User Accounts", "Settings", "About Us"  ]
    var darkcolor = UIColor(displayP3Red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = darkcolor
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = darkcolor
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

