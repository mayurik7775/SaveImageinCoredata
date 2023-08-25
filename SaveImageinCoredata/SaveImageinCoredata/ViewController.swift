//
//  ViewController.swift
//  SaveImageinCoredata
//
//  Created by Mac on 25/08/23.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myStatus: UILabel!
    
    var photos = [PhotoGallary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func choosebtn(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
        
    }
    
    @IBAction func retrivebtn(_ sender: Any) {
        let dh = DatabaseHandler()
        photos = dh.retriveDat()
        myImage.image = UIImage(data: photos[photos.count-1].savedImage! as Data)
        myStatus.text = "Image Retrived From Coredata Successfully"
        print("Image Has been retrive from coreData")
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            myImage.image = pickedImage
            let dh = DatabaseHandler()
            dh.image = myImage.image
            myStatus.text = "Image Saved in CoreData Successfully"
        }
        dismiss(animated: true,completion: nil)
    }
}

