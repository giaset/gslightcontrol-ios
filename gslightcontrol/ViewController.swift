//
//  ViewController.swift
//  gslightcontrol
//
//  Created by Gianni Settino on 2014-09-16.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firebaseRef: Firebase!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "GSLightControl"
        
        firebaseRef = Firebase(url: "https://gslightcontrol.firebaseio.com/")
    }

}

/*myRootRef.observeEventType(.Value, withBlock: {
snapshot in
println("\(snapshot.name) -> \(snapshot.value)")
})*/
