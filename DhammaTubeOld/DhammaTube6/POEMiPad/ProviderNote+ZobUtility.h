//
//  ProviderNote+ZobUtility.h
//  POEMiPad
//
//  Created by Sebastian Aguirre on 9/18/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import "ProviderNote.h"
#import "PMHIncident.h"
#import "PhysicalExamination.h"
#import "VitalSigns.h"
#import "ChiefComplaint.h"
#import "NoteROS.h"
#import "ROSField.h"
#import "Searchable.h"
#import "NSArray+ZobArrayUtilities.h"
#import "NSMutableArray+Sorting.h"

@interface ProviderNote (ZobUtility)

+(ProviderNote *)addEntity;

+(NSArray *)getAllWithPagination:(PaginationOptions)pagination;
+(NSArray *)getAllWithStringInTitle:(NSString *)string withPagination:(PaginationOptions)pagination;

//-(NSSet *)getPersonalincident;
//-(NSSet *)getPMHIncidents;

-(NSDate *)attributeForDate;
-(NSString *)attributeForTitle;

@end
