//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Carolina Salamanca on 7/21/20.
//  Copyright © 2020 Carolina Salamanca. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            if let url = DemoURLs.NASA[identifier]{
                //if the details controller is the navigation controller or imageViewController (when its on ipad its navigation controller, if its on iphone its imageview)
                if let imageVC = segue.destination.contents as? ImageViewController{
                    imageVC.imageURL = url
                    imageVC.title = (sender as? UIButton)?.currentTitle
                }
            }
        }
    }
}

// check if the current controller is the navigationController or something else
extension UIViewController{
    var contents: UIViewController{
        if let navCon = self as? UINavigationController{
            return navCon.visibleViewController ?? self
        }else{
            return self
        }
    }
}
