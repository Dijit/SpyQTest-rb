#!/usr/bin/env ruby

#BBC Basic has everything as a global variable, and multiple namespaces per variable.
$Ns = ['VIS','Spy','Junior Spy','Spying Assistent', 'Trainee Spy']

$W = ''
$D = $Ns.count - 1

def currentStatus
    puts "You are " + $W + " a " + $Ns[$D]
    10.times do |j|
        if $Na[j] > 0
            puts "#{j+1}: #{$Na[j]}"
        else
            puts "#{j+1}:"
        end
    end
end

def getSlot
    currentStatus
    puts 'Where will you put ' + $M.to_s
    while true
        $Ps = gets.chomp
        p = $Ps.to_i
        if $Ps == 'D' && $D != $G
            $G+=1
            return 'D'
        elsif $Ps=='D'
            puts "You can't do that"
        elsif p < 1 || p > 10
            puts 'Position is invalid'
	    elsif $Na[p-1] > 0
	        puts "Slot " + $Ps.to_s + " is full, please try again"
        else
            return p-1
        end
    end 
end

def playGame
    $Na = [0] * 10 # Line 10+70, for loop initialising array with 0.
    $G = 0
    i = 0
	while i < 10 
	
	    $M = rand(1..99)
	    $Ps = getSlot
	    if $Ps == 'D'
	        next
	    end
	    # Add the random number to the user specified section of the array.
	    #assert $M  at $Na[$Ps]
        $Na[$Ps] = $M
	    $F = 0
	    ($Ps...10).each do |l|
	        if $Na[l] < $M && $Na[l] != 0
	            $F = 1
                break
	        end
	    end
	    (0...$Ps).each do |l|
	        if $Na[l] > $M && $Ns[l] != 0
	            $F=1
                break
	        end
	    end
        break if $F == 1
        i+=1
	end
    if $F == 1
        puts "Wrong! not good enough"
        puts "You are still a " + $Ns[$D]
        $W = "still"

    else
    $D-=1
    if $D < 1
        puts 'Terrific, you have reached'
        puts 'the grade of SUPER SPY!'
        exit
    end
    puts 'Well done, go to grade ' + $D.to_s
    puts 'You are ' + $W + ' ' + $Ns[$D]
    $W = ''
    end
    puts 'Do you want to play again?'
    $PlayAgain = gets.chomp.downcase
    if $PlayAgain == 'y'
        playGame
    end
end

playGame
