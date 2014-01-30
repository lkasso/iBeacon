//
//  ConfigViewController.m
//  iBeacons Demo
//
//  Created by Created by Laura Kassovic on 1/22/14.
//  Copyright (c) 2013 MbientLab. All rights reserved.
//

#import "ConfigViewController.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ConfigViewController ()

@end

@implementation ConfigViewController

@synthesize uuidLabel, uuidLabelName, majorLabel, majorLabelName, minorLabel, minorLabelName, identityLabel, identityLabelName, beaconPeripheralData, beaconRegion, peripheralManager;

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"Transmit Beacon";
        
        UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60.0)];
        UINavigationItem *titleItem = [[UINavigationItem alloc] initWithTitle:@"Transmit Beacon"];
        [navBar setBarTintColor:UIColorFromRGB(0x5a74ac)];
        [navBar setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName, [UIFont systemFontOfSize:21.0], NSFontAttributeName, nil]];
        navBar.items = @[titleItem];
        [self.view addSubview:navBar];

        [self.tabBarController setTitle:@"Transmit Beacon"];
        self.view.backgroundColor = [UIColor clearColor];
        self.tabBarItem.image = [UIImage imageNamed:@"upload"];
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
    self.uuidLabelName.font = [UIFont systemFontOfSize:15.0];
    self.uuidLabelName.text = @"UUID:";
    [self.view addSubview:self.uuidLabelName];
    
    self.uuidLabel = [[UITextField alloc] initWithFrame:CGRectMake(70.0, 100.0, self.view.frame.size.width-80, 40.0)];
    self.uuidLabel.backgroundColor = [UIColor clearColor];
    self.uuidLabel.textColor = [UIColor grayColor];
    self.uuidLabel.textAlignment = NSTextAlignmentLeft;
    self.uuidLabel.borderStyle = UITextBorderStyleRoundedRect;
    self.uuidLabel.font = [UIFont systemFontOfSize:10.0];
    self.uuidLabel.text = @"EEC065A0-9E87-4BAD-ACB6-00ECD0DC6BB7";
    self.uuidLabel.keyboardType = UIKeyboardTypeDefault;
    self.uuidLabel.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.uuidLabel.delegate = self;
    [self.view addSubview:self.uuidLabel];

    self.majorLabelName = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 150.0, self.view.frame.size.width-100, 40.0)];
    self.majorLabelName.backgroundColor = [UIColor clearColor];
    self.majorLabelName.textColor = [UIColor blackColor];
    self.majorLabelName.textAlignment = NSTextAlignmentLeft;
    self.majorLabelName.font = [UIFont systemFontOfSize:15.0];
    self.majorLabelName.text = @"Major:";
    [self.view addSubview:self.majorLabelName];
    
    self.majorLabel = [[UITextField alloc] initWithFrame:CGRectMake(70.0, 150.0, self.view.frame.size.width-80, 40.0)];
    self.majorLabel.backgroundColor = [UIColor clearColor];
    self.majorLabel.textColor = [UIColor grayColor];
    self.majorLabel.textAlignment = NSTextAlignmentLeft;
    self.majorLabel.borderStyle = UITextBorderStyleRoundedRect;
    self.majorLabel.font = [UIFont systemFontOfSize:10.0];
    self.majorLabel.text = @"1";
    self.majorLabel.keyboardType = UIKeyboardTypeDefault;
    self.majorLabel.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.majorLabel.delegate = self;
    [self.view addSubview:self.majorLabel];

    self.minorLabelName = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 200.0, self.view.frame.size.width-100, 40.0)];
    self.minorLabelName.backgroundColor = [UIColor clearColor];
    self.minorLabelName.textColor = [UIColor blackColor];
    self.minorLabelName.textAlignment = NSTextAlignmentLeft;
    self.minorLabelName.font = [UIFont systemFontOfSize:15.0];
    self.minorLabelName.text = @"Minor:";
    [self.view addSubview:minorLabelName];
    
    self.minorLabel = [[UITextField alloc] initWithFrame:CGRectMake(70.0, 200.0, self.view.frame.size.width-80, 40.0)];
    self.minorLabel.backgroundColor = [UIColor clearColor];
    self.minorLabel.textColor = [UIColor grayColor];
    self.minorLabel.textAlignment = NSTextAlignmentLeft;
    self.minorLabel.borderStyle = UITextBorderStyleRoundedRect;
    self.minorLabel.font = [UIFont systemFontOfSize:10.0];
    self.minorLabel.text = @"2";
    self.minorLabel.keyboardType = UIKeyboardTypeDefault;
    self.minorLabel.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.minorLabel.delegate = self;
    [self.view addSubview:minorLabel];

    self.identityLabelName = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 250.0, self.view.frame.size.width-100, 40.0)];
    self.identityLabelName.backgroundColor = [UIColor clearColor];
    self.identityLabelName.textColor = [UIColor blackColor];
    self.identityLabelName.textAlignment = NSTextAlignmentLeft;
    self.identityLabelName.font = [UIFont systemFontOfSize:15.0];
    self.identityLabelName.text = @"Identity:";
    [self.view addSubview:self.identityLabelName];
    
    self.identityLabel = [[UITextField alloc] initWithFrame:CGRectMake(70.0, 250.0, self.view.frame.size.width-80, 40.0)];
    self.identityLabel.backgroundColor = [UIColor clearColor];
    self.identityLabel.textColor = [UIColor grayColor];
    self.identityLabel.textAlignment = NSTextAlignmentLeft;
    self.identityLabel.borderStyle = UITextBorderStyleRoundedRect;
    self.identityLabel.font = [UIFont systemFontOfSize:10.0];
    self.identityLabel.text = @"com.mbient.lab";
    self.identityLabel.keyboardType = UIKeyboardTypeDefault;
    self.identityLabel.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.identityLabel.delegate = self;
    [self.view addSubview:self.identityLabel];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self action:@selector(transmitBeacon)forControlEvents:UIControlEventTouchDown];
    [button setTitle:@"Transmit" forState:UIControlStateNormal];
    button.frame = CGRectMake(50.0, 300.0, self.view.frame.size.width-100, 40.0);
    [self.view addSubview:button];
    
    [self initBeacon];
    [self setLabels];
}

- (void)initBeacon {
    CLBeaconMajorValue major = [self.majorLabel.text integerValue];
    CLBeaconMinorValue minor = [self.minorLabel.text integerValue];
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:self.uuidLabel.text];
    self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid
                                                                major:major
                                                                minor:minor
                                                           identifier:self.identityLabel.text];
}

- (void)setLabels {
    self.uuidLabel.text = self.beaconRegion.proximityUUID.UUIDString;
    self.majorLabel.text = [NSString stringWithFormat:@"%@", self.beaconRegion.major];
    self.minorLabel.text = [NSString stringWithFormat:@"%@", self.beaconRegion.minor];
    self.identityLabel.text = self.beaconRegion.identifier;
}

- (void)transmitBeacon {
    [self initBeacon];
    [self setLabels];
    self.beaconPeripheralData = [self.beaconRegion peripheralDataWithMeasuredPower:nil];
    self.peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil options:nil];
}

-(void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {
    if (peripheral.state == CBPeripheralManagerStatePoweredOn) {
        NSLog(@"Powered On");
        [self.peripheralManager startAdvertising:self.beaconPeripheralData];
    } else if (peripheral.state == CBPeripheralManagerStatePoweredOff) {
        NSLog(@"Powered Off");
        [self.peripheralManager stopAdvertising];
    }
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
    }
    [textField resignFirstResponder];
    return YES;
}

@end
