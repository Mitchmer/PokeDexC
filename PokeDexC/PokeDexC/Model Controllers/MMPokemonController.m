//
//  MMPokemonController.m
//  PokeDexC
//
//  Created by Mitch Merrell on 8/20/19.
//  Copyright © 2019 Mitch Merrell. All rights reserved.
//

#import "MMPokemonController.h"

@implementation MMPokemonController

+ (void)fetchPokemonWithSearchTerm:(NSString *)searchTerm completion:(void (^)(MMPokemon * _Nullable))completion
{
    // url
    // guard let baseURL = URL(string: "") else { completion, return }
    NSURL *baseURL = [[NSURL alloc] initWithString:@"https://pokeapi.co/api/v2/pokemon/"];
    
    // baseURL.appendingPathComponents(searchTerm)
    NSURL *finalURL = [baseURL URLByAppendingPathComponent:searchTerm];
    NSLog(@"Final URL: %@", finalURL);
    
    // url session
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // check for error
        if (error) {
            NSLog(@"Error %@: %@", error, error.localizedDescription);
            completion(nil);
            return;
        }
        // check for data
        if (!data) { completion(nil); return; }
        
        // initialize pokemon, complete
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if (!topLevelDictionary) { completion(nil); return; }
        
        MMPokemon *pokemon = [[MMPokemon alloc] initWithDictionary:topLevelDictionary];
        completion(pokemon);
    }] resume];
    
    // decode/initialize a pokemon object, complete
}

@end
