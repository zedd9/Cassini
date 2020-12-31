//
//  ImageViewController.swift
//  Cassini
//
//  Created by Hyeonuk Shin on 2020/12/31.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {

	var imageURL : URL? {
		didSet {
			image = nil
			if view.window != nil {
				fetchImage()
			}
		}
	}
	
	private func fetchImage() {
		if let url = imageURL {
			spinner.startAnimating()
			DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated).async {
				let contentsOfURL = NSData(contentsOf: url)
				DispatchQueue.main.async {
					if url == self.imageURL {
						if let imageData = contentsOfURL {
							self.image = UIImage(data: imageData as Data)
						} else {
							self.spinner?.stopAnimating()
						}
					}
					else
					{
						print("ignored data returned from url \(url)")
					}
				}
			}
		}
	}
	
	private var imageView = UIImageView()
	@IBOutlet weak var scrollView: UIScrollView!{
		didSet {
			scrollView.contentSize = imageView.frame.size
			scrollView.delegate = self
			scrollView.minimumZoomScale = 0.03
			scrollView.maximumZoomScale = 1.0
		}
	}
	@IBOutlet weak var spinner: UIActivityIndicatorView!
	
	func viewForZooming(in scrollView: UIScrollView) -> UIView? {
		return imageView
	}
	
	private var image: UIImage? {
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
		if image == nil {
			fetchImage()
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		scrollView.addSubview(imageView)
    }
}
