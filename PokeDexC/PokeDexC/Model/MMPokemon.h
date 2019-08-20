//
//  MMPokemon.h
//  PokeDexC
//
//  Created by Mitch Merrell on 8/20/19.
//  Copyright © 2019 Mitch Merrell. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MMPokemon : NSObject

@property (nonatomic, readonly) NSInteger identifier;
// Declare that it's a property, define the property attributes, define the type, name it ;
@property (nonatomic, readonly, copy) NSString *pokemonName;
@property (nonatomic, readonly) NSArray<NSString *> *abilities;

/*
 
 1. - Declare the method type. - instance method  + class method
 
 2. (instancetype) declare the return type
 
 3. initWithPokemonName  the method name
 
 4. NSString the type of the first parameter
 
 5. * pointer to first parameter
 
 6. name  parameter (internal) name
 
 7. identifier  external name for paramter 2
 
 8. NSString  type of 2nd parameter
 
 9. identifier  parameter(internal) name
 
 10. abilities  external name for parameter 3
 
 11. NSArray  type for param 3
 
 12. <NSString>  Declaring the type of objects param 3 can interact with. < generic type >
 
 13. * pointer for the generic type
 
 14. *  pointer for param 3
 
 15. abilities  internal name for param 3
 
 16. GD semi colon
 
 func initWithName(name: String, identifier: Int, abilities: [String]) -> (Model) {}
*/

- (instancetype) initWithPokemonName:(NSString *)name identifier:(NSUInteger)identifier abilities:(NSArray<NSString *> *)abilities;

@end

@interface MMPokemon (JSONConvertable)

- (instancetype) initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
