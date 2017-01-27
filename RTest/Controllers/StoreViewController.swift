//
//  StoreViewController.swift
//  RTest
//
//  Created by Ishan Weerasooriya on 1/26/17.
//  Copyright © 2017 Ishan Weerasooriya. All rights reserved.
//

import UIKit

class StoreViewController: BaseViewController {
    
    // MARK: Outlets
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var lblEmail: UILabel!
    @IBOutlet var btnLogout: CustomButton!
    @IBOutlet var tableView: UITableView!
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // update view label values
        updateUI()
        
        // request store data
        requestStoreData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: IBAction
    @IBAction func pressedLogout(_ sender: Any) {
        // delete all user data
        User.logoutUser()
        
        // remove appUser from ApplicationManager
        ApplicationManager.shared.removeAppUser()
        
        // Clear StoreArray in Application manager
        ApplicationManager.shared.removeAllStores()
        
        // change root to loginview
        Constants.AppObjects.appDelegate.configInitialView()
    }
    
    // MARK: Supporting Methods
    func updateUI() {
        // hide logout button if user not saved in local
        if User.current() == nil {
            btnLogout.isHidden = true
        }
        
        // set username
        lblUserName.text = ApplicationManager.shared.appUser?.name
        lblEmail.text = ApplicationManager.shared.appUser?.email
    }
    
    func requestStoreData() {
        self.startHUDwithLabel(label: NSLocalizedString("loading", comment: ""))
        StoreRequest.shared.fetchStoreData { (success, message) in
            self.stopHud()
            if success {
                // load data success
                self.tableView.reloadData()
            } else {
                // show load data error
                AlertHelper(controller: self).showOkAlert(body: message)
            }
        }
    }
    
    // MARK: Prepair for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.SegueIdentifier.StoreToDetailsVC {
            if let storeDetailVC = segue.destination as? StoreDetailsViewController {
                storeDetailVC.store = sender as? Store
            }
        }
    }

    
    
}


extension StoreViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Tableview Datasource & Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ApplicationManager.shared.stores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifier.CellIdentifier) as? StoreListCell {
            let store = ApplicationManager.shared.stores[indexPath.row]
            cell.configureCell(store: store)
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let store = ApplicationManager.shared.stores[indexPath.row]
        self.performSegue(withIdentifier: Constants.SegueIdentifier.StoreToDetailsVC, sender: store)
    }
    
    
    
    
}




