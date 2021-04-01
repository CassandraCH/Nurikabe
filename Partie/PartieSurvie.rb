require_relative "PartieMalus.rb"
class PartieSurvie < PartieMalus

    #ceer une partie en mode survie
    def PartieSurvie.creer(grille, parametres, sauvegardes)
      new(grille, parametres, sauvegardes)
    end

    def initialize(grille, parametres, sauvegardes) #Créer une nouvelle partie
      super(grille, parametres, sauvegardes)
      @chrono = ChronoDecompte.creer()
      @chrono.demarrer()
    end

    #Tire lla prochaine grille
    def grilleSuivante()
      return grilleBase
      #redef
    end

    def getMode
      return Mode::SURVIE
    end
end
