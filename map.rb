module Map

  class Room

    def initialize(name, description)
      @name = name
      @description = description
      @paths = {}
    end

    attr_reader :name
    attr_reader :paths
    attr_reader :description

    def go(direction)
      return @paths[direction]
    end

    def add_paths(paths)
      @paths.update(paths)
    end

  end

  ENGLISH = Room.new("Mr. Pingrisani's English Class",
    """
    <p>Your name is Myles Robinson. You are a 16-year-old African-American male who attends The Browning School on New York City's Upper East Side. It's first period and you have English. You're wearing a Thrasher hoodie and a pair of Nike Prestos (customized by $cumbag $ean). Mr. Pingrisani Ye walks in the room and you already know he's gonna have something to say.</p>

    <p>'Mr. Robinson,' Pingrisani says.</p>
    <p>'Oh here we go...', you mumble.</p>
    <p>'Was there a change in the dress code that I'm not aware of? I can't seem think of any other reason why you'd be out of uniform.'</p>

    <p>What is your response? (Enter a number)</p>
    <ol>
      <li>Boi, it is 8:30 in the morning. I'm really not tryna do this now.</li>
      <li>Not all of us wear the same dusty jacket and tie everyday.</li>
      <li>Sorry about that. It won't happen again.</li>
    </ol>
     """)

  ADVISORY = Room.new("Ms. Bryan's Advisory",
    """
    <p>'Hello, my precious angels,' says the unmistakable voice of Ms. Bryan. As she walks in the room, her eyes lock on you. You nod at her and force a smile.</p>

    <p>'Good morning, Ms. Bryan,' you tell her.</p>

    <p>'Myles...do you want to tell me why you're out of dress code?' she asks.</p>

    <p>What is your response? (Enter a number)</p>
    <ol>
      <li>Not really, no.</li>
      <li>I woke up late and I couldn't find my blazer.</li>
    </ol>
    """)

  MATH = Room.new("Pre-Calculus",
    """
    <p>Your next class is Pre-Calculus with Ms. Razka. As you step into room 202 you are welcomed with a certain musk unlike any other room in the school. You wonder if there's a decomposing body hiding in the closet. As you take your seat in the back of the room, Ms. Razka walks through the door and makes her way to the desk. As she sits down, you both lock eyes. Her eyes widen and a smile begins to stretch across her face.</p>

    <p>'Myles,' she tells you. 'Are we really going to have to do this again?'</p>

    <p>'I don't know, are we?' you reply.</p>

    <p>'I'll tell you what,' she says. 'If you can tell me what the answer to the square root of 1888, rounded to the nearest hundredth, then I'll let you off this one time.'</p>
    """)

  HALLWAY = Room.new("Mr. Clean's Hallway",
    """
    <p>You finally have a free period where you can just relax and not have to worry about teachers. You walk down towards the locker room, since the school doesn't have a senior lounge. Right as you turn the door handle you hear someone clear their throat behind you. You turn around and see Mr. Clean standing in front of you smiling and nodding his head.</p>

    <p>'Dude,' he tells you. 'Why aren't you getting the message? Wear your blazer man!'</p>

    <p>'I'll tell you what. I'm thinking of a number between one and five. If you guess it right, I'll let you off. If you don't, I'm giving you a detention. So?'</p>

    """)

  THE_END_WINNER = Room.new("The End",
    """
    <center>
      <h5>Lol, I'm still giving you a detention.</h5>
      <img src='https://media.giphy.com/media/649rruiSkqnyU/giphy.gif'/><br>
      <p>Mr. Clean has still decided to give you a detention. You must serve the detention after school or you will be given another detention.</p>
    </center>
    """)

  THE_END_LOSER = Room.new("The End",
    """
    <center>
      <h5>Seriously, Dude?</h5>
      <img src='https://media.giphy.com/media/t8YlRWLnICrh6/giphy.gif'/><br>
      <p>Mr. Clean has given you a detention that you must serve after school (or else nothing will happen).</p>
    </center>
    """
    )

  GENERIC_DEATH = Room.new(
    "<p>You've been sent to Mr. Beynolds office with a detention. Don't worry, they don't actually do anything to you - it's just a formality.</p>",
    "<p>Uh oh, guess you gotta spend 5 mins cleaning the chemistry lab now! ¯\_(ツ)_/¯</p>"
  )

  ENGLISH.add_paths({
    '3' => ADVISORY,
    '*' => GENERIC_DEATH
  })

  ADVISORY.add_paths({
    '2' => MATH,
    '*' => GENERIC_DEATH
  })

  MATH.add_paths({
    '43.45' => HALLWAY,
    '*' => GENERIC_DEATH
  })

  HALLWAY.add_paths({
    rand(1..5) => THE_END_WINNER,
    '*' => THE_END_LOSER
  })

  START = ENGLISH

  ROOM_NAMES = {
    'ENGLISH' => ENGLISH,
    'MATH' => MATH,
    'ADVISORY' => ADVISORY,
    'HALLWAY' => HALLWAY,
    'THE_END_LOSER' => THE_END_LOSER,
    'START' => START,
  }

  def Map::load_room(session)
    return ROOM_NAMES[session[:room]]
  end

  def Map::save_room(session, room)
    session[:room] = ROOM_NAMES.key(room)
  end

end
