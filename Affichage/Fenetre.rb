require 'gtk3'
require './../Parametres/Parametre.rb'
require './../Parametres/Langue.rb'
require './../Sauvegarde/Sauvegardes.rb'
require './../Sauvegarde/SauvegardeGrille.rb'

# Classe abstraite qui gere l'interface
# DESIGN PATTERN SINGLETON
class Fenetre

    @@window = nil 
    @@cssProviderDarkMode = Gtk::CssProvider.new; @@cssProviderDarkMode.load(path: "style_dark.css")
    @@lg = nil

    ## METHODE D'INITIALISATION
    private
    def initialize()
        @@window = Gtk::Window.new()
        @@window.set_default_size(745,850);     @@window.set_width_request(745);    @@window.set_height_request(850);   @@window.set_resizable(false) #WINDOW PARAMS
        @@window.signal_connect("destroy") { Fenetre.exit } ## EXIT SIGNAL     
        @@window.set_window_position(Gtk::WindowPosition::CENTER_ALWAYS)

        @@header = Gtk::HeaderBar.new
        @@header.show_close_button = true;      @@header.name = "headerbar" #FOR CSS
        @@header.title = "Nurikabe"     ;       @@header.subtitle = "-"
        @@window.titlebar = @@header #ADD HEADER

        Sauvegardes.creer("../Sauvegarde/save.dump")


        SauvegardeGrille.creer("../Sauvegarde/grilles1.dump")
        #TMP TO ADD GRILLES
 ##       SauvegardeGrille.getInstance.ajouterGrille( Grille.creer( SauvegardeGrille.getInstance.getNombreGrille + 1 ,
 ##       [
 ##   [Case.creer(Couleur::BLANC, 0, 0) ,Case.creer(Couleur::ILE_4, 1, 0),Case.creer(Couleur::NOIR, 2, 0),Case.creer(Couleur::ILE_5, 3, 0), Case.creer(Couleur::BLANC, 4, 0),Case.creer(Couleur::ILE_5, 5, 0), Case.creer(Couleur::BLANC, 6, 0),Case.creer(Couleur::ILE_5, 7, 0), Case.creer(Couleur::BLANC, 8, 0),Case.creer(Couleur::ILE_5, 9, 0)],
 ##   [Case.creer(Couleur::BLANC, 0, 1) ,Case.creer(Couleur::ILE_4, 1, 1),Case.creer(Couleur::NOIR, 2, 1),Case.creer(Couleur::ILE_5, 3, 1), Case.creer(Couleur::BLANC, 4, 1),Case.creer(Couleur::ILE_5, 5, 1), Case.creer(Couleur::BLANC, 6, 1),Case.creer(Couleur::ILE_5, 7, 1), Case.creer(Couleur::BLANC, 8, 1),Case.creer(Couleur::ILE_5, 9, 1)],
 ##   [Case.creer(Couleur::BLANC, 0, 2) ,Case.creer(Couleur::ILE_4, 1, 2),Case.creer(Couleur::NOIR, 2, 2),Case.creer(Couleur::ILE_5, 3, 2), Case.creer(Couleur::BLANC, 4, 2),Case.creer(Couleur::ILE_5, 5, 2), Case.creer(Couleur::BLANC, 6, 2),Case.creer(Couleur::ILE_5, 7, 2), Case.creer(Couleur::BLANC, 8, 2),Case.creer(Couleur::ILE_5, 9, 2)],
 ##   [Case.creer(Couleur::BLANC, 0, 3) ,Case.creer(Couleur::ILE_4, 1, 3),Case.creer(Couleur::NOIR, 2, 3),Case.creer(Couleur::ILE_5, 3, 3), Case.creer(Couleur::BLANC, 4, 3),Case.creer(Couleur::ILE_5, 5, 3), Case.creer(Couleur::BLANC, 6, 3),Case.creer(Couleur::ILE_5, 7, 3), Case.creer(Couleur::BLANC, 8, 3),Case.creer(Couleur::ILE_5, 9, 3)],
 ##   [Case.creer(Couleur::BLANC, 0, 4) ,Case.creer(Couleur::ILE_4, 1, 4),Case.creer(Couleur::NOIR, 2, 4),Case.creer(Couleur::ILE_5, 3, 4), Case.creer(Couleur::BLANC, 4, 4),Case.creer(Couleur::ILE_5, 5, 4), Case.creer(Couleur::BLANC, 6, 4),Case.creer(Couleur::ILE_5, 7, 4), Case.creer(Couleur::BLANC, 8, 4),Case.creer(Couleur::ILE_5, 9, 4)],
 ##   [Case.creer(Couleur::BLANC, 0, 5) ,Case.creer(Couleur::ILE_4, 1, 5),Case.creer(Couleur::NOIR, 2, 5),Case.creer(Couleur::ILE_5, 3, 5), Case.creer(Couleur::BLANC, 4, 5),Case.creer(Couleur::ILE_5, 5, 5), Case.creer(Couleur::BLANC, 6, 5),Case.creer(Couleur::ILE_5, 7, 5), Case.creer(Couleur::BLANC, 8, 5),Case.creer(Couleur::ILE_5, 9, 5)],
 ##   [Case.creer(Couleur::BLANC, 0, 6) ,Case.creer(Couleur::ILE_4, 1, 6),Case.creer(Couleur::NOIR, 2, 6),Case.creer(Couleur::ILE_5, 3, 6), Case.creer(Couleur::BLANC, 4, 6),Case.creer(Couleur::ILE_5, 5, 6), Case.creer(Couleur::BLANC, 6, 6),Case.creer(Couleur::ILE_5, 7, 6), Case.creer(Couleur::BLANC, 8, 6),Case.creer(Couleur::ILE_5, 9, 6)],
 ##   [Case.creer(Couleur::BLANC, 0, 7) ,Case.creer(Couleur::ILE_4, 1, 7),Case.creer(Couleur::NOIR, 2, 7),Case.creer(Couleur::ILE_5, 3, 7), Case.creer(Couleur::BLANC, 4, 7),Case.creer(Couleur::ILE_5, 5, 7), Case.creer(Couleur::BLANC, 6, 7),Case.creer(Couleur::ILE_5, 7, 7), Case.creer(Couleur::BLANC, 8, 7),Case.creer(Couleur::ILE_5, 9, 7)],
 ##   [Case.creer(Couleur::BLANC, 0, 8) ,Case.creer(Couleur::ILE_4, 1, 8),Case.creer(Couleur::NOIR, 2, 8),Case.creer(Couleur::ILE_5, 3, 8), Case.creer(Couleur::BLANC, 4, 8),Case.creer(Couleur::ILE_5, 5, 8), Case.creer(Couleur::BLANC, 6, 8),Case.creer(Couleur::ILE_5, 7, 8), Case.creer(Couleur::BLANC, 8, 8),Case.creer(Couleur::ILE_5, 9, 8)],
 ##   [Case.creer(Couleur::BLANC, 0, 9) ,Case.creer(Couleur::ILE_4, 1, 9),Case.creer(Couleur::NOIR, 2, 9),Case.creer(Couleur::ILE_5, 3, 9), Case.creer(Couleur::BLANC, 4, 9),Case.creer(Couleur::ILE_5, 5, 9), Case.creer(Couleur::BLANC, 6, 9),Case.creer(Couleur::ILE_5, 7, 9), Case.creer(Couleur::BLANC, 8, 9),Case.creer(Couleur::ILE_5, 9, 9)]                
##]) )

 ##       puts SauvegardeGrille.getInstance.getNombreGrille
 ##       SauvegardeGrille.getInstance.sauvegarder( "../Sauvegarde/grilles1.dump" )

   
        

        Langue.creer("../Parametres/fr.txt")
        @@lg = Langue.getInstance()

        provider = Gtk::CssProvider.new
        provider.load(path: "style.css")
        Gtk::StyleContext.add_provider_for_screen(Gdk::Screen.default,provider, Gtk::StyleProvider::PRIORITY_APPLICATION)
        Parametre.initialiseToi

        Fenetre.set_modeSombre( Sauvegardes.getInstance.getSauvegardeParametre.modeSombre? )
    end

    ## INITALISE UNE SEUL FOIS UNE FENETRE
    def self.initialiseToi()
        puts @@window
        if @@window == nil 
            new()
        else
            puts "Window allready initalize"
        end
    end


    ## SHOW ALL SUR WINDOW
    def self.show_all()
        if @@window == nil 
            puts "Fenetre non initaliser"
        else
            @@window.show_all
        end 
    end

    ## CHANGER LE SOUS TITRE DE LA FENETRE
    def self.set_subtitle(subtitle)
        @@window.titlebar.subtitle  = subtitle
    end

    ## AJOUTER UN ELEMENT A LE FENETRE
    def self.add(obj)
        @@window.add(obj)
    end

    ## SUPPRIMER UN ELEMENT A LE FENETRE
    def self.remove(obj)
        @@window.remove(obj)
    end

    
    ## DELETE ALL CHILD EXCEPT HEADERBAR
    def self.deleteChildren()
        i = 0
        while @@window.children.length > 1
            if( @@window.children[i] == @@window.titlebar )
                i += 1
            end
            @@window.remove( @@window.children[i] )
        end
    end

    def self.set_modeSombre(statut)
        provider = Gtk::CssProvider.new
        if statut 
            Gtk::StyleContext.add_provider_for_screen(Gdk::Screen.default,@@cssProviderDarkMode, Gtk::StyleProvider::PRIORITY_APPLICATION)
        else
            Gtk::StyleContext.remove_provider_for_screen(Gdk::Screen.default,@@cssProviderDarkMode)
        end
    end

    ## SE QUITTER
    def self.exit()
        # FAIRE DES TRUCS 
        Sauvegardes.getInstance.sauvegarder(nil)
        Gtk.main_quit
    end

=begin

    # Methode pour creer une fenetre
    def Fenetre.creer(title)
       new(title)
    end

    # Methode privee pour l'initialisation
    def initialize(title)

        @application = Gtk::Window.new(title)
        @application.set_default_size(745,671)
        @application.set_height_request(790)
        @application.set_width_request(745)
        @application.set_resizable(false)
        @application.set_window_position(Gtk::WindowPosition::CENTER_ALWAYS)
        # HEADERBAR
        @header = Gtk::HeaderBar.new
        @header.show_close_button = true
        @header.name = "headerbar"
        @header.subtitle = "t4est"
        @application.titlebar = @header
        @application.title = title

        listenerQuitter
        provider = Gtk::CssProvider.new
        provider.load(path: "style.css")
        Gtk::StyleContext.add_provider_for_screen(Gdk::Screen.default,provider, Gtk::StyleProvider::PRIORITY_APPLICATION)
        @@window = @application
    end

        # Methode qui permet d'ouvrir la fenetre
    def ouvrir()
        @application.show_all
    end

    # Methode qui permet de fermer la fenetre
    def listenerQuitter()
        @application.signal_connect('destroy'){
            Gtk.main_quit()
        }
    end
=end

end

################## INITALISATION DE LA FENETRE ###################################
Fenetre.initialiseToi()
Parametre.initialiseToi()