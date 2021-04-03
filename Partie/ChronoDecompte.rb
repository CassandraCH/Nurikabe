class ChronoDecompte < Chrono
    CHRONO_BASE_DECOMPTE = 60*5 #5mins

    def ChronoDecompte.creer()
      new()
    end

    def initialize()
      super()
      @time = CHRONO_BASE_DECOMPTE
    end

    def top()
      if(!@pause)
        ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        @time -= (ending - @starting)
        @starting = ending
      end
      return estNul?()
    end

    def ajouterMalus(n)
      @time -= n
    end
end
