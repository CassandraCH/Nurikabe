require_relative './Fenetre.rb'

##
# Classe qui gère la création de l'interface de la fenêtre de sélection
# Herite de la classe Fenetre
class FenetreSelection < Fenetre
    ##
    # Détermine si la case Facile est cochée
    @@easyActivate = true

    ##
    # Détermine si la case Moyen est cochée
    @@mediumActivate = true

    ##
    # Détermine si la case Difficile est cochée
    @@hardActivate = true

    ##
    # Methode pour l'initialisation
    def initialize()
        self
    end

    ##
    # Afficher la Fenetre de Selection de grille
    def self.afficheToi( lastView )
        Fenetre.set_subtitle(@@lg.gt("SELECTION_MODE_LIBRE"))
        Fenetre.add( FenetreSelection.new().creationInterface( lastView ) )
        Fenetre.show_all
        return self
    end

    ##
    # Crée l'interface de la Selection de grille
    def creationInterface( lastView )

        box = Gtk::Box.new(:vertical)

        #Bouton retour

        btnBoxH = Gtk::ButtonBox.new(:horizontal)
        btnBoxH.layout = :start
        btnBack = Gtk::Button.new(:label => @@lg.gt("RETOUR"))
        btnBack.name = "btnBack"
        btnBack.signal_connect("clicked") { Fenetre.remove(box) ; lastView.afficheToi( nil ) ; }
        lastView == nil ? btnBack.set_sensitive(false) : btnBack.set_sensitive(true)
        setmargin(btnBack,5,5,5,0)
        btnBoxH.add(btnBack)
        box.add(btnBoxH)

        #Separateur
        box.add( Gtk::Separator.new(:vertical) )

        # Box vertical pour stocker les deux box interne
        vBox = Gtk::Box.new(:vertical)

        # Box qui comprends 3 checkBox
        hBoxSelector = Gtk::Box.new(:horizontal)
        hBoxSelector.set_homogeneous(true)

        checkButtonEasy = Gtk::CheckButton.new(@@lg.gt("FACILE"))
        checkButtonEasy.halign = :end
        checkButtonEasy.active = @@easyActivate
        hBoxSelector.add( checkButtonEasy )
        checkButtonMedium = Gtk::CheckButton.new(@@lg.gt("MOYEN"))
        checkButtonMedium.halign = :center
        checkButtonMedium.active = @@mediumActivate
        hBoxSelector.add( checkButtonMedium )
        checkButtonHard = Gtk::CheckButton.new(@@lg.gt("DIFFICILE"))
        checkButtonHard.halign = :start
        checkButtonHard.active = @@hardActivate
        hBoxSelector.add( checkButtonHard )
        setmargin(checkButtonEasy, 10,10,0,0)


        vBox.add( hBoxSelector )


        # ScrollView qui contient les grilles
        scroll = Gtk::ScrolledWindow.new();
        scroll.set_size_request(200, 660)

        boxGrille = ajouterGrille(box)
        scroll.add_with_viewport( boxGrille  )

        checkButtonEasy.signal_connect("clicked") {
            @@easyActivate = !@@easyActivate
            Fenetre.remove(box)
            Fenetre.add(creationInterface( lastView))
            Fenetre.show_all
        }
        checkButtonMedium.signal_connect("clicked") {
            @@mediumActivate = !@@mediumActivate
            Fenetre.remove(box)
            Fenetre.add(creationInterface( lastView ))
            Fenetre.show_all
        }
        checkButtonHard.signal_connect("clicked") {
            @@hardActivate = !@@hardActivate
            Fenetre.remove(box)
            Fenetre.add(creationInterface( lastView))
            Fenetre.show_all
        }

        vBox.add( scroll )

        box.add(vBox)#ADD
        return box
    end


    ##
    # Ajoute une grille a la liste de grilles sélectionnables
    def ajouterGrille(box )
        vBoxGrille = Gtk::Box.new(:vertical , 20)

        tabPartieEnCours = Sauvegardes.getInstance.getSauvegardePartie.getListPartieLibreEnCours

        if @@easyActivate
            vBoxGrille.add( titleLabel( @@lg.gt("FACILE") )  )
            i = 1
            while ( i <= SauvegardeGrille.getInstance.getNombreGrille / 3 )
                if i == SauvegardeGrille.getInstance.getNombreGrille / 3
                    vBoxGrille.add( generateHbox( generateFrame( SauvegardeGrille.getInstance.getGrilleAt(i) , box , i , tabPartieEnCours[i] ) , nil ) )
                else
                    vBoxGrille.add( generateHbox( generateFrame(SauvegardeGrille.getInstance.getGrilleAt(i) , box , i , tabPartieEnCours[i]) ,generateFrame(SauvegardeGrille.getInstance.getGrilleAt(i + 1) , box , i+1 ,tabPartieEnCours[i+1] )) )
                    i+=1
                end
                i+=1
            end
            if(@@mediumActivate || @@hardActivate)
                vBoxGrille.add( Gtk::Separator.new(:horizontal) )
            end
        end


        if @@mediumActivate
            vBoxGrille.add( titleLabel( @@lg.gt("MOYEN") )  )
            i = 1 + SauvegardeGrille.getInstance.getNombreGrille / 3
            while ( i <= SauvegardeGrille.getInstance.getNombreGrille / 3 * 2 )
                if i == SauvegardeGrille.getInstance.getNombreGrille / 3 * 2
                    vBoxGrille.add( generateHbox( generateFrame( SauvegardeGrille.getInstance.getGrilleAt(i) , box , i , tabPartieEnCours[i] ) , nil ) )
                else
                    vBoxGrille.add( generateHbox( generateFrame(SauvegardeGrille.getInstance.getGrilleAt(i) , box , i , tabPartieEnCours[i]) ,generateFrame(SauvegardeGrille.getInstance.getGrilleAt(i + 1) , box , i+1 ,tabPartieEnCours[i+1] )) )
                    i+=1
                end
                i+=1
            end
            if(@@hardActivate)
                vBoxGrille.add( Gtk::Separator.new(:horizontal) )
            end
        end

        if @@hardActivate

            vBoxGrille.add( titleLabel( @@lg.gt("DIFFICILE") )  )
            i = 1 + SauvegardeGrille.getInstance.getNombreGrille / 3 * 2
            while ( i <= SauvegardeGrille.getInstance.getNombreGrille )
                if i == SauvegardeGrille.getInstance.getNombreGrille
                    vBoxGrille.add( generateHbox( generateFrame( SauvegardeGrille.getInstance.getGrilleAt(i) , box , i , tabPartieEnCours[i] ) , nil ) )
                else
                    vBoxGrille.add( generateHbox( generateFrame(SauvegardeGrille.getInstance.getGrilleAt(i) , box , i , tabPartieEnCours[i]) ,generateFrame(SauvegardeGrille.getInstance.getGrilleAt(i + 1) , box , i+1 ,tabPartieEnCours[i+1] )) )
                    i+=1
                end
                i+=1
            end
        end
        setmargin(vBoxGrille,15,15,0,0  )

        return vBoxGrille
    end

    ##
    # Met un texte au format titre (augmente sa taille)
    def titleLabel(unLabel)
        label = Gtk::Label.new()
        label.set_markup("<span size='25000' >" + unLabel.to_s + "</span>")
        return label
    end

    ##
    # Generer un conteneur horizontal
    private
    def generateHbox( grille1, grille2)
        hBox = Gtk::Box.new(:horizontal,15)
        hBox.set_height_request(200)
        hBox.add( grille1 )
        if grille2 != nil
            hBox.add( grille2 )
            hBox.set_homogeneous(true)
        end
        setmargin(hBox,0,0,15,15)
        return hBox
    end

    ##
    # Génère une frame qui contient le numéro de grille, la grille, et une image si une sauvegarde existe
    def generateFrame( uneGrille , mainBox , numero , enCours )
        btnFrame = Gtk::Button.new()
        btnFrame.name = "bg-FenetreSelection"

        box = Gtk::Box.new(:vertical)


        hBoxTitre = Gtk::Box.new(:horizontal)
        hBoxTitre.set_homogeneous(true)

        title = Gtk::Label.new()
        if enCours
            title.set_markup("<span size='25000' >#" + uneGrille.numero.to_s + "</span>")
        else
            title.set_markup("<span size='25000' >#" + uneGrille.numero.to_s + "</span>")
        end
        title.name = "bg-FenetreSelection-title"
        title.halign = :start
        setmargin(title,5,5,0,0)


        hBoxTitre.add(title)

        if(enCours)
            pixbuf = GdkPixbuf::Pixbuf.new(:file => "enCours.png")
            pixbuf = pixbuf.scale_simple(37, 37, :bilinear)

            img = Gtk::Image.new(:pixbuf => pixbuf)
            img.set_margin_right(13)

            img.halign = :end
            hBoxTitre.add(img)
        end


        box.add(hBoxTitre)


        box.add(  setmargin( creeGrille( uneGrille) , 0 , 5 , 0 , 0 ) )

        btnFrame.add( box )

        btnFrame.signal_connect("clicked") {
            Fenetre.remove(mainBox);
            indice = Sauvegardes.getInstance.getSauvegardePartie.getIndicePartieLibreSauvegarder(numero)

            if indice != -1
                FenetrePartie.afficheToiChargerPartie( FenetreSelection ,  indice   )
            else
                FenetrePartie.afficheToiSelec( FenetreSelection , Partie.creer(  SauvegardeGrille.getInstance.getGrilleAt(numero) )  )
            end
        }

        return btnFrame
    end

    ##
    # Ajoute un bouton avec une icône renseignée en paramètre
    private
    def generateBtnWithIcon(iconName)
        btn = Gtk::Button.new()
        image = Gtk::Image.new(:icon_name => iconName, :size => :LARGE_TOOLBAR)
        btn.add(image)
        return btn
    end

    ##
    # Methode qui cree une grille à afficher dans la selection
    def creeGrille( uneGrille )
        # Frame exterieur pour que les rebord et la meme epaisseur
        maFrame = Gtk::Frame.new()
        maFrame.name = "fenetreGrille"
        # grid pour placer les cellules
        maGrille = Gtk::Grid.new()
        maGrille.set_height_request(300);   maGrille.set_width_request(300)
        maGrille.set_row_homogeneous(true);     maGrille.set_column_homogeneous(true)

        maGrilleDeJeu = uneGrille.tabCases
        ## boucle pour créer les cellules
        for ligne in 0...maGrilleDeJeu.size
            for colonne in 0...maGrilleDeJeu.size
                cell =  creeCelluleGrille(maGrilleDeJeu[colonne][ligne].couleur )
                maGrille.attach( cell , ligne,colonne,1,1)
            end
        end

        ## ajout de la grille a la frame
        maFrame.add(maGrille)


        return maFrame
    end

    ##
    # Crée une cellule destinée a la grille
    private
    def creeCelluleGrille(color)
        if color <= 0
            color = ""
        elsif color >= 10
            color = "+"
        end
        btn = Gtk::Label.new(color.to_s)
        btn.name = "little"
        return btn
    end

    ##
    # Met des marges à un objet
    private
    def setmargin( obj , top, bottom, left, right)
        obj.set_margin_top(top)
        obj.set_margin_bottom(bottom)
        obj.set_margin_left(left)
        obj.set_margin_right(right)
        return obj
    end

end
