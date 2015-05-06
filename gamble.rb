#!/usr/bin/env ruby

load 'animation.rb'

class Reel
  ARRAY_MAX = 10
  CREDITS = 5

	def initialize
    @credit = 0
		@reel1 = %w[black7 cherry orange red7 bell plum black7 bell cherry orange]
		@reel2 = %w[cherry red7 black7 bell orange plum cherry black7 bell orange]
		@reel3 = %w[bell cherry plum black7 red7 black7 orange bell orange cherry]
	end

	def start
    system('clear')
    response = nil
		until response == 'quit'
      puts '---------------------------------------------------------------'
      puts '                    Insert Credit to Play'
      puts '          Type \'help\' for information on how to play.'
      puts '               Recommended screensize => 100x61'
      puts '---------------------------------------------------------------'
      puts ''
      print '> '
      response = gets.chomp

      case response
      when 'play'
        if credit > 0
          game
        else
          'You do not have any credit to play.'
        end
      when '50p'
        @credit = @credit+CREDITS
        game
      when '1pound'
        @credit = @credit+(CREDITS*2)
        game
      when 'credits', 'credit'
        puts ''
        puts "Credits: #{@credit}"
        puts ''
      when 'help'
        puts ''
        puts 'Commands: play, 50p, 1pound, credits, help, quit'
        puts 'play     -  Will play the game with your stored credit.'
        puts '50p      -  Adds 5 Credits to the game.'
        puts '1pound   -  Adds 10 Credits to the game.'
        puts 'credits   -  Will display how many credits you have.'
        puts 'help     -  This list of instructions.'
        puts 'quit     -  Quits the game.  WARNING! You will lose all you credit.'
        puts ''
      when 'quit'
        # Do Nothing // Quits Game
      else
        puts 'Incorrect Input'
      end
    end
	end

  def game
    puts ''
    puts 'CREDITS ADDED! READY TO PLAY!'
    puts ''
    response = nil
    until @credit == 0 || response == 'bank'
      puts 'To spin the reels, type \'p\' or \'play\' and press Enter.'
      puts 'Type \'bank\' to go back to main menu.'
      puts ''
      print '> '
      response = gets.chomp
      case response
      when 'p', 'play'
        spin
        if @r1=='red7' && @r2=='red7' && @r3=='red7'
          puts '=-=-=-=-=-=-=-=-=-=-='
          puts '      JACKPOT!!!'
          puts '=-=-=-=-=-=-=-=-=-=-='
          sleep 1
          nyancat
          @credit = @credit+200
        elsif @r1 == @r2 && @r1 == @r3
          puts ''
          puts 'You\'ve Won!!!'
          puts ''
          @credit = @credit+20
          puts "Credits: #{@credit}"
          puts ''
        else
          puts ''
          puts 'Sorry, Try Again'
          puts ''
          @credit-=1
          puts "Credits: #{@credit}"
          puts ''
        end
      when 'bank'
        # Do Nothing // Returns to Menu
      when 'cheat'
        @credit = @credit+20
        puts "U WOT M8! >:("
        puts @credit
      else
        puts 'Incorrect Input'
      end
    end
  end

  def nyancat
    3.times do
      Nyancat.new.nyancat0
      Nyancat.new.nyancat1
      Nyancat.new.nyancat2
      Nyancat.new.nyancat3
      Nyancat.new.nyancat4
      Nyancat.new.nyancat5
      Nyancat.new.nyancat6
      Nyancat.new.nyancat7
      Nyancat.new.nyancat8
      Nyancat.new.nyancat9
      Nyancat.new.nyancat10
      Nyancat.new.nyancat11
    end
  end
  def random_pick
    rand(ARRAY_MAX)
  end 

	def spin
    10.times do
      sleep 0.1
      system('clear')
      for i in 1..3
        instance_variable_set("@r#{i}", instance_variable_get("@reel#{i}")[random_pick])
      end
      puts "----------------------------"
      puts ''
  		puts "  #{@r1}   #{@r2}   #{@r3}"
      puts ''
      puts "----------------------------"
    end
  end
end

Reel.new.start


