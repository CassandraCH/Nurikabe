class PartieTuto < Partie
  private_class_method :new
  attr_accessor :grille, :progression, :senarios

  #ceer une partie en mode survie
  def PartieTuto.creer(grille, parametres, sauvegardes)
    new(grille, parametres, sauvegardes)
  end

  def initalize()
    super(grille, parametres, sauvegardes)
  end

  #Tire lla prochaine grille
  def grilleSuivante()
    return @grilleBase
    #redef
  end

  def getMode()
    return Mode::TUTORIEL
  end
end
