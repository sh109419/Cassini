//
//  ViewController.swift
//  Cassini
//
//  Created by hyf on 16/10/16.
//  Copyright © 2016年 hyf. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {

    var imageURL: URL? {
        didSet {
            image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    fileprivate func fetchImage() {
        /*if let url = imageURL {
            self.spinner?.startAnimating()
            let request = NSURLRequest(URL: url)
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error ) -> Void in
                if error == nil && data != nil {
                    NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                        if  url == self.imageURL {
                            if let imageData = data {
                                self.image = UIImage(data: imageData)
                            } else {
                                self.spinner?.stopAnimating()
                            }
                        }
                        //self.image = UIImage(data: data!)
                        self.spinner?.stopAnimating()
                    })
                }
                //self.spinner?.stopAnimating()
            }
            task.resume()
            
            print("fetchImage")
        }*/
        
        
       
        if let url = imageURL {
            spinner?.startAnimating()
            DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated).async {
                let contentOfURL = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if url == self.imageURL {
                        if let imageData = contentOfURL {
                            self.image = UIImage(data: imageData)
                        } else {
                            self.spinner?.stopAnimating()
                        }
                    } else {
                        print("ignored data return from url \(url)")
                    }
                }
            }
        }
    }
    
    /*
    func updateFeed(url: NSURL, completion: (feed: Feed?) -> Void) {
        
        let request = NSURLRequest(URL: url)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            if error == nil && data != nil {
                let feed = Feed(data: data!, sourceURL: url)
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    completion(feed: feed)
                })
            }
            
        }
        
        task.resume()
        print("update feed")
    }*/
    

    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.02
            scrollView.maximumZoomScale = 1.0
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    fileprivate var imageView = UIImageView()
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    fileprivate var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            spinner?.stopAnimating()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.addSubview(imageView)
        //imageURL = NSURL(string: DemoURL.Earth)
        
    }

    
}

