    // Malevitch Power Pack
// Empiler des formes pour construire un quartier suprématiste


$vpt = [ 0, 0, 12 ]; // translation de la vue par défaut
$vpr = [ 60, 0.00, 45 ]; // rotation de la vue par défaut
$vpd = 190;

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

lespositions = [A1, A2, A3, A4, B1, B2, B3, B4, C1, C2, C3, C4, D1, D2, D3, D4]; // itérable

lespositionslabels = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]; // les noms des cases itérable

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


module grid(lespositions){
    
    for (position = [lespositions[0]:lespositions[15]]) {
        translate(position);
        square (un_bloc, un_bloc);
        text(lespositionslabels[position]);
        }
    }

module cubevide (size) {


    borders= [un_bloc*0.10, un_bloc*0.10, un_bloc*0.10];
    
    innerSide= size-(2*borders);

    difference () {

        cube (size);

        translate ([-size[0]/2,borders[1],borders[2]])
        cube ([size[0]*2, innerSide[1], innerSide[2]]);
        
         translate ([borders[0],-size[1]/2, borders[2]])
        cube ([innerSide[0], , size[1]*2, innerSide[2]]);
        
        translate ([borders[0],borders[1],-size[2]/2])
        cube ([innerSide[0], innerSide[1], size[2]*2]);


} 
    }

module tourvide (position){
translate(position){
    
    decalage = lesdecalages [position[1]%4];
    
	union() {
		cubevide([un_bloc,un_bloc,sixieme_bloc]); // bas
        
		translate([sixieme_bloc,sixieme_bloc,sixieme_bloc])
            translate(decalage/3)
            cubevide([deuxtiers_bloc,deuxtiers_bloc,un_bloc]); // milieu
        
       translate([tiers_bloc,tiers_bloc,un_bloc])
           translate(decalage)
           cubevide([tiers_bloc,tiers_bloc,un_bloc*1.25]); // haut 
       }}}
       
       
module buildingvide(position){
translate(position){
    
    hauteur = ((position[1]%3)+2)/2;
    
	union() {
        
        
		translate([sixieme_bloc,tiers_bloc,un_bloc]) // haut
		cubevide([deuxtiers_bloc,tiers_bloc,tiers_bloc*hauteur]);
		
        
        cubevide([un_bloc, deuxtiers_bloc, un_bloc]); // bas
       }}}
       
      
 module anglevide(position){
translate(position){
	union() {
        
        cubevide([demi_bloc,un_bloc,tiers_bloc]); // bas 
        
        translate([tiers_bloc,tiers_bloc,0]) // haut 
            cubevide([tiers_bloc,un_bloc,un_bloc]);
          
        
          translate([demi_bloc,demi_bloc,0]) // droite
            cubevide([demi_bloc,,tiers_bloc,tiers_bloc]);
          
          
        }}}      

translate([ -un_bloc*3, -un_bloc*2, 0 ]){ // recentrage
    
grid(lespositions);

union() {
    
    
// faites la liste de vos immeubles ici. 
// (ils sont dans un Union pour devenir un seul bloc)


//raccourci (b2) tour(b2);
tourvide(a1);  
tourvide(a2);
tourvide(A2);
anglevide(A3);
tourvide(A4);
 
buildingvide(B1);
buildingvide(B2);
tourvide(B3);
anglevide(B4);
    
anglevide(C1);
buildingvide(C2);
raccourci(C3) tourvide(C3);
anglevide(C4);
    
buildingvide(D1);
anglevide(D2);
buildingvide(D3);
buildingvide(D4);    


    
// ici c'est la fin !
} // fin de union()
} // fin de translate()