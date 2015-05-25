#blackjacktealeaf


def calculate_total(cards) 
# [['H', '3'], ['S','Q'],.. ]
  arr = cards.map{|e| e[1]}
    
  total = 0
  arr.each do |value|
  	if value == "A"
  		total += 11
  	elsif value.to_i == 0 # j, q k
  	  total +=  10
  	else
  		total += value.to_i
  	end
  end

# correct for aces

  arr.select{|e| e == "A"}.count.times do
  total -= 10 if total > 21
  end

 total
end

# Begin Game

puts "Welcome to blackjack!"
puts " "

suits = ['Heart', 'Diamonds', 'Spades', 'Clubs']
cards = ['2','3','4','5','6','7','8','9','10','J','Q','K','A']

deck = suits.product(cards)
deck.shuffle!



#Deal cards

mycards = []
dealercards = []

mycards << deck.pop
dealercards << deck.pop
mycards << deck.pop
dealercards << deck.pop
 


dealertotal = calculate_total(dealercards)
mytotal = calculate_total(mycards)
# Show Cards

puts "Dealer has: #{dealercards[0]} and #{dealercards[1]}, for a total of #{dealertotal}"
puts ""
puts "You have: #{mycards[0]} and #{mycards[1]} for a total of #{mytotal}"
puts ""


# Player turn
if mytotal == 21
	puts "You hit blackjack, You Win!"
	exit
end

while mytotal < 21
  puts "What do you do? 1) hit 2) stay"
  hit_or_stay = gets.chomp
  
  if !['1','2'].include?(hit_or_stay)
  	puts "Error: You must select 1 or 2"
  	next 
  end

  if hit_or_stay == "2"
  	puts "You chose to stay"
	 break
  end

#hit
  new_card = deck.pop
  puts "Card to player: #{new_card}"
  mycards << new_card
  mytotal = calculate_total(mycards)
  puts "you total is now: #{mytotal}"

  if mytotal == 21
  	puts "Boom. You hit blackjack!"
  	exit
  elsif mytotal > 21
  	puts "Busted! You are over 21"
  	exit
  end
end	

# dealer turn

if dealertotal == 21
	puts "Sorry the dealer hit blackjack, You lose."
	exit


while dealertotal < 17
	#hit
	new_card = deck.pop
	puts " Dealing the new card for dealer: #{new_card}"
	dealercards << new_card
	dealertotal = calculate_total(dealercards)
	puts "Dealer total is now: #{dealertotal}"
end

if dealertotal ==21
	puts "Sorry the dealer hit blackjack, You lose!"
	exit

elsif dealertortal > 21 
  puts "Congratulations, dealer busted! You win" 
  exit
 end

end

 #  compare hands

 puts "Dealers card"
 dealercards.each do |card|
 	puts "=> #{card}"
 	end

 	puts "your cards:"

 mycards.each do |card|
 puts "=> #{card}" 
end

puts ""

if dealertotal = mytotal
	puts "Sorry dealer won"
elsif dealertotal < mytotal
	puts "Congrats, you win"
else
	puts "its a tie!"
end


exit

