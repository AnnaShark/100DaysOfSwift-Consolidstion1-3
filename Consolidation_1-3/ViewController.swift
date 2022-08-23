//
//  ViewController.swift
//  Consolidation_1-3
//
//  Created by Anna Shark on 13/8/22.
//

import UIKit

class ViewController: UITableViewController  {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Flags"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("flag_"){
                pictures.append(item)
            }
        }
        print(pictures)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("call to tableView numberOfRowsInSection func")
        return pictures.count
       
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        let country = String(pictures[indexPath.row].dropLast(7).dropFirst(5)).uppercased()
        cell.textLabel?.text = country
        
        if let image : UIImage = UIImage(named: pictures[indexPath.row]){
            cell.imageView!.image = image
        }
        
        print("call to tableView cellForRowAt func")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
            print("call to tableView didSelectRowAt func")
        }
    }
    

    


}

