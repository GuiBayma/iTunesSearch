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
#import "Entidades/Filme.h"
#import "Musica.h"
#import "Podcast.h"
#import "Ebook.h"
#import "TableViewHeader.h"

@interface TableViewController () {
    iTunesManager *itunes;
    TableViewHeader *tableHeader;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    [self.tableview registerNib:nib forCellReuseIdentifier:@"celulaPadrao"];
    
    tableHeader = [[[NSBundle mainBundle] loadNibNamed:@"TableViewHeader" owner:self options:nil] firstObject];
    
    [tableHeader.buscaButton setTitle:NSLocalizedString(@"busca", nil) forState:UIControlStateNormal];
    [tableHeader.tituloLabel setText:NSLocalizedString(@"titulo", nil)];
    
    self.tableview.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:tableHeader];
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
        [celula.tipo setText:@"Filme"];
        [celula.tipoArtista setText:@"Diretor:"];
        [celula.artista setText:filme.artista];
    
        return celula;
    }
    else if (indexPath.section == 1) {
        Musica *musica = [_musicas objectAtIndex:indexPath.row];
        [celula.nome setText:musica.nome];
        [celula.tipo setText:@"Musica"];
        [celula.tipoArtista setText:@"Músico:"];
        [celula.artista setText:musica.artista];
        
        return celula;
    }
    else if (indexPath.section == 2) {
        Podcast *podcast = [_podcasts objectAtIndex:indexPath.row];
        [celula.nome setText:podcast.nome];
        [celula.tipo setText:@"Podcast"];
        [celula.tipoArtista setText:@"Artista:"];
        [celula.artista setText:podcast.artista];
        
        return celula;
    }
    else {
        Ebook *ebook = [_ebooks objectAtIndex:indexPath.row];
        [celula.nome setText:ebook.nome];
        [celula.tipo setText:@"Ebook"];
        [celula.tipoArtista setText:@"Autor:"];
        [celula.artista setText:ebook.artista];
        
        return celula;
    }
    return celula;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return tableHeader;
    }
    return  nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [tableHeader.textoBusca resignFirstResponder];
}


@end
