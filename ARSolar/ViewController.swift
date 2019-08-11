//
//  ViewController.swift
//  ARSolar
//
//  Created by Yu Zhang on 2/5/19.
//  Copyright © 2019 Yu Zhang. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, ARSCNViewDelegate {

    // MARK: - set values for 3d model
    var objectName = ""
    var objRadius: CGFloat = 0.2
    var xDistance = 0.0
    var yDistance = 0.2
    var zDistance = -1.0
    var counterClock = CGFloat.pi
    var spinDuration = 15.0
    // MARK: - set values for collectionView
    let cellID = "cellID"
    lazy var images = {
        return [UIImage(named: "moon_icon"),
                UIImage(named: "sun_icon"),
                UIImage(named: "mercury_icon"),
                UIImage(named: "venus_icon"),
                UIImage(named: "earth_icon"),
                UIImage(named: "mars_icon"),
                UIImage(named: "jupiter_icon"),
                UIImage(named: "saturn_icon"),
                UIImage(named: "uranus_icon"),
                UIImage(named: "neptune_icon"),
                UIImage(named: "pluto_icon"),
                UIImage(named: "milkyway_icon")
                ]
    }()
    lazy var labels = {
        return ["Moon", "Sun", "Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune", "Pluto", "Milky Way"]
    }()
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet var sceneView: ARSCNView!
    
    fileprivate func removeAll() {

        if sceneView != nil{
            sceneView.scene.rootNode.enumerateChildNodes {node,_ in
                node.removeFromParentNode()
            }
        }
    }
    
    fileprivate func loadModel() {
        removeAll()
        let sphere = SCNSphere(radius: objRadius)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: objectName)
        sphere.materials = [material]
        let node = SCNNode()
        node.position = SCNVector3(xDistance, yDistance, zDistance)
        node.geometry = sphere
        let action = SCNAction.repeatForever(SCNAction.rotate(by: counterClock, around: SCNVector3(0, 1, 0), duration: spinDuration))
        node.runAction(action)
        sceneView.scene.rootNode.addChildNode(node)
        sceneView.automaticallyUpdatesLighting = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(IconCell.self, forCellWithReuseIdentifier: cellID)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        if ARWorldTrackingConfiguration.isSupported {
            let configuration = ARWorldTrackingConfiguration()
            sceneView.session.run(configuration)

        }else {
            let configuration = AROrientationTrackingConfiguration()
            sceneView.session.run(configuration)

        }

        // Run the view's session
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    // MARK: - button for the planets
    func earthButton(){
        objectName = "art.scnassets/8k_earth_daymap.jpg"
        objRadius = 1.2
        xDistance = 0.0
        yDistance = 0.6
        zDistance = -2.5
        counterClock = .pi
        spinDuration = 24.0
        loadModel()
    }
    
    @IBAction func moonButton(_ sender: Any) {
        objectName = "art.scnassets/moon.jpg"
        objRadius = 0.3
        xDistance = 1.0
        yDistance = 0.1
        zDistance = -1.0
        counterClock = .pi
        spinDuration = 15.0
        loadModel()

    }
    
    @IBAction func mercuryButton(_ sender: Any) {
        objectName = "art.scnassets/8k_mercury.jpg"
        objRadius = 0.4
        xDistance = -3.0
        zDistance = -2.5
        counterClock = .pi
        spinDuration = 30.0
        loadModel()

    }
    
    @IBAction func sunButton(_ sender: Any) {
        objectName = "art.scnassets/8k_sun.jpg"
        objRadius = 15.0
        xDistance = -20.0
        yDistance = 7.5
        zDistance = -40.0
        counterClock = .pi
        spinDuration = 60.0
        loadModel()

    }
    
    func venusButton() {
        objectName = "art.scnassets/2k_venus_atmosphere.jpg"
        objRadius = 1.0
        xDistance = -2.0
        yDistance = 0.5
        zDistance = -2.0
        counterClock = -.pi
        spinDuration = 60.0
        loadModel()
    }
    func marsButton() {
        objectName = "art.scnassets/2k_mars.jpg"
        objRadius = 1.0
        xDistance = 2.0
        yDistance = 0.5
        zDistance = -4.0
        counterClock = .pi
        spinDuration = 24.0
        loadModel()
    }
    func jupiterButton() {
        objectName = "art.scnassets/2k_jupiter.jpg"
        objRadius = 10.0
        xDistance = 5.0
        yDistance = 5.0
        zDistance = -15.0
        counterClock = .pi
        spinDuration = 9.9
        loadModel()
    }
    func saturnButton() {
        objectName = "art.scnassets/2k_saturn.jpg"
        objRadius = 9.0
        xDistance = 7.0
        yDistance = 4.5
        zDistance = -20.0
        counterClock = .pi
        spinDuration = 10.0
        loadModel()
    }
    func uranusButton() {
        objectName = "art.scnassets/2k_uranus.jpg"
        objRadius = 3.9
        xDistance = 9.0
        yDistance = 1.9
        zDistance = -18.0
        counterClock = -.pi
        spinDuration = 17.0
        loadModel()
    }
    
    func neptuneButton() {
        objectName = "art.scnassets/2k_neptune.jpg"
        objRadius = 3.8
        xDistance = 14.0
        yDistance = 1.9
        zDistance = -17.0
        counterClock = .pi
        spinDuration = 16.0
        loadModel()
    }
    func plutoButton() {
        objectName = "art.scnassets/plutomap2k.jpg"
        objRadius = 0.2
        xDistance = 14.0
        yDistance = 1.9
        zDistance = -17.0
        counterClock = .pi
        spinDuration = 120.0
        loadModel()
    }
    
    func milkywayButton() {
        objectName = "art.scnassets/8k_stars_milky_way.jpg"
        objRadius = 1
        xDistance = 0
        yDistance = 0
        zDistance = -1
        counterClock = .pi
        spinDuration = 1000.0
        loadModel()
    }
    
    func selectObj(index: Int) {
        switch index {
        case 0:
            moonButton(self)
        case 1:
            sunButton(self)
        case 2:
            mercuryButton(self)
        case 3:
            venusButton()
        case 4:
            earthButton()
        case 5:
            marsButton()
        case 6:
            jupiterButton()
        case 7:
            saturnButton()
        case 8:
            uranusButton()
        case 9:
            neptuneButton()
        case 10:
            plutoButton()
        case 11:
            milkywayButton()
            
        default:
            print("error")
        }
    }
    
    // MARK: - UICollectionView delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? IconCell {
            cell.image = images[indexPath.row]
            cell.text = labels[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectObj(index: indexPath.row)
    }

    
}
