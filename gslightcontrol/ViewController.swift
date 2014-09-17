//
//  ViewController.swift
//  gslightcontrol
//
//  Created by Gianni Settino on 2014-09-16.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var firebaseRef: Firebase!
    
    var colorPickerView: NKOColorPickerView!
    var onOffSwitch = UISwitch(frame: CGRectZero)
    var brightnessSlider = UISlider()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "GSLightControl"
        
        firebaseRef = Firebase(url: "https://gslightcontrol.firebaseio.com/")
        
        tableView.tableHeaderView = headerView()
        
        firebaseRef.childByAppendingPath("on").observeEventType(.Value, withBlock: {
            snapshot in
            self.onOffSwitch.on = snapshot.value as Bool
        })
        
        firebaseRef.childByAppendingPath("brightness").observeEventType(.Value, withBlock: {
            snapshot in
            self.brightnessSlider.value = snapshot.value as Float
        })
    }
    
    func headerView() -> UIView {
        var didChangeColorBlock: NKOColorPickerDidChangeColorBlock = { color in println(color) }
        
        colorPickerView = NKOColorPickerView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150), color: UIColor.redColor(), andDidChangeColorBlock: didChangeColorBlock)
        
        return colorPickerView
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Options"
        case 1:
            return "Brightness"
        default:
            return ""
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var CellIdentifier = (indexPath.section == 0) ? "SwitchCell" : "SliderCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as? UITableViewCell
        
        if (cell == nil) {
            cell = UITableViewCell(style: .Default, reuseIdentifier: CellIdentifier)
            cell!.selectionStyle = .None
            
            if (indexPath.section == 0) {
                cell!.textLabel!.text = "On/Off"
                cell!.accessoryView = onOffSwitch
            } else {
                brightnessSlider.frame = CGRect(x: 20, y: 5, width: cell!.contentView.frame.width, height: brightnessSlider.frame.height)
                brightnessSlider.minimumValue = 0
                brightnessSlider.maximumValue = 1
                cell!.contentView.addSubview(brightnessSlider)
            }
            
        }
        
        return cell!
    }

}
