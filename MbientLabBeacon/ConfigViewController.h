//
//  ConfigViewController.h
//  iBeacons Demo
//
//  Created by Created by Laura Kassovic on 1/22/14.
//  Copyright (c) 2013 MbientLab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface ConfigViewController : UIViewController <CBPeripheralManagerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) CLBeaconRegion *beaconRegion;

@property (strong, nonatomic) UITextField *uuidLabel;
@property (strong, nonatomic) UILabel *uuidLabelName;
@property (strong, nonatomic) UITextField *majorLabel;
@property (strong, nonatomic) UILabel *majorLabelName;
@property (strong, nonatomic) UITextField *minorLabel;
@property (strong, nonatomic) UILabel *minorLabelName;
@property (strong, nonatomic) UITextField *identityLabel;
@property (strong, nonatomic) UILabel *identityLabelName;

@property (strong, nonatomic) NSDictionary *beaconPeripheralData;
@property (strong, nonatomic) CBPeripheralManager *peripheralManager;

@end
