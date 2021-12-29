//
//  MemeTableViewController.swift
//  MeMe1.0
//
//  Created by Maverick on 2021/12/26.
//

import Foundation
import UIKit

class TableCollectionViewController: UITableViewController {
    
    // MARK: Properties
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData() // reload the data when the view will appear
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: set the row of the tableView cell
        self.tableView.rowHeight = (view.frame.height/5)
        
        // MARK: Edit button
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        // MARK: Plus button
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(self.takeAmeme))
    }
    
    // MARK: Take a Meme
    @objc func takeAmeme() {
        let memeViewController = self.storyboard?.instantiateViewController(withIdentifier: "memeViewController") as! ViewController
        present(memeViewController, animated: true, completion: nil)
    }
    
    // MARK: tableView delegate function
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell") as! MemeTableViewCell
        let meme = self.memes[indexPath.row]
        cell.memeImageView.image = meme.memedImage
        cell.memeLabel.text = meme.topText + "  " + meme.bottomText
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let img = self.memes[indexPath.row].memedImage
        let showImgVC = self.storyboard?.instantiateViewController(withIdentifier: "ShowImageVC") as! ShowImageViewController
        showImgVC.image = img
        self.navigationController?.pushViewController(showImgVC, animated: true)
    }
    
    // MARK: Edit button
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.appDelegate.memes.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else {
            return
        }
    }
}
