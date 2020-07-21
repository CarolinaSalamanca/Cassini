//
//  ImageViewController.swift
//  Cassini
//
//  Created by Carolina Salamanca on 7/21/20.
//  Copyright © 2020 Carolina Salamanca. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var imageView = UIImageView()
    
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.minimumZoomScale = 1/25
            scrollView.maximumZoomScale = 1.0
            scrollView.delegate = self
            scrollView.addSubview(imageView)
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    var imageURL: URL?{
        didSet{
            image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    private var image: UIImage? {
        get{
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            spinner?.stopAnimating()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }
    
    private func fetchImage(){
        if let url = imageURL{
            spinner?.startAnimating()
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in // self declared as weak not for memory cycle matters but to avoid having a reference even when the controller is not displayed (e.g. when the user clicks back when the closure was executing)
                let urlContents = try? Data(contentsOf: url)
                // execute this in main thread
                DispatchQueue.main.async {
                    if let imageData = urlContents, url == self?.imageURL{ // if the previous closure took so long its possible that the imgURL already changed
                        self?.image = UIImage(data: imageData)
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if imageURL == nil {
//            imageURL = DemoURLs.image
//        }
    }
}
