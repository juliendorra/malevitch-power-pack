// Malevitch Power Pack
// Empiler des formes pour construire un quartier suprématiste

tailledebloc=20; // taille de nos immeubles

// lespositions=[ for (position =[1:tailledebloc:(tailledebloc*8)]) [position, 0, 0] ]; // calculons un tableau des positions de nos blocs

// pour commencer simple, on évite de calculer le tableau des positions…
    
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




union() {
// faites la liste de vos immeubles ici. (ils sont dans un Union pour devenir un seul bloc)

angle(1);
tour(2);
angle(3);
angle(4);
tour(5);
tour(6);
angle(7);
tour(8);
angle(9);
tour(10)
tour(11);
    

// ici c'est la fin !
}
