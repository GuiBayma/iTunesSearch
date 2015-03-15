//
//  Midia.h
//  iTunesSearch
//
//  Created by Guilherme Bayma on 3/13/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Midia : NSObject <NSCoding>

@property (nonatomic, strong) NSString *nome;
@property (nonatomic, strong) NSString *nomeTipo;
@property (nonatomic, strong) NSString *tipo;
@property (nonatomic, strong) NSString *artista;
@property (nonatomic, strong) NSString *urlImagem;
@property (nonatomic, strong) NSString *descricao;

- (void) encodeWithCoder:(NSCoder *)aCoder;
-(id) initWithCoder:(NSCoder *)aDecoder;

@end
