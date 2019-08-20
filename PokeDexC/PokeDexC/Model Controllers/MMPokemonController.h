//
//  MMPokemonController.h
//  PokeDexC
//
//  Created by Mitch Merrell on 8/20/19.
//  Copyright © 2019 Mitch Merrell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMPokemon.h"

@interface MMPokemonController : NSObject

+ (void) fetchPokemonWithSearchTerm:(NSString *)searchTerm completion:(void (^) (MMPokemon *))completion;

@end
