    // Malevitch Power Pack
// Empiler des formes pour construire un quartier suprématiste


//$vpt = [ 0, 0, 12 ]; // translation de la vue par défaut
//$vpr = [ 60, 0.00, 45 ]; // rotation de la vue par défaut
//$vpd = 190;

tailledebloc = 15; // taille de nos immeubles

// des tailles standards intéressantes :

sixieme_bloc    = tailledebloc/6 ;

tiers_bloc      = tailledebloc/3 ;

demi_bloc       = tailledebloc/2 ;
deuxtiers_bloc  = (tailledebloc/3)*2 ; 

unetdemi_bloc   = tailledebloc*1.5 ;
un_bloc         = tailledebloc ;
double_bloc     = tailledebloc*2 ;

// la position de chaque immeuble sur la grille du quartier, qui peut être passée aux modules immeubles
    
A1 = [ tailledebloc*1, 0, 0 ] ; // position 1 décalé d'une taille de bloc: liste plus lisible
A2 = [ tailledebloc*2, 0, 0 ] ;
A3 = [ tailledebloc*3, 0, 0 ] ;
A4 = [ tailledebloc*4, 0, 0 ] ;

B1 = [ tailledebloc*1, tailledebloc*1, 0 ] ;
B2 = [ tailledebloc*2, tailledebloc*1, 0 ] ;
B3 = [ tailledebloc*3, tailledebloc*1, 0 ] ;
B4 = [ tailledebloc*4, tailledebloc*1, 0 ] ;

C1 = [ tailledebloc*1, tailledebloc*2, 0 ] ;
C2 = [ tailledebloc*2, tailledebloc*2, 0 ] ;
C3 = [ tailledebloc*3, tailledebloc*2, 0 ] ;
C4 = [ tailledebloc*4, tailledebloc*2, 0 ] ;

D1 = [ tailledebloc*1, tailledebloc*3, 0 ] ;
D2 = [ tailledebloc*2, tailledebloc*3, 0 ] ;
D3 = [ tailledebloc*3, tailledebloc*3, 0 ] ;
D4 = [ tailledebloc*4, tailledebloc*3, 0 ] ; 

a1=A1; a2=A2; a3=A3; a4=A4; b1=B1; b2=B2; b3=B3; b4=B4; c1=C1; c2=C2; c3=C3; c4=C4; d1=D1; d2=D2; d3=D3; d4=D4; // kids friendly!!


// nous pouvons aussi placer nos immeubles en utilisant la syntaxe: A1() building();

module A1 () { translate(A1) children () ; }
module A2 () { translate(A2) children () ; }
module A3 () { translate(A3) children () ; }
module A4 () { translate(A4) children () ; }

module B1 () { translate(B1) children () ; }
module B2 () { translate(B2) children () ; }
module B3 () { translate(B3) children () ; }
module B4 () { translate(B4) children () ; }

module C1 () { translate(C1) children () ; }
module C2 () { translate(C2) children () ; }
module C3 () { translate(C3) children () ; }
module C4 () { translate(C4) children () ; }

module D1 () { translate(D1) children () ; }
module D2 () { translate(D2) children () ; }
module D3 () { translate(D3) children () ; }
module D4 () { translate(D4) children () ; }


module raccourci (position) { 
    hauteur = position+[0,0,demi_bloc];
    difference() {
        children() ; 
        translate(hauteur) cube([un_bloc,un_bloc,un_bloc*4]) ;
    }
}

module decoupe (position) { 
    decalage = position+[deuxtiers_bloc,deuxtiers_bloc,-sixieme_bloc];
    difference() {
        children() ; 
        translate(decalage) cube([un_bloc,un_bloc,un_bloc*4]) ;
    }
}


// un tableau pour créer des décalages vers des 4 angles selon la position sur la grille
lesdecalages = [
[sixieme_bloc, sixieme_bloc, 0]
,[-sixieme_bloc, sixieme_bloc, 0]
,[sixieme_bloc, -sixieme_bloc, 0],
,[-sixieme_bloc, -sixieme_bloc, 0]
];

module angle(position){
translate(position){
	union() {
        
        cube([demi_bloc,un_bloc,tiers_bloc]); // bas 
        
        translate([tiers_bloc,tiers_bloc,0]) // haut 
            cube([tiers_bloc,un_bloc,un_bloc]);
          
        
          translate([demi_bloc,demi_bloc,0]) // droite
            cube([demi_bloc,,tiers_bloc,tiers_bloc]);
          
          
        }}}

module building(position){
translate(position){
    
    hauteur = ((position[1]%3)+2)/2;
    
	union() {
        
        
		translate([sixieme_bloc,tiers_bloc,un_bloc]) // haut
		cube([deuxtiers_bloc,tiers_bloc,tiers_bloc*hauteur]);
		
        
        cube([un_bloc, deuxtiers_bloc, un_bloc]); // bas
       }}}
       
      
       
module tour(position){
translate(position){
    
    decalage = lesdecalages [position[1]%4];
    
	union() {
		cube([un_bloc,un_bloc,sixieme_bloc]); // bas
        
		translate([sixieme_bloc,sixieme_bloc,sixieme_bloc])
            translate(decalage/3)
            cube([deuxtiers_bloc,deuxtiers_bloc,un_bloc]); // milieu
        
       translate([tiers_bloc,tiers_bloc,un_bloc])
           translate(decalage)
           cube([tiers_bloc,tiers_bloc,un_bloc*1.25]); // haut 
       }}}

translate([ -un_bloc*3, -un_bloc*2, 0 ]){ // recentrage
union() {
// faites la liste de vos immeubles ici. 
// (ils sont dans un Union pour devenir un seul bloc)


angle(A1);
tour(a1);
    
building(a2);
tour(A2);
angle(A3);
tour(A4);
    
building(B1);
building(B2);
tour(B3);
angle(B4);
    
angle(C1);
building(C2);
raccourci(C3) tour(C3);
angle(C4);
    
building(D1);
angle(D2);
building(D3);
building(D4);    
    
// ici c'est la fin !
} // fin de union()
} // fin de translate()