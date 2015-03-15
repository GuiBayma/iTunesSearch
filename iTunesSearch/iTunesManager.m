//
//  iTunesManager.m
//  iTunesSearch
//
//  Created by joaquim on 09/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "iTunesManager.h"
#import "Entidades/Filme.h"
#import "Musica.h"
#import "Podcast.h"
#import "Ebook.h"

@implementation iTunesManager

static iTunesManager *SINGLETON = nil;

static bool isFirstAccess = YES;

#pragma mark - Public Method

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];    
    });
    
    return SINGLETON;
}

- (NSString *) regularizarExpressao:(NSString *) termo {
    if (!termo) {
        return @"";
    }
    NSRange   searchedRange = NSMakeRange(0, [termo length]);
    NSString *pattern = [NSString stringWithFormat:@"\\b"];
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:nil];
    NSMutableString *termoMutable = [termo mutableCopy];
    NSString *trimmed = termoMutable;
    NSArray *resultadosMatches = [regex matchesInString:termoMutable options:0 range:searchedRange];
    if (resultadosMatches.count > 0) {
        trimmed = [termoMutable stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        return  trimmed;
    }
    return trimmed;
}

- (NSArray *)buscarFilmes:(NSString *)termo {
    NSString *termoRegularizado = [self regularizarExpressao:termo];
    
    NSString *url = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&media=movie&limit=15", termoRegularizado];
    NSError *error;
    NSData *jsonData = [NSData dataWithContentsOfURL: [NSURL URLWithString:url]];
    NSDictionary *resultado = [NSJSONSerialization JSONObjectWithData:jsonData
                                                              options:NSJSONReadingMutableContainers
                                                                error:&error];
    
    if (error) {
        NSLog(@"Não foi possível fazer a busca. ERRO: %@", error);
        return nil;
    }
    
    NSArray *resultados = [resultado objectForKey:@"results"];
    NSMutableArray *filmes = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in resultados) {
        Filme *filme = [[Filme alloc] init];
        [filme setNome:[item objectForKey:@"trackName"]];
        [filme setNomeTipo:@"Diretor:"];
        [filme setTipo:@"Filme"];
        [filme setArtista:[item objectForKey:@"artistName"]];
        [filme setUrlImagem:[item objectForKey:@"artworkUrl100"]];
        [filme setMidiaImage:@"movie-100.png"];
        [filme setDescricao:[item objectForKey:@"longDescription"]];
        [filmes addObject:filme];
    }
    
    return filmes;
}

- (NSArray *)buscarMusicas:(NSString *)termo {
    NSString *termoRegularizado = [self regularizarExpressao:termo];
    
    NSString *url = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&media=music&limit=15", termoRegularizado];
    NSData *jsonData = [NSData dataWithContentsOfURL: [NSURL URLWithString:url]];
    
    NSError *error;
    NSDictionary *resultado = [NSJSONSerialization JSONObjectWithData:jsonData
                                                              options:NSJSONReadingMutableContainers
                                                                error:&error];
    if (error) {
        NSLog(@"Não foi possível fazer a busca. ERRO: %@", error);
        return nil;
    }
    
    NSArray *resultados = [resultado objectForKey:@"results"];
    NSMutableArray *musicas = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in resultados) {
        Musica *musica = [[Musica alloc] init];
        [musica setNome:[item objectForKey:@"trackName"]];
        [musica setNomeTipo:@"Artista:"];
        [musica setTipo:@"Musica"];
        [musica setArtista:[item objectForKey:@"artistName"]];
        [musica setUrlImagem:[item objectForKey:@"artworkUrl100"]];
        [musica setMidiaImage:@"music-96.png"];
        [musica setDescricao:[item objectForKey:@"collectionName"]];
        [musicas addObject:musica];
    }
    
    return musicas;
}

- (NSArray *)buscarPodcasts:(NSString *)termo {
    NSString *termoRegularizado = [self regularizarExpressao:termo];
    
    NSString *url = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&media=podcast&limit=15", termoRegularizado];
    NSData *jsonData = [NSData dataWithContentsOfURL: [NSURL URLWithString:url]];
    
    NSError *error;
    NSDictionary *resultado = [NSJSONSerialization JSONObjectWithData:jsonData
                                                              options:NSJSONReadingMutableContainers
                                                                error:&error];
    if (error) {
        NSLog(@"Não foi possível fazer a busca. ERRO: %@", error);
        return nil;
    }
    
    NSArray *resultados = [resultado objectForKey:@"results"];
    NSMutableArray *podcasts = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in resultados) {
        Podcast *podcast = [[Podcast alloc] init];
        [podcast setNome:[item objectForKey:@"trackName"]];
        [podcast setNomeTipo:@"Artista:"];
        [podcast setTipo:@"Podcast"];
        [podcast setArtista:[item objectForKey:@"artistName"]];
        [podcast setUrlImagem:[item objectForKey:@"artworkUrl100"]];
        [podcast setMidiaImage:@"radio_tower-104.png"];
        [podcast setDescricao:[item objectForKey:@"collectionName"]];
        [podcasts addObject:podcast];
    }
    
    return podcasts;
}

- (NSArray *)buscarEbooks:(NSString *)termo {
    NSString *termoRegularizado = [self regularizarExpressao:termo];
    
    NSString *url = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&media=ebook&limit=15", termoRegularizado];
    NSData *jsonData = [NSData dataWithContentsOfURL: [NSURL URLWithString:url]];
    
    NSError *error;
    NSDictionary *resultado = [NSJSONSerialization JSONObjectWithData:jsonData
                                                              options:NSJSONReadingMutableContainers
                                                                error:&error];
    if (error) {
        NSLog(@"Não foi possível fazer a busca. ERRO: %@", error);
        return nil;
    }
    
    NSArray *resultados = [resultado objectForKey:@"results"];
    NSMutableArray *ebooks = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in resultados) {
        Ebook *ebook = [[Ebook alloc] init];
        [ebook setNome:[item objectForKey:@"trackName"]];
        [ebook setNomeTipo:@"Autor:"];
        [ebook setTipo:@"Ebook"];
        [ebook setArtista:[item objectForKey:@"artistName"]];
        [ebook setUrlImagem:[item objectForKey:@"artworkUrl100"]];
        [ebook setMidiaImage:@"literature-100.png"];
        [ebook setDescricao:[item objectForKey:@"description"]];
        [ebooks addObject:ebook];
    }
    
    return ebooks;
}

#pragma mark - Life Cycle

+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copy
{
    return [[iTunesManager alloc] init];
}

- (id)mutableCopy
{
    return [[iTunesManager alloc] init];
}

- (id) init
{
    if(SINGLETON){
        return SINGLETON;
    }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    self = [super init];
    return self;
}


@end
