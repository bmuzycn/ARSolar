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

class ViewController: UIViewController, ARSCNViewDelegate {

    var objectName = ""
    
    
    @IBOutlet var sceneView: ARSCNView!
    
    fileprivate func loadModel() {
        // Show statistics such as fps and timing information
        //        sceneView.showsStatistics = true
        
        // Create a new scene
        //        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        //        sceneView.scene = scene
        if sceneView != nil{
            sceneView.scene.removeAllParticleSystems()
        }
        let sphere = SCNSphere(radius: 0.2)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: objectName)
        sphere.materials = [material]
        let node = SCNNode()
        node.position = SCNVector3(0, 0.1, -0.5)
        node.geometry = sphere
        let action = SCNAction.repeatForever(SCNAction.rotate(by: .pi, around: SCNVector3(0, 1, 0), duration: 15))
        node.runAction(action)
        sceneView.scene.rootNode.addChildNode(node)
        sceneView.automaticallyUpdatesLighting = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
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
    // MARK: - button for the moon
    
    @IBAction func moonButton(_ sender: Any) {
        objectName = "art.scnassets/moon.jpg"
        loadModel()

    }
    
    @IBAction func mercuryButton(_ sender: Any) {
        objectName = "art.scnassets/8k_mercury.jpg"
        loadModel()

    }
    
    
}
