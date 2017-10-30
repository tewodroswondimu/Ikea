//
//  ViewController.swift
//  Ikea
//
//  Created by Tewodros Wondimu on 10/30/17.
//  Copyright © 2017 Tewodros Wondimu. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
    let configuration = ARWorldTrackingConfiguration()
    let itemsArray: [String] = ["Cup", "Vase", "Boxing", "Table"]
    
    @IBOutlet weak var itemCollectionView: UICollectionView!
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.session.run(configuration)
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.itemCollectionView.dataSource = self
        self.itemCollectionView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // returns how many cells that the collection view will display
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    // the contents of the collection view cell
    // a data source function every single view in the collection
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // deque returns a cell type based on the identifier item
        // indexpath is concerned with which cell we're configuring
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! ItemCell
        
        // Sets the label of the uicollection view to the name in the items array
        cell.itemLabel.text = self.itemsArray[indexPath.row]
        
        return cell
    }
    
    // When ever a button is pressed you change the background to the color green
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.green
    }
    
    // Change the color of the collection view back to orange when deslected
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.orange
    }
    
}

