//
//  PHMIncident.h
//  POEMiPad
//
//  Created by Oghosa Ohiomoba on 9/4/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PHMIncident : NSManagedObject

@property (nonatomic, retain) NSString * assessment;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSSet *personalincident;
@end

@interface PHMIncident (CoreDataGeneratedAccessors)

- (void)addPersonalincidentObject:(NSManagedObject *)value;
- (void)removePersonalincidentObject:(NSManagedObject *)value;
- (void)addPersonalincident:(NSSet *)values;
- (void)removePersonalincident:(NSSet *)values;

@end
