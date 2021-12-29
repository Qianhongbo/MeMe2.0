//
//  showImageViewController.swift
//  MeMe1.0
//
//  Created by Maverick on 2021/12/27.
//

import UIKit

class ShowImageViewController: UIViewController {
    
    var image: UIImage!
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // hide the tabBar
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // show the image in the imageView
        self.imgView.image = self.image
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
}
