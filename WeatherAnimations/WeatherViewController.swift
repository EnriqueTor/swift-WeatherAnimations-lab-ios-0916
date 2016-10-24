//
//  ViewController.swift
//  WeatherAnimations
//
//  Created by Ian Rahman on 10/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let sun = UIImageView(image: UIImage(named: "Sun"))
    let moon = UIImageView(image: UIImage(named: "Moon"))
    let cloud = UIImageView(image: UIImage(named: "Cloud"))
    let lightning = UIImageView(image: UIImage(named: "Lightning"))
    let stormButton = UIButton()
    
    var sunCenterX: NSLayoutConstraint!
    var sunCenterY: NSLayoutConstraint!
    var moonCenterX: NSLayoutConstraint!
    var moonCenterY: NSLayoutConstraint!
    var stormCenterX: NSLayoutConstraint!
    var stormCenterY: NSLayoutConstraint!
    var cloudCenterX: NSLayoutConstraint!
    var cloudCenterY: NSLayoutConstraint!
    var lightningCenterX: NSLayoutConstraint!
    var lightningCenterY: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        
        setupViews()
        animateDayAndNight()
        animateSunAndMoon()
        
        
        stormButton.addTarget(self, action: #selector(cloudShaking), for: UIControlEvents.touchUpInside)

    }
    
    func setupViews() {
        
        self.view.addSubview(sun)
        self.view.addSubview(moon)
        self.view.addSubview(stormButton)
        self.view.addSubview(cloud)
        self.view.addSubview(lightning)
        
        self.sun.translatesAutoresizingMaskIntoConstraints = false
        self.moon.translatesAutoresizingMaskIntoConstraints = false
        self.stormButton.translatesAutoresizingMaskIntoConstraints = false
        self.cloud.translatesAutoresizingMaskIntoConstraints = false
        self.lightning.translatesAutoresizingMaskIntoConstraints = false
        
        self.stormButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        self.stormButton.backgroundColor = UIColor.white
        self.stormButton.layer.borderWidth = 2
        self.stormButton.layer.borderColor = UIColor.gray.cgColor
        self.stormButton.setTitle("🌩", for: .normal)
        self.stormButton.titleLabel?.textAlignment = .center
        
        self.sunCenterX = self.sun.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: self.view.frame.maxX * 0.5 + self.sun.frame.width/2)
        self.sunCenterX.isActive = true
        self.sunCenterY = self.sun.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.maxY * 0.5 + self.sun.frame.height/2)
        self.sunCenterY.isActive = true
        
        self.moonCenterX = self.moon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: self.view.frame.maxX * 0.5 + self.moon.frame.width/2)
        self.moonCenterX.isActive = true
        self.moonCenterY = self.moon.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.maxY * 0.5 + self.moon.frame.height/2)
        self.moonCenterY.isActive = true
        
        self.stormCenterX = self.stormButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        self.stormCenterX.isActive = true
        self.stormCenterY = self.stormButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.maxY/4)
        self.stormCenterY.isActive = true
        
        self.cloudCenterX = self.cloud.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        self.cloudCenterX.isActive = true
        self.cloudCenterY = self.cloud.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        self.cloudCenterY.isActive = true
        self.cloud.heightAnchor.constraint(equalTo: self.cloud.widthAnchor, multiplier: 0.5).isActive = true
        self.cloud.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        self.cloud.alpha = 0
        
        self.lightning.widthAnchor.constraint(equalTo: self.cloud.widthAnchor, multiplier: 0.30).isActive = true
        self.lightning.heightAnchor.constraint(equalTo: self.cloud.heightAnchor).isActive = true
        self.lightning.topAnchor.constraint(equalTo: self.cloud.bottomAnchor).isActive = true
        self.lightning.centerXAnchor.constraint(equalTo: self.cloud.centerXAnchor).isActive = true
        
        self.lightning.alpha = 0
        
        self.view.layoutIfNeeded()
        
    }
    
    func animateDayAndNight() {
        
        UIView.animateKeyframes(withDuration: 20.0, delay: 0.0, options: [.calculationModeCubic, .repeat, .allowUserInteraction], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                self.view.backgroundColor = UIColor.cyan
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.view.backgroundColor = UIColor.blue
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25, animations: {
                self.view.backgroundColor = UIColor.black
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                self.view.backgroundColor = UIColor.blue
            })
            
            }, completion: nil)
    }
    
    func animateSunAndMoon() {
        
        UIView.animateKeyframes(withDuration: 20.0, delay: 0.0, options: [.calculationModeCubic, .repeat], animations: {
            
            
            UIView.addKeyframe(withRelativeStartTime: 0.00, relativeDuration: 0.25, animations: {
                
                self.sunCenterX.isActive = false
                self.sunCenterY.isActive = false
                
                self.sunCenterX = self.sun.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
                self.sunCenterY = self.sun.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.maxY * -0.25)
                
                self.sunCenterX.isActive = true
                self.sunCenterY.isActive = true
                
                self.view.layoutIfNeeded()
                
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                
                self.sunCenterX.isActive = false
                self.sunCenterY.isActive = false
                
                self.sunCenterX = self.sun.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: self.view.frame.maxX * -1 - self.sun.frame.width/2)
                self.sunCenterY = self.sun.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.maxY + self.sun.frame.height/2)
                
                self.sunCenterX.isActive = true
                self.sunCenterY.isActive = true
                
                
                self.view.layoutIfNeeded()
                
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25, animations: {
                
                self.moonCenterX.isActive = false
                self.moonCenterY.isActive = false
                
                self.moonCenterX = self.moon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
                self.moonCenterY = self.moon.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.maxY * -0.25)
                
                self.moonCenterX.isActive = true
                self.moonCenterY.isActive = true
                
                
                self.view.layoutIfNeeded()
                
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                
                self.moonCenterX.isActive = false
                self.moonCenterY.isActive = false
                
                self.moonCenterX = self.moon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: self.view.frame.maxX * -1 - self.moon.frame.width/2)
                self.moonCenterY = self.moon.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.maxY + self.moon.frame.height/2)
                
                self.moonCenterX.isActive = true
                self.moonCenterY.isActive = true
                
                
                self.view.layoutIfNeeded()
                
            })
            
            }, completion: nil)
        
        
        
    }
    
    func cloudShaking() {
        
        print("hi")
        
        UIView.animateKeyframes(withDuration: 8.0, delay: 0.0, options: [.calculationModeCubic], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.00, relativeDuration: 0.25, animations: {
                
                self.cloud.alpha = 1
                self.cloudCenterX.isActive = false
                self.cloudCenterY.isActive = false
                
                self.cloudCenterX = self.cloud.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
                self.cloudCenterY = self.cloud.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.maxY * -0.25)
                
                self.cloudCenterX.isActive = true
                self.cloudCenterY.isActive = true
                
                self.view.layoutIfNeeded()
                
            })
    
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                
                self.cloudCenterX.isActive = false
                self.cloudCenterY.isActive = false
                
                self.cloudCenterX = self.cloud.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
                self.cloudCenterY = self.cloud.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
                
                self.cloudCenterX.isActive = true
                self.cloudCenterY.isActive = true
                
                
                self.view.layoutIfNeeded()

            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25, animations: {
                
                self.cloudCenterX.isActive = false
                self.cloudCenterY.isActive = false
                
                self.cloudCenterX = self.cloud.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
                self.cloudCenterY = self.cloud.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.maxY * -0.25)
                
                self.cloudCenterX.isActive = true
                self.cloudCenterY.isActive = true
                self.cloud.alpha = 0

                
                
                self.view.layoutIfNeeded()
                
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                
                self.cloudCenterX.isActive = false
                self.cloudCenterY.isActive = false
                
                self.cloudCenterX = self.cloud.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
                self.cloudCenterY = self.cloud.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
                
                self.cloudCenterX.isActive = true
                self.cloudCenterY.isActive = true
                
                
                self.view.layoutIfNeeded()
                
            })


        
          }, completion: nil)

        UIView.animateKeyframes(withDuration: 1.00, delay: 2.00, options: [], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.00, relativeDuration: 0.20, animations: {
                
                
                self.lightning.alpha = 1
                self.view.layoutIfNeeded()
                
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.20, relativeDuration: 0.20, animations: {
                
                
                self.lightning.alpha = 0
                self.view.layoutIfNeeded()
                
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.40, relativeDuration: 0.20, animations: {
                
                
                
                self.lightning.alpha = 1
                self.view.layoutIfNeeded()
                
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.65, relativeDuration: 0.20, animations: {
                
                
                self.lightning.alpha = 0
                self.view.layoutIfNeeded()
                
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.80, relativeDuration: 0.20, animations: {
                
                
                
                self.lightning.alpha = 1
                self.view.layoutIfNeeded()
                
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1.00, relativeDuration: 0.20, animations: {
                
                
                self.lightning.alpha = 0
                self.view.layoutIfNeeded()
                
            })

            
            
            }, completion: nil)
        
        
    }
    
    
}
    
