//
//  StoreDetailsViewController.swift
//  RTest
//
//  Created by Ishan Weerasooriya on 1/26/17.
//  Copyright © 2017 Ishan Weerasooriya. All rights reserved.
//

import UIKit

class StoreDetailsViewController: BaseViewController {
    
    // MARK: Outlets
    @IBOutlet var imgStore: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var tvDescription: UITextView!
    
    
    // MARK: Variable
    var store: Store?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // update view
        updateUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Supporting Methods
    func updateUI() {
        lblTitle.text = store?.title
        tvDescription.text = store?.des
        
        // set image
        if let storeImage = store?.storeImage {
            let url = URL(string: storeImage.large)!
            let placeholderImage = UIImage(named: "mountain")!
            imgStore.af_setImage(withURL: url, placeholderImage: placeholderImage)
        }
    }
    
    
    
}
