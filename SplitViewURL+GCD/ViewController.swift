//
//  ViewController.swift
//  SplitViewURL+GCD
//
//  Created by tham gia huy on 6/9/18.
//  Copyright © 2018 tham gia huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var photo: Photo? {
        didSet {
            refreshUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func refreshUI() {
        loadViewIfNeeded()
        let queue = DispatchQueue(label: "")
        if let url = URL(string: (photo?.picture)!){
            queue.sync {
                do {
                    let data = try Data(contentsOf: url)
                    self.imageView.image = UIImage(data: data)
                }catch let error {
                    print("Error : \(error.localizedDescription)")
                }
            }
        }
    }
    
}

extension ViewController: PhotoSelectionDelegate {
    func PhotoSelected(_ newPhoto: Photo) {
            photo = newPhoto
    }
}
