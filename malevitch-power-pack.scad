// Malevitch Power Pack
// Empiler des formes pour construire un quartier suprématiste


$vpr = [ 55.00, 0.00, 25.00 ]; // rotation de la vue par défaut
$vpt = [ 2.11, -2.02, 11.62 ]; // translation de la vue par défaut
$vpd = 190;

tailledebloc=15; // taille de nos immeubles
    
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
		cube(tailledebloc);
		translate([tailledebloc*0.66,tailledebloc/3,tailledebloc/3]){
			cube([tailledebloc/3,tailledebloc,tailledebloc]);
		}}}}

module tour(etape){
translate(lespositions[etape]){
	union() {
		cube(tailledebloc);
		translate([tailledebloc/6,tailledebloc/6,tailledebloc]){
		cube([tailledebloc*0.66,tailledebloc*0.66,tailledebloc*0.66]);
		}}}}
        
module fleche(etape){
translate(lespositions[etape]){
	union() {
		cube([tailledebloc,tailledebloc,tailledebloc*0.66]);
        
		translate([tailledebloc/6,tailledebloc/6,tailledebloc*0.66])
        {cube([tailledebloc*0.66,tailledebloc*0.66,tailledebloc*0.66]);}
        
       translate([tailledebloc/3,tailledebloc/3,tailledebloc])
        {cube([tailledebloc*0.33,tailledebloc*0.33,tailledebloc*1.5]);}
        }}}

translate([ -tailledebloc*3, -tailledebloc*2, 0 ]){ // recentrage
union() {
// faites la liste de vos immeubles ici. 
// (ils sont dans un Union pour devenir un seul bloc)


fleche(1);
angle(2);
angle(3);
angle(4);
tour(5);
tour(6);
angle(7);
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