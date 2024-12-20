# PKI
Mise en place d’un système de génération automatique (scripts shells) d’une PKI privée avec certificat racine et certificats par serveur/service.


Pour lancer la génération d'une PKI privée, il faut : 

1 - Ouvrir un terminal dans le dossier du projet PKI.

2 - Donner des droits aux fichiers : setup_pki.sh | create_ca.sh | create_cert.sh 
    Utiliser la commande "chmod +x <nom du fichier>" (voir screenshot 1 et 2)

3 - Executer différents fichiers : 

        1 - ./setup_pki.sh
        2 - ./create_ca.sh
        3 - ./create_cert.sh <nom de domain ou adresse ip> (voir screenshot 3)
        4 - Pour voir des vérifications : ./tests.sh <arg 1> <arg 2> <arg 3> (voir    screenshot 3) 


