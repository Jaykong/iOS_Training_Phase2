//
//  ViewController.swift
//  JKImagePicker
//
//  Created by kongyunpeng on 1/9/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBAction func addPhotoLibrary(sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.sourceType = .PhotoLibrary
        picker.delegate = self
        self.presentViewController(picker, animated: true, completion: nil)
    }
    @IBAction func addPhoto(sender: AnyObject) {
      let picker = UIImagePickerController()
        picker.sourceType = .SavedPhotosAlbum
        picker.delegate = self
        self.presentViewController(picker, animated: true, completion: nil)
    }
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func takePhoto(sender: AnyObject) {
     
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .Camera
        if UIImagePickerController.isCameraDeviceAvailable(.Front) {
                pickerController.cameraDevice = .Front
            }
            else {
                pickerController.cameraDevice = .Rear
            }
            
         pickerController.delegate = self
         self.presentViewController(pickerController, animated: true, completion: nil)
        }
        
      
        
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
      imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
      picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
       picker.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

