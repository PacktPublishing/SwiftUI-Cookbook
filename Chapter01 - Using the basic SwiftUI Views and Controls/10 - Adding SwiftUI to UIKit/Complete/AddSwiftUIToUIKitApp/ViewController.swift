//
//  ViewController.swift
//  AddSwiftUIToUIKitApp
//
//  Created by Edgar Nzokwe on 3/9/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import UIKit
import SwiftUI
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBSegueAction func goToSwiftUI(_ coder: NSCoder) -> UIViewController? {
        let greetings = "Hello From UIKit"
        let rootView = Greetings(randomText: greetings)
        return UIHostingController(coder: coder, rootView: rootView)
    }
    
    
}


