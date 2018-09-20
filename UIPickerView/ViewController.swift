//
//  ViewController.swift
//  UIPickerView
//
//  Created by 李维强 on 2018/9/20.
//  Copyright © 2018 李维强. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let picker = UIPickerView(frame: CGRect(x: 20, y: 100, width: 280, height: 200))
        
        picker.delegate = self
        
        self.view.addSubview(picker)
        
        let datePicker = UIDatePicker(frame: CGRect(x: 20, y: 300, width: 280, height: 200))
        //模式
        datePicker.datePickerMode = UIDatePicker.Mode.dateAndTime
        
        self.view.addSubview(datePicker)
        
        datePicker.addTarget(self, action: #selector(sele), for: UIControl.Event.valueChanged)
        
    }
    
    @objc func sele(datepicker:UIDatePicker) {
        print(datepicker.date)
    }
    
    
    //设置pickerView的分组数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    //设置每个分组的行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "第\(component)组，第\(row)行"
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attri = NSMutableAttributedString(string: "第\(component)组，第\(row)行")
        attri.addAttributes([NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 14),NSAttributedString.Key.foregroundColor:UIColor.red,NSAttributedString.Key.underlineColor:UIColor.green,NSAttributedString.Key.underlineStyle:NSNumber(integerLiteral: 1)], range: NSRange(location: 0, length: attri.length))
        
        return attri
    }

    //自定义
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        let imageview = UIImageView(image: UIImage(named: "emtry"))
//        imageview.frame=CGRect(x: 0, y: 0, width: 140, height: 30)
//
//        return imageview
//    }
    
    //某一组宽度
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("选择了\(component+1)组，第\(row+1)行")
    }
}

