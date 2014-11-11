
#import <UIKit/UIKit.h>

@interface UILabel (FLDStyling)

@property(nonatomic, copy) NSDictionary *fldTextAttributes;
@property(nonatomic, copy) NSDictionary *fldSecondaryTextAttributes;

@property(nonatomic, copy) NSString *fldPrimaryText;
@property(nonatomic, copy) NSString *fldSecondaryText;
@property(nonatomic, copy) NSArray *fldTextComponents;

@end
