//
//  Midia.m
//  iTunesSearch
//
//  Created by Guilherme Bayma on 3/13/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "Midia.h"

@implementation Midia

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.nome forKey:@"nome"];
    [aCoder encodeObject:self.nomeTipo forKey:@"nomeTipo"];
    [aCoder encodeObject:self.tipo forKey:@"tipo"];
    [aCoder encodeObject:self.artista forKey:@"artista"];
    [aCoder encodeObject:self.urlImagem forKey:@"urlImagem"];
    [aCoder encodeObject:self.descricao forKey:@"descricao"];
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    if(self = [super init]){
        self.nome = [aDecoder decodeObjectForKey:@"nome"];
        self.nomeTipo = [aDecoder decodeObjectForKey:@"nomeTipo"];
        self.tipo = [aDecoder decodeObjectForKey:@"tipo"];
        self.artista = [aDecoder decodeObjectForKey:@"artista"];
        self.urlImagem = [aDecoder decodeObjectForKey:@"urlImagem"];
        self.descricao = [aDecoder decodeObjectForKey:@"descricao"];
    }
    return self;
}

@end
