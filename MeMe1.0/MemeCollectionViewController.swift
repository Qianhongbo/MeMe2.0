//
//  MemeCollectionViewController.swift
//  MeMe1.0
//
//  Created by Maverick on 2021/12/26.
//

import Foundation
import UIKit

class MemeCollectionViewController: UICollectionViewController {
    
    // MARK: Properties
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.reloadData() //reload data
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Plus button
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(self.takeAmeme))
        
        // MARK: flow layout
        let space:CGFloat = 3.0
        let horizontal = (view.frame.size.width - (2 * space)) / 3.0
        let vertical = (view.frame.size.height - (5 * space)) / 6.0

        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: horizontal, height: vertical)
    }
    
    // MARK: Take a Meme
    @objc func takeAmeme() {
        let memeViewController = self.storyboard?.instantiateViewController(withIdentifier: "memeViewController") as! ViewController
        present(memeViewController, animated: true, completion: nil)
    }
    
    // MARK: tableView delegate function
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCell", for: indexPath) as! MemeCollectionViewCell
        let meme = self.memes[indexPath.row]
        cell.MemeImageView.image = meme.memedImage
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let img = self.memes[indexPath.row].memedImage
        let showImgVC = self.storyboard?.instantiateViewController(withIdentifier: "ShowImageVC") as! ShowImageViewController
        showImgVC.image = img
        self.navigationController?.pushViewController(showImgVC, animated: true)
    }
}
