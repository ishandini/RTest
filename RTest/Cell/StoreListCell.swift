//
//  StoreListCell.swift
//  RTest
//
//  Created by Ishan Weerasooriya on 1/26/17.
//  Copyright © 2017 Ishan Weerasooriya. All rights reserved.
//

import UIKit
import AlamofireImage

class StoreListCell: UITableViewCell {

   // Outlets
    @IBOutlet var imgStore: CustomImageView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDescription: UILabel!
    
    func configureCell(store: Store) {
        lblTitle.text = store.title
        lblDescription.text = store.address
        
        // set thumbnail image
        if let storeImage = store.storeImage {
            let url = URL(string: storeImage.small)!
            let placeholderImage = UIImage(named: "store_image")!
            imgStore.af_setImage(withURL: url, placeholderImage: placeholderImage)
        }
        
    }
    
    
}
