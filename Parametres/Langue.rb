##
# Classe qui gere les langues
class Langue
    ##
    # nom de la langue
    attr_reader :langues, :langueActuelle

    private_class_method :new

    ##
    # Variable de classe monInstance
    # Représente une instance de Langue
    @@monInstance = nil

    ##
    # Methode qui permet de creer une grille
    def Langue.creer()
        if (@@monInstance == nil)
          @@monInstance = new()
        end

        return @@monInstance
    end

    ##
    # Getter de la variable de classe @@monInstance
    def self.getInstance()
      return @@monInstance
    end

    ##
    # Met à jour la langue du jeu en fonction de l'id de la langue en paramètre
    def utiliserLangue(id)
      @dico = Marshal.load( File.binread(@fichiersLangues[id]) )
      @langueActuelle = id
    end

    ##
    # Methode privee pour l'initialisation
    def initialize()

      @dico = Hash.new
      @dico["IP"] = "IP"
      @dico["CONNECTION"] = "Connection"
      @dico["PORT"] = "Port"
      @dico["HOST"] = "Host"
      @dico["JOIN"] = "Join"
      @dico["CANCEL"] = "Cancel"
      @dico["1V1"] = "1v1"
      @dico["MSG_PERDRE"] = "You lost!\nYour current time is : "
      @dico["MSG_PERDRE_FIN"] = "\nThe opponent finished the grid in : "
      @dico["MESSAGE_DE_VICTOIRE"] = "Congratulations! You've completed the grid!\nYour time is: "
      @dico["MESSAGE_VICTOIRE_SURVIE_DEBUT"] = "Time's up !\nYou have completed "
      @dico["MESSAGE_VICTOIRE_CLM_DEBUT"] = "Congratulations! You've completed the grid!\nYour time is : "
      @dico["MESSAGE_VICTOIRE_CLM_FIN"] = "\nYour stars : "
      @dico["MESSAGE_FIN_TUTORIEL"] = "You have completed the tutorial !"
      @dico["MESSAGE_FIN_1V1"] = "You have won !\nYour time is : "
      @dico["PARTIE_1V1"] = "1v1 game"
      @dico["DECO_MSG"] = "Your opponent has disconnected"
      @dico["UNKNOWN"] = "--Undefined text--"
      @dico["AUCUN_TEMPS"] = "No time"
      @dico["LOCAL_HOST"] = "Localhost"
      @dico["AVANCEMENT_SELF"] = "My advancement :    "
      @dico["AVANCEMENT_ENEMY"] = "Its advancement :    "
      @dico["GRILLE_TERMINEE"] = " finished grid"
      @dico["GRILLES_TERMINEES"] = " finished grids"
      @dico["DETAIL_SCORE"] = "Score details"

      @dico["LIBRE"] = "Free play"
      @dico["CONTRELAMONTRE"] = "Time trial"
      @dico["SURVIE"] = "Survival"
      @dico["TUTORIEL"] = "Tutorial"
      @dico["CLASSEMENT"] = "Ranking"
      @dico["PARAMETRES"] = "Settings"
      @dico["A_PROPOS"] = "About"
      @dico["QUITTER"] = "Quit"
      @dico["FACILE"] = "Easy"
      @dico["MENU"] = "Menu"
      @dico["MOYEN"] = "Medium"
      @dico["DIFFICILE"] = "Hard"
      @dico["MEILLEUR_SCORE"] = "Best Score"
      @dico["ACTUALISER"] = "Update"
      @dico["RETOUR"] = "Back"
      @dico["JEU"] = "Game"
      @dico["UTILISATEUR"] = "User"
      @dico["INTERFACE"] = "Interface"
      @dico["REGLES"] = "Rules"
      @dico["AUDIO"] = "Audio"
      @dico["GRILLE"] = "Grid"
      @dico["PARTIE"] = "Game"
      @dico["AUCUN_RECORD"] = "No record"
      @dico["GRILLES"] = "Grids"
      @dico["MON_SCORE"] = "My time     "
      @dico["CASESGRISES"] = "Grey cells"
      @dico["COMPTEURILOTS"] = "Island counter"
      @dico["AFFICHERPORTER"] = "Island range"
      @dico["MURS2x2"] = "2x2 Walls"
      @dico["SUPPRIMER_SAUVEGARDE_PARTIE_EN_COURS"] = "Delete current game saves"
      @dico["RESET_PARAMETRE"] = "Reset to default settings"
      @dico["MODESOMBRE"] = "Dark mode"
      @dico["CHOISIRLANGUE"] = "Choose language"
      @dico["IMPORTERLANGUE"] = "Import language"
      @dico["SELECTION_MODE_LIBRE"] = "Grid selection"
      @dico["PARTIE_LIBRE"] = "Free play game"
      @dico["PARTIE_CLM"] = "Time trial game"
      @dico["OK"] = "Ok"
      @dico["PARTIE_SURVIE"] = "Survival game"
      @dico["OUI"] = "Yes"
      @dico["NON"] = "No"
      @dico["REPRENDRE_SAUVEGARDE"] = "Do you want to resume your saving ?"
      @dico["PARTIE_TUTORIEL"] = "Tutorial"
      @dico["ILE_1"] = "There is a cell next to an island with a value of 1, so it cannot be white"
      @dico["ILE_ADJACENTE"] = "There is a cell next to two islands, so it cannot be white otherwise the two islands would touch"
      @dico["ILE_ADJACENTE_DIAG"] ="There is a cell next to two islands, so it cannot be white otherwise the two islands would touch"
      @dico["ILE_COMPLETE"] = "There is a cell next to a completed island, so it cannot be white otherwise the island would be too big"
      @dico["CASE_ISOLEE"] = "There is an isolated cell: there is no path connecting it to an island "
      @dico["EXPENSION_MUR"] = "There is a cell that has to be expanded to prevent a wall from being isolated"
      @dico["CONTINUITE_MUR"] = "There is a cell that has to be expanded to prevent two walls from being separated"
      @dico["EXPENSION_ILE"] = "There is a cell that has to be expanded for an island to develop"
      @dico["EXPENSION_2D"] = "There is an almost finished island that can only expand in two direcitons, both having an adjacent cell in common that cannot be white"
      @dico["EXPENSION_CACHEE"] = "There is a cell that has to be expanded for an island to develop enough"
      @dico["EVITER_2x2"] = "There is almost a 2x2 wall block, so the remaining cell cannot be black"
      @dico["CONTINUITE_ILE"] = "A white cell not connected to an island has to go through a cell to get to the island"
      @dico["ILE_INATTEIGNABLE"] = "A cell is too far from any island and cannot be reached"
      @dico["MSG_REGLE_ILE"] = "An island of size 4 must contain 4\nwhite cells surrounded by a black wall"
      @dico["MSG_REGLE_MUR"] = "The black wall must surround the\nislands and be continuous"
      @dico["MSG_REGLE_2x2"] = "The black wall cannot form 2x2 blocks"
      @dico["APROPOSCONTENT"] = "
Nurikabe (ぬりかべ) is a Japanese puzzle in the style of sudoku.


This game, sometimes called \"island in the stream\", is a binary solving puzzle.


One can decide, for each cell, if it is white or black according to very precise rules.


The puzzle is solved on a rectangular grid of cells, some of which contain numbers.


Two cells are connected if they are adjacent vertically or horizontally,
but not diagonally.


The white cells constitute the islands while the connected black cells constitute the
the river.


The player scores cells without numbers that he is sure belong to an island with one point.
belong to an island.



This application was developed within the framework of a university project by :


BOUHANDI Asmae
CHAUMULON Cassandra
EL KANDOUSSI Adnan
LECOMTE Hugo
MAHI Samy
MARIN Timothée
RICHEFEU Mattéo
STER Maxime

      "

      tmpSaver("../Parametres/EN_en.dump")

      @dico = Hash.new
      @dico["IP"] = "IP"
      @dico["CONNECTION"] = "Conexión"
      @dico["PORT"] = "Puerto"
      @dico["HOST"] = "Alojar"
      @dico["JOIN"] = "Unete"
      @dico["CANCEL"] = "Cancelar"
      @dico["1V1"] = "1v1"
      @dico["MSG_PERDRE"] = "¡Has perdido!\nTu hora actual es : "
      @dico["MSG_PERDRE_FIN"] = "\nEl oponente terminó la parrilla en : "
      @dico["MESSAGE_DE_VICTOIRE"] = "¡Felicidades! ¡Has completado la parrilla!\nTu tiempo es : "
      @dico["MESSAGE_VICTOIRE_SURVIE_DEBUT"] = "¡Tiempo arriba!\nHa completado "
      @dico["MESSAGE_VICTOIRE_CLM_DEBUT"] = "¡Felicidades! ¡Has completado la parrilla!\nTu tiempo es : "
      @dico["MESSAGE_VICTOIRE_CLM_FIN"] = "\nTus estrellas : "
      @dico["MESSAGE_FIN_TUTORIEL"] = "¡Has completado el tutorial!"
      @dico["MESSAGE_FIN_1V1"] = "¡Has ganado!\nTu tiempo es : "
      @dico["PARTIE_1V1"] = "Juego 1v1"
      @dico["DECO_MSG"] = "Tu oponente se ha desconectado"
      @dico["UNKNOWN"] = "--Texto no definido--"
      @dico["AUCUN_TEMPS"] = "Sin tiempo"
      @dico["LOCAL_HOST"] = "Huésped local"
      @dico["AVANCEMENT_SELF"] = "Mi avance :    "
      @dico["AVANCEMENT_ENEMY"] = "Su avance :    "
      @dico["GRILLE_TERMINEE"] = " rejilla terminada"
      @dico["GRILLES_TERMINEES"] = " rejillas terminadas"
      @dico["DETAIL_SCORE"] = "Detalles de la puntuación"

      @dico["MESSAGE_DE_VICTOIRE"] = "¡Felicidades! Has ganado!"
      @dico["LIBRE"] = "Juego libre"
      @dico["CONTRELAMONTRE"] = "Contrarreloj"
      @dico["SURVIE"] = "Supervivencia"
      @dico["TUTORIEL"] = "Tutorial"
      @dico["CLASSEMENT"] = "Clasificación"
      @dico["PARAMETRES"] = "Configuración"
      @dico["A_PROPOS"] = "Sobre"
      @dico["QUITTER"] = "Salir"
      @dico["FACILE"] = "Fácil"
      @dico["MENU"] = "Menú"
      @dico["MOYEN"] = "Medio"
      @dico["DIFFICILE"] = "Difícil"
      @dico["MEILLEUR_SCORE"] = "Mejor puntuación"
      @dico["ACTUALISER"] = "Actualización"
      @dico["RETOUR"] = "Volver"
      @dico["JEU"] = "Juego"
      @dico["UTILISATEUR"] = "Usuario"
      @dico["INTERFACE"] = "Interfaz"
      @dico["REGLES"] = "Reglas"
      @dico["AUDIO"] = "Audio"
      @dico["GRILLE"] = "Rejilla"
      @dico["PARTIE"] = "Juego"
      @dico["AUCUN_RECORD"] = "Sin registro"
      @dico["GRILLES"] = "Rejillas"
      @dico["MON_SCORE"] = "Mi tiempo  "
      @dico["CASESGRISES"] = "Celdas grises"
      @dico["COMPTEURILOTS"] = "Contador de islas"
      @dico["AFFICHERPORTER"] = "Rango de la isla"
      @dico["MURS2x2"] = "Muros 2x2"
      @dico["SUPPRIMER_SAUVEGARDE_PARTIE_EN_COURS"] = "Borrar partidas guardadas actuales"
      @dico["RESET_PARAMETRE"] = "Restablecer la configuración por defecto"
      @dico["MODESOMBRE"] = "Modo oscuro"
      @dico["CHOISIRLANGUE"] = "Elegir idioma"
      @dico["IMPORTERLANGUE"] = "Importar idioma"
      @dico["SELECTION_MODE_LIBRE"] = "Selección de cuadrícula"
      @dico["PARTIE_LIBRE"] =  "Juego libre"
      @dico["PARTIE_CLM"] = "Juego contrarreloj"
      @dico["OK"] = "Ok"
      @dico["PARTIE_SURVIE"] = "Juego de supervivencia"
      @dico["OUI"] = "Sí"
      @dico["NON"] = "No"
      @dico["REPRENDRE_SAUVEGARDE"] = "¿Quiere reanudar su ahorro?"
      @dico["PARTIE_TUTORIEL"] = "Tutorial"
      @dico["ILE_1"] = "Hay una casilla adyacente a una isla con un valor de 1 que por lo tanto no puede ser blanco"
      @dico["ILE_ADJACENTE"] = "Hay una casilla adyacente a dos islas, por lo que no puede ser blanco, de lo contrario las dos islas quedarían atascadas"
      @dico["ILE_ADJACENTE_DIAG"] ="Hay una casilla adyacente a dos islas, por lo que no puede ser blanco, de lo contrario las dos islas quedarían atascadas"
      @dico["ILE_COMPLETE"] = "Hay una casilla adyacente a una isla completa, por lo que no puede ser blanco, de lo contrario la isla se desbordará"
      @dico["CASE_ISOLEE"] = "Hay una casilla aislada: no hay un camino que la lleve a una isla"
      @dico["EXPENSION_MUR"] = "Hay un espacio de expansión obligatorio para evitar que un muro quede aislada"
      @dico["CONTINUITE_MUR"] = "Se requiere un espacio de expansión para evitar que dos muros se separen"
      @dico["EXPENSION_ILE"] = "Se requiere un espacio de expansión para que una isla se desarrolle"
      @dico["EXPENSION_2D"] = "Hay una isla casi terminada que solo puede expandirse en dos direcciones, las cuales tienen un cuadrado adyacente en común que por lo tanto no puede ser blanco."
      @dico["EXPENSION_CACHEE"] = "Se requiere un espacio de expansión para que una isla crezca lo suficiente"
      @dico["EVITER_2x2"] = "Hay un bloque de muro de casi 2x2, por lo que el cuadrado restante no puede ser negro"
      @dico["CONTINUITE_ILE"] = "Un casilla blanco que no está conectado a una isla pasa necesariamente por una casilla para llegar a la isla"
      @dico["ILE_INATTEIGNABLE"] = "Una casilla está demasiado lejos de cualquier isla y, por lo tanto, es inalcanzable"
      @dico["MSG_REGLE_ILE"] = "Una isla de tamaño 4 debe constar de 4\ncasillas blancos rodeados de muros negras"
      @dico["MSG_REGLE_MUR"] = "El muro de casillas negros debe rodear las islas y estar intacto"
      @dico["MSG_REGLE_2x2"] = "El muro de casillas negros no debe formar casillas de tamaño 2x2"
      @dico["APROPOSCONTENT"] = "
Nurikabe (ぬりかべ) es un rompecabezas japonés al estilo del sudoku.


Este juego, a veces llamado \"isla en la corriente\", es un rompecabezas de resolución binaria.


Uno puede decidir, para cada celda, si es blanca o negra según reglas muy precisas.


El rompecabezas se resuelve en una cuadrícula rectangular de celdas, algunas de las cuales contienen números.


Dos celdas están conectadas si son adyacentes vertical u horizontalmente,
pero no en diagonal.


Las celdas blancas constituyen las islas, mientras que las celdas negras conectadas constituyen
el río.


El jugador puntúa con un punto las casillas sin números de las que está seguro que pertenecen a una isla.
pertenecen a una isla.



Esta aplicación fue desarrollada en el marco de un proyecto universitario por :


BOUHANDI Asmae
CHAUMULON Cassandra
EL KANDOUSSI Adnan
LECOMTE Hugo
MAHI Samy
MARIN Timothée
RICHEFEU Mattéo
STER Maxime

      "
      tmpSaver("../Parametres/ES_es.dump")


      @dico = Hash.new
      @dico["IP"] = "IP"
      @dico["CONNECTION"] = "Connexion"
      @dico["PORT"] = "Port"
      @dico["HOST"] = "Héberger"
      @dico["JOIN"] = "Rejoindre"
      @dico["CANCEL"] = "Annuler"
      @dico["1V1"] = "1v1"
      @dico["MSG_PERDRE"] = "Vous avez perdu !\nVotre temps actuel est de : "
      @dico["MSG_PERDRE_FIN"] = "\nL'adversaire à fini la grille en : "
      @dico["MESSAGE_DE_VICTOIRE"] = "Félicitations ! Vous avez complété la grille !\nVotre temps est : "
      @dico["MESSAGE_VICTOIRE_SURVIE_DEBUT"] = "Temps écoulé !\nVous avez complété "
      @dico["MESSAGE_VICTOIRE_CLM_DEBUT"] = "Félicitations ! Vous avez complété la grille !\nVotre temps est : "
      @dico["MESSAGE_VICTOIRE_CLM_FIN"] = "\nVos étoiles : "
      @dico["MESSAGE_FIN_TUTORIEL"] = "Vous avez terminé le tutoriel !"
      @dico["MESSAGE_FIN_1V1"] = "Vous avez gagné !\nVotre temps est : "
      @dico["PARTIE_1V1"] = "Partie 1v1"
      @dico["DECO_MSG"] = "Votre adversaire s'est déconnecté"
      @dico["UNKNOWN"] = "--Texte non défini--"
      @dico["AUCUN_TEMPS"] = "Aucun temps"
      @dico["LOCAL_HOST"] = "Hôte local"
      @dico["AVANCEMENT_SELF"] = "Mon avancement :    "
      @dico["AVANCEMENT_ENEMY"] = "Son avancement :    "
      @dico["GRILLE_TERMINEE"] = " grille terminée"
      @dico["GRILLES_TERMINEES"] = " grilles terminées"
      @dico["DETAIL_SCORE"] = "Détails du score"

      @dico["LIBRE"] = "Libre"
      @dico["CONTRELAMONTRE"] = "Contre-La-Montre"
      @dico["SURVIE"] = "Survie"
      @dico["TUTORIEL"] = "Tutoriel"
      @dico["CLASSEMENT"] = "Classement"
      @dico["MENU"] = "Menu"
      @dico["PARAMETRES"] = "Paramètres"
      @dico["A_PROPOS"] = "À Propos"
      @dico["QUITTER"] = "Quitter"
      @dico["FACILE"] = "Facile"
      @dico["MOYEN"] = "Moyen"
      @dico["DIFFICILE"] = "Difficle"
      @dico["MEILLEUR_SCORE"] = "Meilleur Score"
      @dico["ACTUALISER"] = "Actualiser"
      @dico["RETOUR"] = "Retour"
      @dico["JEU"] = "Jeu"
      @dico["UTILISATEUR"] = "Utilisateur"
      @dico["INTERFACE"] = "Interface"
      @dico["REGLES"] = "Règles"
      @dico["AUDIO"] = "Audio"
      @dico["GRILLE"] = "Grille"
      @dico["PARTIE"] = "Partie"
      @dico["AUCUN_RECORD"] = "Aucun record"
      @dico["GRILLES"] = "Grilles"
      @dico["MON_SCORE"] = "Mon temps"
      @dico["CASESGRISES"] = "Cases grises"
      @dico["COMPTEURILOTS"] = "Compteur d'île"
      @dico["AFFICHERPORTER"] = "Portée d'île"
      @dico["MURS2x2"] = "Murs 2x2"
      @dico["SUPPRIMER_SAUVEGARDE_PARTIE_EN_COURS"] = "Supprimer les sauvegardes de parties en cours"
      @dico["RESET_PARAMETRE"] = "Remettre les paramètres par défaut"
      @dico["MODESOMBRE"] = "Mode sombre"
      @dico["CHOISIRLANGUE"] = "Choisir langue"
      @dico["IMPORTERLANGUE"] = "Importer langue"
      @dico["SELECTION_MODE_LIBRE"] = "Selection de grille"
      @dico["PARTIE_LIBRE"] = "Partie libre"
      @dico["PARTIE_CLM"] = "Partie contre-la-montre"
      @dico["OK"] = "Ok"
      @dico["PARTIE_SURVIE"] = "Partie survie"
      @dico["OUI"] = "Oui"
      @dico["NON"] = "Non"
      @dico["REPRENDRE_SAUVEGARDE"] = "Voulez-vous reprendre la sauvegarde ?"
      @dico["PARTIE_TUTORIEL"] = "Tutoriel"
      @dico["ILE_1"] = "Il existe une case adjacente à une île de valeur 1, et qui ne peut donc pas être blanche"
      @dico["ILE_ADJACENTE"] = "Il existe une case adjacente à deux îles, elle ne peut donc pas être blanche sinon les deux îles seraient collées"
      @dico["ILE_ADJACENTE_DIAG"] ="Il existe une case adjacente à deux îles, elle ne peut donc pas être blanche sinon les deux îles seraient collées"
      @dico["ILE_COMPLETE"] = "Il existe une case adjacente à une île complète, elle ne peut donc pas être blanche, sinon l'île déborderait"
      @dico["CASE_ISOLEE"] = "Il existe une case isolée : il n'y a aucun chemin qui la mène vers une île"
      @dico["EXPENSION_MUR"] = "Il existe une case d'expansion obligée pour éviter qu'un mur se retrouve isolé"
      @dico["CONTINUITE_MUR"] = "Il existe une case d'expansion obligée pour éviter que deux murs soient séparés"
      @dico["EXPENSION_ILE"] = "Il existe une case d'expansion obligée pour qu'une île se développe"
      @dico["EXPENSION_2D"] = "Il existe une île presque terminée qui ne peut s'étendre que dans deux direction, les deux ayant une case adjacente en commun qui ne pourra donc pas être blanche"
      @dico["EXPENSION_CACHEE"] = "Il existe une case d'expansion obligée pour qu'une île se dévelope assez"
      @dico["EVITER_2x2"] = "Il y a un presque un bloc de mur 2x2, la case restante ne peut donc pas être noire"
      @dico["CONTINUITE_ILE"] = "Une case blanche qui n'est pas reliée à une île passe nécessairement par une case pour rejoindre l'île"
      @dico["ILE_INATTEIGNABLE"] = "Une case est trop loin de toute île et est donc inatteignable"
      @dico["MSG_REGLE_ILE"] = "Une île de taille 4 doit être constituée de 4\ncases blanches entourées de murs noirs."
      @dico["MSG_REGLE_MUR"] = "Le mur de cases noires doit entourer\nles îles et être ininterrompu"
      @dico["MSG_REGLE_2x2"] = "Le mur de cases noires ne doit pas\nformer de carrés de taille 2x2"
      @dico["APROPOSCONTENT"] = "
Le Nurikabe (ぬりかべ) est un puzzle japonais dans le style du sudoku.


Ce jeu, quelquefois appelé « ilot dans le courant », est un puzzle à résolution binaire.


On peut décider, pour chaque cellule, si elle est blanche ou noir en fonction de règles
bien précises.



Le puzzle se résout sur une grille rectangulaire de cellules, dont certaines contiennent
des nombres.


Deux cellules sont connectées si elles sont adjacentes verticalement ou horizontalement,
mais pas en diagonale.


Les cellules blanches constituent les îlots alors que les cellules noires connectées constituent
le fleuve.


Le joueur marque d'un point les cellules sans numéro dont il est sûr qu'elles appartiennent
à un îlot.



Cette application a été dévelopée dans le cadre d'un projet universitaire par :

BOUHANDI Asmae
CHAUMULON Cassandra
EL KANDOUSSI Adnan
LECOMTE Hugo
MAHI Samy
MARIN Timothée
RICHEFEU Mattéo
STER Maxime

      "
      tmpSaver("../Parametres/FR_fr.dump")

      @langues = ["Français", "English", "Español"]
      @fichiersLangues = ["../Parametres/FR_fr.dump", "../Parametres/EN_en.dump" , "../Parametres/ES_es.dump"]
      @langueActuelle = 0


    end

    ##
    # A COMPLETER
    def tmpSaver (chemin)
      File.open(chemin, "wb") { |f| f.write(Marshal.dump(@dico) ) }
      @dico =  Marshal.load( File.binread(chemin) )
    end

    ##
    # A COMPLETER
    def gt(text)
      if ( @dico[text] == nil )
        return "UNDEF " + text.to_s
      end
      return @dico[text]
    end

    ##
    # Affichage en chaine de caractère du dictionnaire
    def to_s()
      return "#{@dico}"
    end
end