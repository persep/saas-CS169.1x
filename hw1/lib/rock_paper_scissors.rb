class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    strategy1 = player1[1]
    strategy2 = player2[1]
    moves = ['P', 'R', 'S']
    if !moves.include?(strategy1) || !moves.include?(strategy2)
    	raise RockPaperScissors::NoSuchStrategyError, "Strategy must be one of R,P,S"
    end
    
    return player1 if strategy1 == strategy2
    
    return player1 if strategy1 == 'R' && strategy2 == 'S'
    return player1 if strategy1 == 'S' && strategy2 == 'P'
    return player1 if strategy1 == 'P' && strategy2 == 'R'

    return player2 if strategy2 == 'R' && strategy1 == 'S'
    return player2 if strategy2 == 'S' && strategy1 == 'P'
    return player2 if strategy2 == 'P' && strategy1 == 'R'

  end

  def self.tournament_winner(tournament)
  	if(tournament[0][0].is_a? String)
  		RockPaperScissors.winner(tournament[0],tournament[1])
  	else
  		RockPaperScissors.tournament_winner(
  			[RockPaperScissors.tournament_winner(tournament[0]),
  			RockPaperScissors.tournament_winner(tournament[1])]
  			)
  	end
  end

end

a = 
[
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
]

b = 
	[
		[ ["Armando", "P"], ["Dave", "S"] ],
		[ ["Richard", "R"],  ["Michael", "S"] ],
	]

c =
	[ ["Armando", "P"], ["Dave", "S"] ]


puts RockPaperScissors.tournament_winner(a) == ['Richard', 'R']
puts RockPaperScissors.tournament_winner(b) == ['Richard', 'R']
puts RockPaperScissors.tournament_winner(c) == ["Dave", "S"]