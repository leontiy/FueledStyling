
#import "UILabel+FLDStyling.h"

#import <objc/runtime.h>
#import <Classy/NSObject+CASSwizzle.h>

@implementation UILabel (FLDStyling)

//static const char *FldStylingTextKey = "FldStylingTextKey";
static const char *FldStylingTextAttributesKey = "FldStylingTextAttributesKey";
static const char *FldStylingPrimaryTextKey = "FldStylingPrimaryTextKey";
static const char *FldStylingSecondaryTextKey = "FldStylingSecondaryTextKey";
static const char *FldStylingSecondaryTextAttributesKey = "FldStylingSecondaryTextAttributesKey";

+ (void)load {
    [UILabel cas_swizzleInstanceSelector:@selector(setText:) withNewSelector:@selector(fld_setText:)];
}

- (NSDictionary *)fldTextAttributes {
    return objc_getAssociatedObject(self, FldStylingTextAttributesKey);
}

- (void)setFldTextAttributes:(NSDictionary *)attributes {
    objc_setAssociatedObject(self, FldStylingTextAttributesKey, attributes, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self fld_updateAttributedString];
}

- (NSDictionary *)fldSecondaryTextAttributes {
    return objc_getAssociatedObject(self, FldStylingSecondaryTextAttributesKey);
}

- (void)setFldSecondaryTextAttributes:(NSDictionary *)attributes {
    objc_setAssociatedObject(self, FldStylingSecondaryTextAttributesKey, attributes, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self fld_updateAttributedString];
}

- (NSString *)fldSecondaryText {
    return objc_getAssociatedObject(self, FldStylingSecondaryTextKey);
}

- (void)setFldSecondaryText:(NSString *)text {
    objc_setAssociatedObject(self, FldStylingSecondaryTextKey, text, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self fld_updateAttributedString];
}

- (NSString *)fldPrimaryText {
    return objc_getAssociatedObject(self, FldStylingPrimaryTextKey);
}

- (void)setFldPrimaryText:(NSString *)text {
    objc_setAssociatedObject(self, FldStylingPrimaryTextKey, text, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self fld_updateAttributedString];
}

- (NSArray *)fldTextComponents {
    NSString *primary = self.fldPrimaryText;
    if (primary) {
        NSString *secondary = self.fldSecondaryText;
        if (secondary) {
            return @[primary, secondary];
        } else {
            return @[primary];
        }
    } else {
        return @[self.text];
    }
}

- (void)setFldTextComponents:(NSArray *)components {
    self.fldPrimaryText = [components firstObject] ?: @"";
    self.fldSecondaryText = (components.count < 2 ? @"" : components[1]);
}

- (void)fld_setText:(NSString *)text {
    [self fld_setText:text];
    [self fld_updateAttributedString];
}

- (void)fld_updateAttributedString {
    NSDictionary *attributes = self.fldTextAttributes;
    if (attributes) {
        if (self.fldPrimaryText) {
            NSDictionary *secondaryAttributes = self.fldSecondaryTextAttributes;

            NSMutableAttributedString *attributedString = [NSMutableAttributedString new];
            [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:(self.fldPrimaryText ?: @"") attributes:attributes]];
            [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:(self.fldSecondaryText ?: @"") attributes:secondaryAttributes ?: @{}]];
            self.attributedText = attributedString;
        } else {
            self.attributedText = [[NSAttributedString alloc] initWithString:(self.text ?: @"")  attributes:attributes];
        }
    }
}

@end
