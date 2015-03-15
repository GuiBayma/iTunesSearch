//
//  ViewController.m
//  iTunesSearch
//
//  Created by joaquim on 09/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "iTunesManager.h"
#import "Filme.h"
#import "Musica.h"
#import "Podcast.h"
#import "Ebook.h"
#import "TableViewHeader.h"
#import "WebImageOperations.h"
#import "DetailViewController.h"

@interface TableViewController () {
    iTunesManager *itunes;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    [self.tableview registerNib:nib forCellReuseIdentifier:@"celulaPadrao"];
    
    TableViewHeader *tableHeader = [[[NSBundle mainBundle] loadNibNamed:@"TableViewHeader" owner:self options:nil] firstObject];
    
    [tableHeader.buscaButton setTitle:NSLocalizedString(@"busca", nil) forState:UIControlStateNormal];
    [tableHeader.tituloLabel setText:NSLocalizedString(@"titulo", nil)];
    
    UINavigationItem *navItem = self.navigationController.navigationBar.topItem;
    navItem.titleView = tableHeader;
    
    self.tableview.contentInset = UIEdgeInsetsMake(-20.0, 0, 0, 0);
}

-(void)viewDidLayoutSubviews {
    UINavigationBar *navBar = self.navigationController.navigationBar;
    [navBar setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 90)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Metodos do UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0: return [_filmes count]; break;
        case 1: return [_musicas count]; break;
        case 2: return [_podcasts count]; break;
        case 3: return [_ebooks count]; break;
        default: return 0; break;
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0: return @"Filmes"; break;
        case 1: return @"Musicas"; break;
        case 2: return @"Podcasts"; break;
        case 3: return @"Ebooks"; break;
        default: return nil; break;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *celula = [self.tableview dequeueReusableCellWithIdentifier:@"celulaPadrao"];
    
    if (indexPath.section == 0) {
        Filme *filme = [_filmes objectAtIndex:indexPath.row];
    
        [celula.nome setText:filme.nome];
        [celula.tipo setText:filme.tipo];
        [celula.tipoArtista setText:filme.nomeTipo];
        [celula.artista setText:filme.artista];
        [WebImageOperations processImageDataWithURLString:filme.urlImagem andBlock:^(NSData *imageData) {
            if (self.view.window) {
                UIImage *image = [UIImage imageWithData:imageData];
                
                [celula.artWork setImage:image];
            }
            
        }];
    
        return celula;
    }
    else if (indexPath.section == 1) {
        Musica *musica = [_musicas objectAtIndex:indexPath.row];
        [celula.nome setText:musica.nome];
        [celula.tipo setText:musica.tipo];
        [celula.tipoArtista setText:musica.nomeTipo];
        [celula.artista setText:musica.artista];
        [WebImageOperations processImageDataWithURLString:musica.urlImagem andBlock:^(NSData *imageData) {
            if (self.view.window) {
                UIImage *image = [UIImage imageWithData:imageData];
                
                [celula.artWork setImage:image];
            }
            
        }];
        
        return celula;
    }
    else if (indexPath.section == 2) {
        Podcast *podcast = [_podcasts objectAtIndex:indexPath.row];
        [celula.nome setText:podcast.nome];
        [celula.tipo setText:podcast.tipo];
        [celula.tipoArtista setText:podcast.nomeTipo];
        [celula.artista setText:podcast.artista];
        [WebImageOperations processImageDataWithURLString:podcast.urlImagem andBlock:^(NSData *imageData) {
            if (self.view.window) {
                UIImage *image = [UIImage imageWithData:imageData];
                
                [celula.artWork setImage:image];
            }
            
        }];
        
        return celula;
    }
    else {
        Ebook *ebook = [_ebooks objectAtIndex:indexPath.row];
        [celula.nome setText:ebook.nome];
        [celula.tipo setText:ebook.tipo];
        [celula.tipoArtista setText:ebook.nomeTipo];
        [celula.artista setText:ebook.artista];
        [WebImageOperations processImageDataWithURLString:ebook.urlImagem andBlock:^(NSData *imageData) {
            if (self.view.window) {
                UIImage *image = [UIImage imageWithData:imageData];
                
                [celula.artWork setImage:image];
            }
            
        }];
        
        return celula;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *dvc = [[DetailViewController alloc] init];
    Midia *midiaSelecionada = [[Midia alloc] init];
    
    if (indexPath.section == 0) {
        midiaSelecionada = [_filmes objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 1) {
        midiaSelecionada = [_musicas objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 2) {
        midiaSelecionada = [_podcasts objectAtIndex:indexPath.row];
    }
    else {
        midiaSelecionada = [_ebooks objectAtIndex:indexPath.row];
    }
    
    dvc.midia = midiaSelecionada;
    
    [self.navigationController pushViewController:dvc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return  60;
}

@end
