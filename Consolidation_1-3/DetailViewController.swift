//
//  DetailViewController.swift
//  Consolidation_1-3
//
//  Created by Anna Shark on 13/8/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?

   

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
            title = imageToLoad.dropLast(7).dropFirst(5).uppercased()
            print(imageToLoad)
        }

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    

    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        let imageName = selectedImage?.dropLast(7).dropFirst(5).uppercased() ?? "Flag"
        
        let vc = UIActivityViewController(activityItems: [image,imageName], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }


}
