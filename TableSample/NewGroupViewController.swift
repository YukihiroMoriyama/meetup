    //
//  NewGroupViewController.swift
//  TableSample
//
//  Created by yukihiro moriyama on 2016/06/25.
//  Copyright © 2016年 YukihiroMoriyama. All rights reserved.
//

import UIKit
import RealmSwift

class NewGroupViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    let realm = try! Realm()
    var pickerData: [String] = []
    var selectedCategory: Int = 0
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var categoryPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UITapGestureRecognizer(target: self, action: Selector("didSelectedIconImageView"))
        iconImageView.addGestureRecognizer(gesture)
        
        self.titleTextField.delegate = self

        let search = realm.objects(Category)
        for c in search {
            pickerData.append(c.name)
        }
        
        self.categoryPickerView.delegate = self
        self.categoryPickerView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCategory = row + 1
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
        return true
        
    }
    
    @IBAction func createGroup() {
        let group = Group()
        group.id = realm.objects(Group).count + 1
        group.name = titleTextField.text!
        group.imgName = "cafe_2" // TODO: 選択した画像にする
        group.category = realm.objects(Category).filter("id == \(selectedCategory)").first
        
        try! realm.write {
            realm.add(group)
        }
        
        let search = realm.objects(Group)
        print(search)
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancel() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func didSelectedIconImageView() {
        self.pickImageFromLibrary()
    }
    
    func pickImageFromLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            iconImageView.contentMode = .ScaleAspectFit
            iconImageView.image = pickedImage
        }
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}
