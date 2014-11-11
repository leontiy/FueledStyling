//
//  HMSegmentedControl+Classy.m
//  Dayo
//
//  Created by Leonty Deriglazov on 06/11/2014.
//  Copyright (c) 2014 Fueled. All rights reserved.
//

#import "HMSegmentedControl+Classy.h"
#import <Classy.h>

@implementation HMSegmentedControl (Classy)

+ (void)initialize {
  // Retrieve class descriptor
  CASObjectClassDescriptor *segmentedControlDesciptor = [CASStyler.defaultStyler objectClassDescriptorForClass:HMSegmentedControl.class];
  NSDictionary *selectionStyleMap = @{
    @"textWidthStripe" : @(HMSegmentedControlSelectionStyleTextWidthStripe),
    @"fullWidthStripe" : @(HMSegmentedControlSelectionStyleFullWidthStripe),
    @"box" : @(HMSegmentedControlSelectionStyleBox),
    @"arrow" : @(HMSegmentedControlSelectionStyleArrow),
  };
  [segmentedControlDesciptor setArgumentDescriptors:@[[CASArgumentDescriptor argWithValuesByName:selectionStyleMap]]
                                     forPropertyKey:@cas_propertykey(HMSegmentedControl, selectionStyle)];

  NSDictionary *selectionIndicatorLocationMap = @{
    @"up" : @(HMSegmentedControlSelectionIndicatorLocationUp),
    @"down" : @(HMSegmentedControlSelectionIndicatorLocationDown),
    @"none" : @(HMSegmentedControlSelectionIndicatorLocationNone),
  };
  [segmentedControlDesciptor setArgumentDescriptors:@[[CASArgumentDescriptor argWithValuesByName:selectionIndicatorLocationMap]]
                                     forPropertyKey:@cas_propertykey(HMSegmentedControl, selectionIndicatorLocation)];

}

@end
