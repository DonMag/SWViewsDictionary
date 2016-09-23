//
//  ViewController.swift
//  SWViewsDictionary
//
//  Created by DonMag on 9/23/16.
//  Copyright © 2016 DonMag. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var myContainerView: UIView!
	
	var viewsDict: NSMutableDictionary!
	
	var vNames = ["weather", "events", "people"]
	
	var iCount = 1
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		// initialize the Dictionary
		viewsDict = NSMutableDictionary()
		
		// create and add the views
		self.doAddViews()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


	func doAddViews() {
		
		var pt: CGPoint = CGPoint(x: 8.0, y: 8.0)
		let sz: CGSize = CGSize(width: 200.0, height: 80.0)
		
		for vName in vNames {
		
			let vNew = UIView(frame: CGRect(origin: pt, size: sz))
			let lNew = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: sz.width, height: sz.height))
			
			vNew.backgroundColor = UIColor.blueColor()
			lNew.textColor = UIColor.whiteColor()
			
			lNew.text = vName
			
			vNew.addSubview(lNew)
			
			self.myContainerView.addSubview(vNew)
			
			self.viewsDict.setObject(vNew, forKey: vName)
			
			pt.y += sz.height + 8

		}
		
	}
	
	func changeLabelForViewNamed(vName: String) -> Void {
		
		var lbl: UILabel?
		
		guard let v = viewsDict[vName] else { return }
		
		lbl = v.subviews[0] as? UILabel
		
		lbl?.text = "\(vName): \(iCount)"
		
		iCount = iCount + 1
		
	}
	
	@IBAction func changeWeather(sender: AnyObject) {
		self.changeLabelForViewNamed("weather")
	}
	
	@IBAction func changeEvents(sender: AnyObject) {
		self.changeLabelForViewNamed("events")
	}
	
	@IBAction func changePeople(sender: AnyObject) {
		self.changeLabelForViewNamed("people")
	}

}

