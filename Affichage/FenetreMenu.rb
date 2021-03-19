load "Fenetre.rb"
load "../Partie/Mode.rb"
load "../Partie/Difficulte.rb"
require "gtk3"

Gtk.init

# Classe qui gere la fenetre du menu
class FenetreMenu < Fenetre

    # Methode privee pour l'initialisation
   def initialize(title)
        super(title)
        @viewOne = creerViewOne()
        @viewTwo = creerViewTwo()
        @viewThree = creerViewThree()
    end

    # Methode qui permet de quitter l'application
    def detruire()
        puts "Fin de l'application"
        Gtk.main_quit()
    end

    # Methode d'affichage
    def afficheToi()
        # creation de la box principale
        @mainBox = Gtk::Box.new(:vertical, 0)

       # creation du label pour le titre
        titre = Gtk::Label.new()
        titre.set_markup("<span weight = 'ultrabold' size = '100000' >Nurikabe</span>")
        setmargin(titre,0,0,70,70)
        @mainBox.pack_start(titre)

        # ajout des 3 vues à la fenêtre
        @mainBox.pack_start(@viewOne)
        @mainBox.pack_start(@viewTwo)
        @mainBox.pack_start(@viewThree)

        # quitter quand la fenetre est detruite
        @application.signal_connect("destroy") { detruire() }

        @application.add(@mainBox)
        self.ouvrir()

        # cacher les vues 2 et 3 par defaut
        @viewTwo.hide()
        @viewThree.hide()
    end

    # Methode qui permet de creer la vue 1
    def creerViewOne()
        box = Gtk::Box.new(:vertical, 10)

        # creation de la grille avec les boutons de modes
        modes = Gtk::Grid.new()
        setmargin(modes,0,15,70,70)

        # creation des boutons de mode de jeu
        btnLibre = Gtk::Button.new()
        setBold(btnLibre,"Libre")

        btnContre = Gtk::Button.new()
        setBold(btnContre,"Contre-la-montre")

        btnSurvie = Gtk::Button.new()
        setBold(btnSurvie,"Survie")

        # gestion des évènements
        btnLibre.signal_connect("clicked") do
            puts "click libre"
            @viewOne.set_visible(false)
            @viewTwo.set_visible(true)
            @mode = Mode::LIBRE
        end
        btnContre.signal_connect("clicked") do
            puts "click contre-la-montre"
            @viewOne.set_visible(false)
            @viewTwo.set_visible(true)
            @mode = Mode::CONTRE_LA_MONTRE
        end
        btnSurvie.signal_connect("clicked") do
            puts "click survie"
            @viewOne.set_visible(false)
            @viewTwo.set_visible(true)
            @mode = Mode::SURVIE
        end

        # attachement des boutons de mode de jeu
        modes.attach(btnLibre, 0, 0, 1, 1)
        modes.attach(btnContre, 1, 0, 1, 1)
        modes.attach(btnSurvie, 2, 0, 1, 1)
        modes.set_column_homogeneous(true)
        box.pack_start(modes)

        # ajout du bouton de chargement de sauvegarde + classement
        btnSauvegarde = Gtk::Button.new(:label => "Charger une sauvegarde")
        btnSauvegarde.set_height_request(60)
        setmargin(btnSauvegarde,0,15,70,70)

        btnClassement = Gtk::Button.new(:label => "Classement")
        btnClassement.set_height_request(60)
        setmargin(btnClassement,0,15,70,70)

        box.pack_start(btnSauvegarde)
        box.pack_start(btnClassement)

        # ajout des boutons du bas
        ajouterBtnBas(box)
        return box
    end

    # Methode qui permet de creer la vue 2
    def creerViewTwo()
        box = Gtk::Box.new(:vertical, 10)
        boxNiv = Gtk::Box.new(:vertical, 10)
        # creation de la grille avec les boutons de modes
        niveaux = Gtk::Grid.new()
        setmargin(niveaux,0,15,70,70)

        # creation des boutons de choix de niveaux
        btnFacile = Gtk::Button.new()
        setBold(btnFacile,"Facile")

        btnMoyen = Gtk::Button.new()
        setBold(btnMoyen,"Moyen")

        btnDifficile = Gtk::Button.new()
        setBold(btnDifficile,"Difficile")

        btnRetour = Gtk::Button.new()
        setBold(btnRetour,"Retour")

        # gestion des évènements
        btnFacile.signal_connect("clicked") do
            puts "click facile"
            @viewTwo.set_visible(false)
            @viewThree.set_visible(true)
            @difficulte = Difficulte::FACILE
        end
        btnMoyen.signal_connect("clicked") do
            puts "click moyen"
            @viewTwo.set_visible(false)
            @viewThree.set_visible(true)
            @difficulte = Difficulte::MOYEN
        end
        btnDifficile.signal_connect("clicked") do
            puts "click difficile"
            @viewTwo.set_visible(false)
            @viewThree.set_visible(true)
            @difficulte = Difficulte::DIFFICILE
        end
        btnRetour.signal_connect("clicked") do
            puts "retour clique"
            @viewTwo.set_visible(false)
            @viewOne.set_visible(true)
        end

        # attachement des boutons de choix de niveaux
        niveaux.attach(btnFacile, 0, 0, 1, 1)
        niveaux.attach(btnMoyen, 1, 0, 1, 1)
        niveaux.attach(btnDifficile, 2, 0, 1, 1)
        niveaux.attach(btnRetour, 3, 0, 1, 1)
        niveaux.set_column_homogeneous(true)
        boxNiv.pack_start(niveaux)
        box.pack_start(boxNiv)

        # ajout du bouton de chargement de sauvegarde + classement
        btnSauvegarde = Gtk::Button.new(:label => "Charger une sauvegarde")
        btnSauvegarde.set_height_request(60)
        btnClassement = Gtk::Button.new(:label => "Classement")
        btnClassement.set_height_request(60)
        box.pack_start(btnSauvegarde)
        box.pack_start(btnClassement)

        # ajout des boutons du bas
        ajouterBtnBas(box)
        return box
    end

    # Methode qui permet de creer la vue 3
    def creerViewThree()
        box = Gtk::Box.new(:vertical, 10)
        # creation de la grille avec les boutons de modes
        btnLancement = Gtk::Button.new(:label => "Lancer une partie")
        box.pack_start(btnLancement, :expand => true, :fill => true)

        # ajout du bouton de chargement de sauvegarde + classement
        btnSauvegarde = Gtk::Button.new(:label => "Charger une sauvegarde")
        btnSauvegarde.set_height_request(60)
        btnClassement = Gtk::Button.new(:label => "Classement")
        btnClassement.set_height_request(60)
        box.pack_start(btnSauvegarde, :expand => true, :fill => true)
        box.pack_start(btnClassement, :expand => true, :fill => true)

        # ajout des boutons du bas
        ajouterBtnBas(box)

        return box
    end

    # Methode qui permet d'ajouter les boutons 'parametres', 'a propos' et 'quitter'
    def ajouterBtnBas(box)
        grilleBas = Gtk::Grid.new()
        setmargin(grilleBas,15,0,70,70)

        # creation des boutons
        btnParam = Gtk::Button.new(:label => "Paramètres")
        btnParam.set_height_request(60)
        btnAPropos = Gtk::Button.new(:label => "A propos")
        labelBtnQuit = Gtk::Label.new()

        labelBtnQuit.set_markup("<span foreground='#a4a400000000' >Quitter</span>");
        btnQuit = Gtk::Button.new()
        btnQuit.add(labelBtnQuit)
        btnQuit.signal_connect("clicked"){ detruire() }

        # attachement des boutons
        grilleBas.attach(btnParam, 0, 0, 1, 1)
        grilleBas.attach(btnAPropos, 1, 0, 1, 1)
        grilleBas.attach(btnQuit, 2, 0, 1, 1)

        grilleBas.set_column_homogeneous(true)
        box.pack_start(grilleBas, :expand => true, :fill => true)
    end

    # Methode qui renvoie le mode choisi par l'utilisateur
    def getMode()
        return @mode
    end

    # Methode qui renvoie le niveau de difficulte choisi par l'utilisateur
    def getDifficulte()
        return @difficulte
    end

    # Methode qui renvoie la grille choisie par l'utilisateur
    def listenerChoixGrille()
        #
    end

    # Methode qui permet d'ouvrir la fenetre des parametres
    def listenerOuvrirOption()

    end

    # Methode qui permet d'ouvrir la fenetre 'A propos'
    def listenerOuvrirAPropos()
        box = Gtk::Box.new(:vertical,10)

        btnPrecedent = Gtk:Button.new(:label => "Precedent")

        headbar = Gtk::Headerbar.new()
        scroll = Gtk::ScrolledWindow.new()
        aPropos = Gtk::TextView.new()
        texte = Gtk::TextBuffer.new()

        box.pack_start(btnPrecedent)
        box.pack_start(headbar)
        box.pack_start(scroll)
        scroll.add(aPropos)

    end

    # Methode qui permet de quitter la fenetre de menu
    def listenerQuitter()

    end

    def setmargin( obj , top, bottom, left, right)
        obj.set_margin_top(top);
        obj.set_margin_bottom(bottom)
        obj.set_margin_left(left)
        obj.set_margin_right(right)
        return nil
    end

    # Methode qui permet de mettre en gras un label
    def setBold(btn, nom)
        label = Gtk::Label.new()
        label.set_markup("<span weight = 'ultrabold'>"+nom+"</span>")
        btn.add(label)
        btn.set_height_request(70)
    end
end



##################### CODE DE TEST DE LA CLASSE #####################

fenetreMenu = FenetreMenu.creer("Nurikabe")
fenetreMenu.afficheToi()


Gtk.main