//
//  DrawModel.h
//  SmartDraw
//
//  Created by Fabrice Froehly on 05/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#ifndef DrawModel_h
#define DrawModel_h

#import <UIKit/UIKit.h>
#import "Mantle.h"

@interface DrawModel : MTLModel<MTLJSONSerializing>
    @property (copy, nonatomic) NSString* message;

@end

#endif /* DrawModel_h */
