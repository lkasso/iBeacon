//
//  TrackViewController.m
//  iBeacons Demo
//
//  Created by Created by Laura Kassovic on 1/22/14.
//  Copyright (c) 2013 MbientLab. All rights reserved.
//

#import "TrackViewController.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface TrackViewController ()

@end

@implementation TrackViewController

@synthesize uuidLabel, uuidLabelName, beaconFoundLabel, beaconFoundLabelName, proximityUUIDLabel, proximityUUIDLabelName, majorLabel, majorLabelName, minorLabel, minorLabelName, accuracyLabel, accuracyLabelName, distanceLabel, distanceLabelName, rssiLabel, rssiLabelName, beaconRegion, locationManager;

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"Track Beacon";
        
        UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60.0)];
        UINavigationItem *titleItem = [[UINavigationItem alloc] initWithTitle:@"Track Beacon"];
        [navBar setBarTintColor:UIColorFromRGB(0x5a74ac)];
        [navBar setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName, [UIFont systemFontOfSize:21.0], NSFontAttributeName, nil]];
        navBar.items = @[titleItem];
        [self.view addSubview:navBar];
        
        self.view.backgroundColor = [UIColor clearColor];
        self.tabBarItem.image = [UIImage imageNamed:@"download"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.uuidLabelName = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 100.0, self.view.frame.size.width-100, 40.0)];
    self.uuidLabelName.backgroundColor = [UIColor clearColor];
    self.uuidLabelName.textColor = [UIColor blackColor];
    self.uuidLabelName.textAlignment = NSTextAlignmentLeft;
    self.uuidLabelName.font = [UIFont systemFontOfSize:13.0];
    self.uuidLabelName.text = @"Track UUID:";
    [self.view addSubview:self.uuidLabelName];
    
    self.uuidLabel = [[UITextField alloc] initWithFrame:CGRectMake(90.0, 100.0, self.view.frame.size.width-100, 40.0)];
    self.uuidLabel.backgroundColor = [UIColor clearColor];
    self.uuidLabel.textColor = [UIColor blackColor];
    self.uuidLabel.textAlignment = NSTextAlignmentLeft;
    self.uuidLabel.borderStyle = UITextBorderStyleRoundedRect;
    self.uuidLabel.font = [UIFont systemFontOfSize:9.0];
    self.uuidLabel.text = @"EEC065A0-9E87-4BAD-ACB6-00ECD0DC6BB7";
    self.uuidLabel.keyboardType = UIKeyboardTypeDefault;
    self.uuidLabel.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.uuidLabel.delegate = self;
    [self.view addSubview:self.uuidLabel];
    
    self.beaconFoundLabelName = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 140.0, self.view.frame.size.width-100, 40.0)];
    self.beaconFoundLabelName.backgroundColor = [UIColor clearColor];
    self.beaconFoundLabelName.textColor = [UIColor blackColor];
    self.beaconFoundLabelName.textAlignment = NSTextAlignmentLeft;
    self.beaconFoundLabelName.font = [UIFont systemFontOfSize:15.0];
    self.beaconFoundLabelName.text = @"Found:";
    [self.view addSubview:self.beaconFoundLabelName];
    
    self.beaconFoundLabel = [[UILabel alloc] initWithFrame:CGRectMake(90.0, 140.0, self.view.frame.size.width-100, 40.0)];
    self.beaconFoundLabel.backgroundColor = [UIColor clearColor];
    self.beaconFoundLabel.textColor = [UIColor grayColor];
    self.beaconFoundLabel.textAlignment = NSTextAlignmentLeft;
    self.beaconFoundLabel.font = [UIFont systemFontOfSize:10.0];
    self.beaconFoundLabel.text = @"None";
    [self.view addSubview:self.beaconFoundLabel];
    
    self.proximityUUIDLabelName = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 180.0, self.view.frame.size.width-100, 40.0)];
    self.proximityUUIDLabelName.backgroundColor = [UIColor clearColor];
    self.proximityUUIDLabelName.textColor = [UIColor blackColor];
    self.proximityUUIDLabelName.textAlignment = NSTextAlignmentLeft;
    self.proximityUUIDLabelName.font = [UIFont systemFontOfSize:15.0];
    self.proximityUUIDLabelName.text = @"UUID:";
    [self.view addSubview:self.proximityUUIDLabelName];
    
    self.proximityUUIDLabel = [[UILabel alloc] initWithFrame:CGRectMake(90.0, 180.0, self.view.frame.size.width-100, 40.0)];
    self.proximityUUIDLabel.backgroundColor = [UIColor clearColor];
    self.proximityUUIDLabel.textColor = [UIColor grayColor];
    self.proximityUUIDLabel.textAlignment = NSTextAlignmentLeft;
    self.proximityUUIDLabel.font = [UIFont systemFontOfSize:10.0];
    self.proximityUUIDLabel.text = @"None";
    [self.view addSubview:self.proximityUUIDLabel];

    self.majorLabelName = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 220.0, self.view.frame.size.width-100, 40.0)];
    self.majorLabelName.backgroundColor = [UIColor clearColor];
    self.majorLabelName.textColor = [UIColor blackColor];
    self.majorLabelName.textAlignment = NSTextAlignmentLeft;
    self.majorLabelName.font = [UIFont systemFontOfSize:15.0];
    self.majorLabelName.text = @"Major:";
    [self.view addSubview:majorLabelName];
    
    self.majorLabel = [[UILabel alloc] initWithFrame:CGRectMake(90.0, 220.0, self.view.frame.size.width-100, 40.0)];
    self.majorLabel.backgroundColor = [UIColor clearColor];
    self.majorLabel.textColor = [UIColor grayColor];
    self.majorLabel.textAlignment = NSTextAlignmentLeft;
    self.majorLabel.font = [UIFont systemFontOfSize:10.0];
    self.majorLabel.text = @"None";
    [self.view addSubview:majorLabel];
    
    self.minorLabelName = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 260.0, self.view.frame.size.width-100, 40.0)];
    self.minorLabelName.backgroundColor = [UIColor clearColor];
    self.minorLabelName.textColor = [UIColor blackColor];
    self.minorLabelName.textAlignment = NSTextAlignmentLeft;
    self.minorLabelName.font = [UIFont systemFontOfSize:15.0];
    self.minorLabelName.text = @"Minor:";
    [self.view addSubview:minorLabelName];
    
    self.minorLabel = [[UILabel alloc] initWithFrame:CGRectMake(90.0, 260.0, self.view.frame.size.width-100, 40.0)];
    self.minorLabel.backgroundColor = [UIColor clearColor];
    self.minorLabel.textColor = [UIColor grayColor];
    self.minorLabel.textAlignment = NSTextAlignmentLeft;
    self.minorLabel.font = [UIFont systemFontOfSize:10.0];
    self.minorLabel.text = @"None";
    [self.view addSubview:minorLabel];
    
    self.accuracyLabelName = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 300.0, self.view.frame.size.width-100, 40.0)];
    self.accuracyLabelName.backgroundColor = [UIColor clearColor];
    self.accuracyLabelName.textColor = [UIColor blackColor];
    self.accuracyLabelName.textAlignment = NSTextAlignmentLeft;
    self.accuracyLabelName.font = [UIFont systemFontOfSize:15.0];
    self.accuracyLabelName.text = @"Accuracy:";
    [self.view addSubview:accuracyLabelName];
    
    self.accuracyLabel = [[UILabel alloc] initWithFrame:CGRectMake(90.0, 300.0, self.view.frame.size.width-100, 40.0)];
    self.accuracyLabel.backgroundColor = [UIColor clearColor];
    self.accuracyLabel.textColor = [UIColor grayColor];
    self.accuracyLabel.textAlignment = NSTextAlignmentLeft;
    self.accuracyLabel.font = [UIFont systemFontOfSize:10.0];
    self.accuracyLabel.text = @"None";
    [self.view addSubview:accuracyLabel];
    
    self.distanceLabelName = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 340.0, self.view.frame.size.width-100, 40.0)];
    self.distanceLabelName.backgroundColor = [UIColor clearColor];
    self.distanceLabelName.textColor = [UIColor blackColor];
    self.distanceLabelName.textAlignment = NSTextAlignmentLeft;
    self.distanceLabelName.font = [UIFont systemFontOfSize:15.0];
    self.distanceLabelName.text = @"Distance:";
    [self.view addSubview:self.distanceLabelName];
    
    self.distanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(90.0, 340.0, self.view.frame.size.width-100, 40.0)];
    self.distanceLabel.backgroundColor = [UIColor clearColor];
    self.distanceLabel.textColor = [UIColor grayColor];
    self.distanceLabel.textAlignment = NSTextAlignmentLeft;
    self.distanceLabel.font = [UIFont systemFontOfSize:10.0];
    self.distanceLabel.text = @"None";
    [self.view addSubview:self.distanceLabel];
    
    self.rssiLabelName = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 380.0, self.view.frame.size.width-100, 40.0)];
    self.rssiLabelName.backgroundColor = [UIColor clearColor];
    self.rssiLabelName.textColor = [UIColor blackColor];
    self.rssiLabelName.textAlignment = NSTextAlignmentLeft;
    self.rssiLabelName.font = [UIFont systemFontOfSize:15.0];
    self.rssiLabelName.text = @"RSSI:";
    [self.view addSubview:self.rssiLabelName];
    
    self.rssiLabel = [[UILabel alloc] initWithFrame:CGRectMake(90.0, 380.0, self.view.frame.size.width-100, 40.0)];
    self.rssiLabel.backgroundColor = [UIColor clearColor];
    self.rssiLabel.textColor = [UIColor grayColor];
    self.rssiLabel.textAlignment = NSTextAlignmentLeft;
    self.rssiLabel.font = [UIFont systemFontOfSize:10.0];
    self.rssiLabel.text = @"None";
    [self.view addSubview:self.rssiLabel];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    [self initRegion];
    
    [self locationManager:self.locationManager didStartMonitoringForRegion:self.beaconRegion];
}

- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region {
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
}

- (void)initRegion {
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:self.uuidLabel.text];
    self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:@"com.mbient.lab"];
    [self.locationManager startMonitoringForRegion:self.beaconRegion];
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    NSLog(@"Beacon Found");
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    NSLog(@"Left Region");
    [self.locationManager stopRangingBeaconsInRegion:self.beaconRegion];
    self.beaconFoundLabel.text = @"No";
}

-(void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region {
    CLBeacon *beacon = [[CLBeacon alloc] init];
    beacon = [beacons lastObject];
    
    self.beaconFoundLabel.text = @"Yes";
    self.proximityUUIDLabel.text = beacon.proximityUUID.UUIDString;
    self.majorLabel.text = [NSString stringWithFormat:@"%@", beacon.major];
    self.minorLabel.text = [NSString stringWithFormat:@"%@", beacon.minor];
    self.accuracyLabel.text = [NSString stringWithFormat:@"%f", beacon.accuracy];
    if (beacon.proximity == CLProximityUnknown) {
        self.distanceLabel.text = @"Unknown Proximity";
    } else if (beacon.proximity == CLProximityImmediate) {
        self.distanceLabel.text = @"Immediate";
    } else if (beacon.proximity == CLProximityNear) {
        self.distanceLabel.text = @"Near";
    } else if (beacon.proximity == CLProximityFar) {
        self.distanceLabel.text = @"Far";
    }
    self.rssiLabel.text = [NSString stringWithFormat:@"%i", beacon.rssi];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    if ([textField isEqual:self.uuidLabel]) {
        NSString *myRegex = @"[A-F0-9a-f-]*";
        NSPredicate *myTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", myRegex];
        NSString *string = textField.text;
        BOOL valid = [myTest evaluateWithObject:string];
        if (!valid) {
            self.uuidLabel.text = @"EEC065A0-9E87-4BAD-ACB6-00ECD0DC6BB7";
        }
        [self.locationManager stopMonitoringForRegion:self.beaconRegion];
        [self initRegion];
        [self locationManager:self.locationManager didStartMonitoringForRegion:self.beaconRegion];
    }
    [textField resignFirstResponder];
    return YES;
}

@end
