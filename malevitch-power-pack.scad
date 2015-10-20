    // Malevitch Power Pack
// Empiler des formes pour construire un quartier suprématiste


$vpr = [ 55.00, 0.00, 25.00 ]; // rotation de la vue par défaut
$vpt = [ 2.11, -2.02, 11.62 ]; // translation de la vue par défaut
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

// la position de chaque immeuble sur la grille du quartier :
    
lespositions = [
[ tailledebloc*1, 0, 0 ] // l'index 0 et 1 sont identiques pour pouvoir commencer à 1

,[ tailledebloc*1, 0, 0 ] // position 1 décalé d'une taille de bloc: tableau plus lisible
,[ tailledebloc*2, 0, 0 ]
,[ tailledebloc*3, 0, 0 ]
,[ tailledebloc*4, 0, 0 ]

,[ tailledebloc*1, tailledebloc*1, 0 ] // nous passons à la ligne de bloc suivante
,[ tailledebloc*2, tailledebloc*1, 0 ]
,[ tailledebloc*3, tailledebloc*1, 0 ]
,[ tailledebloc*4, tailledebloc*1, 0 ] // ceci est l'etape 8…

,[ tailledebloc*1, tailledebloc*2, 0 ]
,[ tailledebloc*2, tailledebloc*2, 0 ]
,[ tailledebloc*3, tailledebloc*2, 0 ]
,[ tailledebloc*4, tailledebloc*2, 0 ] // ceci est l'etape 12…

,[ tailledebloc*1, tailledebloc*3, 0 ]
,[ tailledebloc*2, tailledebloc*3, 0 ]
,[ tailledebloc*3, tailledebloc*3, 0 ]
,[ tailledebloc*4, tailledebloc*3, 0 ] // ceci est l'etape 16 !!

];

echo (lespositions);

module angle(etape){
translate(lespositions[etape]){
	union() {
        
        cube([demi_bloc,un_bloc,tiers_bloc]); // bas 
        
        translate([tiers_bloc,tiers_bloc,sixieme_bloc]){ // haut 
            cube([tiers_bloc,,un_bloc,un_bloc]);
          } 
        
          translate([demi_bloc,demi_bloc,0]){ // droite
            cube([demi_bloc,,tiers_bloc,tiers_bloc]);
          } 
          
        }}}

module tour(etape){
translate(lespositions[etape]){
	union() {
		cube(un_bloc);
		translate([sixieme_bloc,sixieme_bloc,un_bloc]){
		cube([deuxtiers_bloc,deuxtiers_bloc,deuxtiers_bloc]);
		}}}}
        
module fleche(etape){
translate(lespositions[etape]){
	union() {
		cube([un_bloc,un_bloc,deuxtiers_bloc]); // bas
        
		translate([sixieme_bloc,sixieme_bloc,deuxtiers_bloc])
        {cube([deuxtiers_bloc,deuxtiers_bloc,deuxtiers_bloc]);}
        
       translate([tiers_bloc,tiers_bloc,un_bloc])
        {cube([tiers_bloc,tiers_bloc,un_bloc*1.5]);}
        }}}

translate([ -un_bloc*3, -un_bloc*2, 0 ]){ // recentrage
union() {
// faites la liste de vos immeubles ici. 
// (ils sont dans un Union pour devenir un seul bloc)


angle(1);
tour(2);
angle(3);
fleche(4);
tour(5);
tour(6);
fleche(7);
tour(8);
angle(9);
tour(10);
fleche(11);
angle(12);
tour(13);
angle(14);
tour(15);
tour(16);
    
    
// ici c'est la fin !
} // fin de union()
} // fin de translate()