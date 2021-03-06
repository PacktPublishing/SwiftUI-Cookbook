//
//  ViewController.swift
//  PreviewUIKitViews
//
//  Created by Edgar Nzokwe on 4/5/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct MainViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController()!.view
    }
    
    func updateUIView(_ view: UIView, context: Context) {
        
    }
}

@available(iOS 13.0, *)
struct MainViewController_Preview: PreviewProvider {
    static var previews: some View {
        MainViewRepresentable()
    }
}
#endif
