//
//  TableViewHeader.m
//  iTunesSearch
//
//  Created by Guilherme Bayma on 3/10/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "TableViewHeader.h"
#import "iTunesManager.h"
#import "TableViewController.h"

@implementation TableViewHeader

- (IBAction)buscar:(UIButton *)sender {
    iTunesManager *itunes = [iTunesManager sharedInstance];
    UINavigationController *nav = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    TableViewController *tvc = [nav.viewControllers objectAtIndex:0];
    NSArray *filmes = [itunes buscarFilmes:_textoBusca.text];
    tvc.filmes = filmes;
    NSArray *musicas = [itunes buscarMusicas:_textoBusca.text];
    tvc.musicas = musicas;
    NSArray *podcasts = [itunes buscarPodcasts:_textoBusca.text];
    tvc.podcasts = podcasts;
    NSArray *ebooks = [itunes buscarEbooks:_textoBusca.text];
    tvc.ebooks = ebooks;
    
    NSUserDefaults *pesquisaSalva = [NSUserDefaults standardUserDefaults];
    NSData *filmeData = [NSKeyedArchiver archivedDataWithRootObject:filmes];
    [pesquisaSalva setObject:filmeData forKey:@"filmes"];
    NSData *musicaData = [NSKeyedArchiver archivedDataWithRootObject:musicas];
    [pesquisaSalva setObject:musicaData forKey:@"musicas"];
    NSData *podcastData = [NSKeyedArchiver archivedDataWithRootObject:podcasts];
    [pesquisaSalva setObject:podcastData forKey:@"podcasts"];
    NSData *ebooksData = [NSKeyedArchiver archivedDataWithRootObject:ebooks];
    [pesquisaSalva setObject:ebooksData forKey:@"ebooks"];
    [pesquisaSalva synchronize];
    
    [tvc.tableview reloadData];
    [_textoBusca resignFirstResponder];
}

@end
