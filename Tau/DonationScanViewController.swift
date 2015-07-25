//
//  DonationScanViewController.swift
//  Tau
//
//  Created by Gu Junchao on 26/7/15.
//  Copyright (c) 2015 Tau. All rights reserved.
//

import UIKit
import MTBBarcodeScanner
import MBProgressHUD

class DonationScanViewController: UIViewController {
    
    var scanner: MTBBarcodeScanner?
    
    @IBOutlet weak var preview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scanner = MTBBarcodeScanner(previewView: self.preview)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        MTBBarcodeScanner.requestCameraPermissionWithSuccess({(success) -> Void in
            if success {
                self.scanner?.startScanningWithResultBlock({results -> Void in
                    var readable = results.first as? AVMetadataMachineReadableCodeObject
                    println(readable!.stringValue)
                    
                    self.processQrcodeReading()
                    self.scanner?.stopScanning()
                })
            }
        })
    }
    
    func processQrcodeReading() {
        var hud = MBProgressHUD.showHUDAddedTo(self.navigationController!.view, animated: true)
        hud.labelText = "Loading"
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.7 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), { () -> Void in
            MBProgressHUD.hideAllHUDsForView(self.navigationController!.view, animated: true)
            self.performSegueWithIdentifier("pushToDonationFromScan", sender: Donation())
        })
    }
}
