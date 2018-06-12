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
//    let imageCache = NSCache<NSString, UIImage>()
    
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
        if let url = URL(string: (photo?.picture)!){
            DispatchQueue.main.async {
                do {
                    let data = try Data(contentsOf: url)
                    self.imageView.image = UIImage(data: data)
                }catch let error {
                    print("Error : \(error.localizedDescription)")
                }
            }
        }
    }
//    func downloadImage(url: URL, completion: @escaping (_ image: UIImage?, _ error: Error?) -> Void) {
//        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
//            completion(cachedImage, nil)
//        } else {
//
//        }
//    }
//
}

extension ViewController: PhotoSelectionDelegate {
    func PhotoSelected(_ newPhoto: Photo) {
            photo = newPhoto
    }
}
