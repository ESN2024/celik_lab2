<h1> ESN11 - lab2 </h1>

<h2> Objectif </h2>

L'objectif consiste à mettre en œuvre un compteur à 3 chiffres avec affichage 7 segments, accompagné d'un timer utilisant une interruption avec une période de 1 seconde.

<h2> Introduction </h2>

Le présent rapportexpose la mise en place d'un compteur progressant de 0 à 999, faisant appel à une conversion BCD en langage C, un fichier VHDL pour la représentation binaire sur afficheur 7 segments, ainsi qu'un timer programmé pour incrémenter le compteur toutes les secondes au moyen d'une interruption.
<h2> Création d'un système NIOS II basique </h2>

<h3> Schéma fonctionnel </h3>

<h3> Platform Designer </h3>

![image](https://github.com/ESN2024/celik_lab2/assets/117944504/543999b4-c638-4b7e-b1ff-b0edcc8c647c)

Suite à la création d'un nouveau projet sur Quartus, procéder à l'ouverture du Platform Designer afin d'intégrer tous les éléments requis.

Les composants à ajouter comprennent :

- RAM0 : Une RAM offrant une capacité de stockage de 40 Mo.
- SEG1 : Représente la sortie Qsys du premier compteur 4 bits.
- SEG2 : Représente la sortie Qsys du deuxième compteur 4 bits.
- SEG3 : Représente la sortie Qsys du troisième compteur 4 bits.
- Timer_0 : Configurer la période de ce dernier à 1 seconde.

<h3> Quartus </h3>

![image](https://github.com/ESN2024/celik_lab2/assets/117944504/eec8e1b0-1633-4086-bb7f-87e7aa76abe4)

Le système est composé de trois parties distinctes :

- celik_lab2_sys.qsys

- BCD_7_SEG.vhd : Ce fichier VHDL prend en entrée un signal de 4 bits (compteurs) et génère en sortie une correspondance de 7 bits pour l'activation des segments du compteurs. Il est à noter que le 7 segments réagit au niveau logique "0", s'allumant lorsque ce niveau est détecté.

- celik_lab2.vhd : Ce fichier de niveau supérieur (top-level) définit les entrées et les sorties, avec trois sorties de 7 bits chacune correspondant aux segments des 3 compteurs.

<h3> Flux logiciel du NIOS II </h3>

Ouvrir un terminal NIOS II et générer le BSP en lien avec les spécifications de la carte DE-10 :

![image](https://github.com/ESN2024/celik_lab2/assets/117944504/ebe5bc0d-e87a-4f5e-ae38-c82db2e1db4e)

Générer le Makefile du projet :

![image](https://github.com/ESN2024/celik_lab2/assets/117944504/5282a446-79ec-4683-b2ca-8feee2d1e756)

Tout est prêt, nous allons maintenant écrire notre code C qui fonctionne sur notre propre processeur. Ne pas oublier de mettre à jour le Makefile avec le code source. La compilation se fait sur un shell Nios II :

![image](https://github.com/ESN2024/celik_lab2/assets/117944504/3909ccea-5a81-4376-acb3-03f39afe25dd)

Le programme généré peut être chargé et exécuté dans le softcore du FPGA :

![image](https://github.com/ESN2024/celik_lab2/assets/117944504/cf975bec-1dbf-421a-ab79-c2db97d53171)

<h3> Language C </h3>

![image](https://github.com/ESN2024/celik_lab2/assets/117944504/85f65d89-ff4a-4552-b933-2e618be9ea0b)

Le code C est structuré en deux sections distinctes :

- **irq_handler_timer()** : Cette routine gère l'interruption du timer. À chaque déclenchement de la routine, le drapeau d'interruption est réinitialisé. Elle génère une conversion binaire vers BCD en fonction d'un compteur de 16 bits (i), séparant le résultat en trois variables de 8 bits représentant l'unité, la dizaine et la centaine du compteur. Cette routine est déclenchée à chaque interruption, se produisant toutes les secondes.

- **main()** : Le programme principal est conçu pour enregistrer les interruptions du timer. En outre, il initialise le compteur à zéro. Ensuite, le programme entre dans une boucle infinie.

<h3> Résultats </h3>

Vérification du fonctionnement du compteur sans l'utilisation du timer (cette étape vise à confirmer que le compteur atteint la valeur 999 avant de retourner à 0) :

Validation du bon fonctionnement global du système :

<h3> Conclusion </h3>

