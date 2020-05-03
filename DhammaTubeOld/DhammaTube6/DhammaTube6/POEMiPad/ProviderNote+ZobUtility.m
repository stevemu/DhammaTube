//
//  ProviderNote+ZobUtility.m
//  POEMiPad
//
//  Created by Sebastian Aguirre on 9/18/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//
#import "ZobData.h"
#import "ProviderNote+ZobUtility.h"

@implementation ProviderNote (ZobUtility)

+(ProviderNote *)addEntity
{
    ProviderNote * newEntity = [ProviderNote MR_createEntity];
    newEntity.physicalexamination = [PhysicalExamination MR_createEntity];
    newEntity.chiefcomplaint = [ChiefComplaint MR_createEntity];
    newEntity.vitalsigns = [VitalSigns MR_createEntity];
    //newEntity.noteros = [NoteROS addEntity];
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    return newEntity;
}

+(NSArray *)getAllWithPagination:(PaginationOptions)pagination
{
    NSMutableArray * allModels = [NSArray NSAToNSMA:[self MR_findAll]];
    if (pagination == PaginationAlphabetical)
        [NSMutableArray sortArrayOfModelsByTitle:allModels];
    else
        [NSMutableArray sortArrayOfModelsByDate:allModels];
    return allModels;
}

+(NSArray *)getAllWithStringInTitle:(NSString *)string withPagination:(PaginationOptions)pagination;
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"type contains [cd] %@",string];
    
    NSMutableArray * allModels = [NSArray NSAToNSMA:[self MR_findAllWithPredicate:predicate]];
    
    if (pagination == PaginationAlphabetical)
        [NSMutableArray sortArrayOfModelsByTitle:allModels];
    else
        [NSMutableArray sortArrayOfModelsByDate:allModels];
    return allModels;
}

-(NSSet *)getPersonalincident
{
    return self.personalincident;
}

-(NSSet *)getPMHIncidents
{
    NSSet * personalSet = [self getPersonalincident];
    NSMutableSet * PMHSet = [[NSMutableSet alloc] init];
    
    for (PersonalIncident * incident in personalSet) {
        if (incident.pmhincident) {
            [PMHSet addObject:incident];
        }
    }
    return PMHSet;
}

-(NSDate *)attributeForDate
{
    return self.date;
}

-(NSString *)attributeForTitle
{
    return self.type;
}

@end
