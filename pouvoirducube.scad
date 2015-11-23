$vpt = [ 0, 0, 12 ]; // translation de la vue par défaut
$vpr = [ 60, 0.00, 45 ]; // rotation de la vue par défaut
$vpd = 190;

// En dessous je ne modifie que si je comprends ce que je fais,
// et je demande à un animateur de regarder avec moi

O=0;o=O;
C=1;c=C;
V=2;v=V;

X=0;x=X;
Y=1;y=Y;
I=2;i=Y;

touraucentre = O;
tourenlongueur = C;

unseulcoin = y;



taille = 25;
interieur = 10;
hauteur = 30;
base_hauteur = 15;
epaisseur = 0.3;

module base(taille) {
    cube([taille,taille,epaisseur]);
}

module tour(interieur,hauteur,type) {
    if (type==O) {
        translate([(taille-interieur)/2,(taille-interieur)/2,0])
        cube([interieur,interieur,hauteur]);
    }
    if (type==C) {
        translate([(taille-interieur)/2,(taille-interieur)/2,0])
        cube([taille-((taille-interieur)/2),interieur,hauteur]);
    }
    if (type==V) {
        translate([(taille-interieur),0,0])
        cube([interieur,interieur,hauteur]);
    }
}

module moat(interieur,type) {
    if (type==O) {
        translate([(taille-interieur-2)/2,(taille-interieur-2)/2,0])
        cube([interieur+2,interieur+2,base_hauteur]);
    }
    if (type==C) {
        translate([(taille-interieur-2)/2,(taille-interieur-2)/2,0])
        cube([taille,interieur+2,base_hauteur]);
    }
    if (type==V) {
        translate([(taille-interieur)-2,0,0])
        cube([interieur+2,interieur+2,base_hauteur]);
    }
}

module coin(offset_x,offset_y) {
    translate([offset_x,offset_y,0])
    cube([(taille-interieur)/2,(taille-interieur)/2,base_hauteur]);
}

module base(taille,hauteur) {
    cube([taille,taille,hauteur]);
}

module bloc(type,coins,hauteurdelatour, hauteurdelabase) {

    difference() {
        union() {
            base(taille);
            difference() {
                base(taille,min(base_hauteur,hauteurdelabase));
                moat(interieur,type);
            }
            tour(interieur,min(hauteur,hauteurdelatour),type);
        }
        union() {
            if(coins>X) coin(0,0);
            if(coins>Y) coin(taille-(taille-interieur)/2,taille-(taille-interieur)/2);
        }
    }
}

// Ici c'est mon objet à moi: je peux changer les lignes entre
// les parenthèses

bloc(

// Je mets O, C ou V

type = V

,// Je mets X, Y ou I

coins = X

,// La hauteur de ma tour entre 0 et 30 mm

hauteurdelatour = 10

, // La hauteur de ma base entre 0 et 15 mm

hauteurdelabase = 0    

 );
