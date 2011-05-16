# See: http://eli.thegreenplace.net/2010/01/28/generating-random-sentences-from-a-context-free-grammar

module Panini
  module DerivationStrategy

    class DampenedProbabilityProductionChoiceProxy

      def initialize(nonterminal, damping=0.25)
        @nonterminal = nonterminal
        @damping = damping
        @production_counts = @nonterminal.productions.map do
          0
        end
      end

      def initialize_copy(source)  
        super
        @production_counts = @production_counts.map do |production_count|
          production_count
        end
      end

      def production
        i = find_index
        @production_counts[i] += 1
        @nonterminal.productions[i]
      end

      def find_index

        weights = @production_counts.map do |production_count|
          @damping ** production_count
        end

        selector = Kernel::rand() * weights.inject(:+)

        weights.each_with_index do |weight, i|
          selector -= weight
          if selector < 0
            return i
          end
        end

        raise "You shouldn't be able to get here. #{selector} #{@production_counts}"

      end
      private :find_index

      def dump_weights
        puts "production_counts:"
        @weights.each do |weight|
          puts "#{weight} "
        end
      end

    end



    class RandomDampened < Base

      def initialize(grammar, damping = 0.25)
        if (damping <= 0.0) || (damping >= 1.0)
          raise ArgumentError, "The damping factor must be greater than 0.0 and less than 1.0."
        end
        build_production_proxies(grammar, damping)
        super(grammar)
      end

      def build_production_proxies(grammar, damping)
        @production_proxies = {}
        grammar.nonterminals.each do |nonterminal|
          @production_proxies[nonterminal] = DampenedProbabilityProductionChoiceProxy.new(nonterminal, damping)
        end
      end
      private :build_production_proxies

      # TODO Comment. 
      def sentence
        substitute_nonterminal(@grammar.start, @production_proxies, 0)
      end

      def substitute_nonterminal(nonterminal, production_proxies, depth)

        # production_proxies_copy = {}
        #  production_proxies_copy = production_proxies.each do |key, value|
        #    production_proxies_copy[key] = value.dup
        #  end
        #  
        production_proxies_copy = production_proxies.map do |value|
          value.dup
        end
        
        production_proxies_copy[nonterminal].production.flat_map do |term|
          if (term.class == Nonterminal)
            substitute_nonterminal(term, production_proxies_copy, depth + 1)
          else
            term
          end
        end

      end
      private :substitute_nonterminal

    end

  end
end