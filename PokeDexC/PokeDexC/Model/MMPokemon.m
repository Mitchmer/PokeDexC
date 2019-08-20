//
//  MMPokemon.m
//  PokeDexC
//
//  Created by Mitch Merrell on 8/20/19.
//  Copyright © 2019 Mitch Merrell. All rights reserved.
//

#import "MMPokemon.h"

static NSString * const nameKey = @"name";
static NSString * const identifierKey = @"id";
static NSString * const abilitiesKey = @"abilities";
static NSString * const abilityKey = @"ability";

@implementation MMPokemon

- (instancetype)initWithPokemonName:(NSString *)name identifier:(NSUInteger)identifier abilities:(NSArray<NSString *> *)abilities {
    self = [super init];
    if (self != nil) {
        _pokemonName = name;
        _identifier = identifier;
        _abilities = abilities;
    }
    
    return self;
}

@end

@implementation MMPokemon (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    // name
    NSString *name = dictionary[nameKey];
    // id
    NSInteger identifier = [dictionary[identifierKey] integerValue];
    // abilities
    NSArray *abilitiesDictionary = dictionary[abilitiesKey];
    
    if (![name isKindOfClass:[NSString class]] || ![abilitiesDictionary isKindOfClass:[NSArray class]])
    {
        return nil;
    }
    
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc]init];
    
    for (NSDictionary *dictionary in abilitiesDictionary)
    {
        NSDictionary *abilityDict = dictionary[abilityKey];
        NSString * abilityName = abilityDict[nameKey];
        [abilities addObject:abilityName];
    }
    
    return [self initWithPokemonName:name identifier:identifier abilities:abilities];
}

@end
