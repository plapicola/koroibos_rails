class OlympianIndexSerializer
   class << self
      def format_all(olympians)
         {olympians: olympians.map {|olympian| format_one(olympian)}}
      end

      def format_one(olympian)
         {
            name: olympian.name,
            team: olympian.team.name,
            age: olympian.age,
            sport: olympian.sport.name,
            total_medals_won: olympian.total_medals_won
         }
      end
   end
end
