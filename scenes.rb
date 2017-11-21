class Scene
    
  def enter()
    puts "This scene is not yet configured. Subclass it and implement enter()."
    exit(1)
  end
  
end

class Detention < Scene
    
  @@quips = [
    "You've been sent to Mr. Reynolds office with a detention. Don't worry, they
        don't actually do anything to you - it's just a formality.",
     "Just wait until you're parents find out you got a detention. Tsk tsk.",
     "Uh oh, guess you gotta spend 5 mins cleaning the chem lab now! ¯\_(ツ)_/¯"
  ]

  def enter()
    puts @@quips[rand(0..(@@quips.length - 1))]
    exit(1)
  end
end

class English < Scene

  def enter()
    puts "Your name is Myles Robinson. You are a 16-year-old African-American male who attends"
    puts "The Browning School on New York City's Upper East Side. It's first period and you"
    puts "have English. You're wearing a Thrasher hoodie and a pair of Nike Prestos (customized" 
    puts "by $cumbag $ean). Mr. Pingrisani Ye walks in the room and you already know it's about"
    puts "to be on scene.\n\n"
    puts "'Mr. Robinson,' Pingrisani says.\n\n"
    puts "'Oh here we go...', you mumble.\n\n"
    puts "'Was there a change in the dress code that I'm not aware of? I can't seem think of any"
    puts "other reason why you'd be out of uniform.'\n\n"
    puts "What is your response?\n"
    puts "1. Boi, it is 8:30 in the morning. I'm really not tryna do this now.\n"
    puts "2. Not all of us wear the same dusty jacket and tie everyday.\n"
    puts "3. Sorry about that. It won't happen again.\n"
    print "> "

    action = $stdin.gets.chomp

    if action == "1"
      puts ""
      return 'detention'

    elsif action == "2"
      puts ""
      return 'detention'

    elsif action == "3"
      puts ""
      return 'advisory'

    else
      puts "DOES NOT COMPUTE!"
      return 'english'
    end
  end
end

class Advisory < Scene

  def enter()
    puts "SOMETHING SOMETHING SOMETHING Ms. Ryan"
    print "> "

    action = $stdin.gets.chomp

    if action == "throw the bomb"
      puts ""
      return 'detention'

    elsif action == ""
      return 'precalc'
    else
      puts "DOES NOT COMPUTE!"
      return "advisory"
    end
  end
end

class Precalc < Scene

  def enter()
    puts "SOMETHING SOMETHING SOMETHING Ms. Resika"
    code = "#{rand(1..9)}#{rand(1..9)}#{rand(1..9)}"
    puts "The code is " + code
    print "[keypad]> "
    guess = $stdin.gets.chomp
    guesses = 0

    while guess != code && guesses < 10
      puts "BZZZZEDDD!"
      guesses += 1
      print "[keypad]> "
      guess = $stdin.gets.chomp
    end

    if guess == code
        puts ""
        return 'hallway'
    else
        puts ""
        return 'detention'
    end
  end
end

class Hallway < Scene

  def enter()
    puts "SOMETHING SOMETHING SOMETHING Mr. Klein"

    good_pod = rand(1..5)
    puts good_pod
    print "> "
    guess = $stdin.gets.chomp.to_i

    if guess != good_pod
      puts "You jump into pod %s and hit the eject button." % guess
      puts "The pod escapes out into the void of space, then"
      puts "implodes as the hull ruptures, crushing your body"
      puts "into jam jelly."
      return 'detention'
    else
      puts "You jump into pod %s and hit the eject button." % guess
      puts "The pod easily slides out into space heading to"
      puts "the planet below.  As it flies to the planet, you look"
      puts "back and see your ship implode then explode like a"
      puts "bright star, taking out the Gothon ship at the same"
      puts "time.  You won!"
      return 'finished'
    end
  end
end

class Finished < Scene
  def enter()
    puts "You won! Good job."
  end
end