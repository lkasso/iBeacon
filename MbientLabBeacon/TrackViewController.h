//
//  TrackViewController.h
//  iBeacons Demo
//
//  Created by Created by Laura Kassovic on 1/22/14.
//  Copyright (c) 2013 MbientLab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface TrackViewController : UIViewController <CLLocationManagerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) UITextField *uuidLabel;
@property (strong, nonatomic) UILabel *uuidLabelName;
@property (strong, nonatomic) UILabel *beaconFoundLabel;
@property (strong, nonatomic) UILabel *beaconFoundLabelName;
@property (strong, nonatomic) UILabel *proximityUUIDLabel;
@property (strong, nonatomic) UILabel *proximityUUIDLabelName;
@property (strong, nonatomic) UILabel *majorLabel;
@property (strong, nonatomic) UILabel *majorLabelName;
@property (strong, nonatomic) UILabel *minorLabel;
@property (strong, nonatomic) UILabel *minorLabelName;
@property (strong, nonatomic) UILabel *accuracyLabel;
@property (strong, nonatomic) UILabel *accuracyLabelName;
@property (strong, nonatomic) UILabel *distanceLabel;
@property (strong, nonatomic) UILabel *distanceLabelName;
@property (strong, nonatomic) UILabel *rssiLabel;
@property (strong, nonatomic) UILabel *rssiLabelName;

@property (strong, nonatomic) CLBeaconRegion *beaconRegion;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end
