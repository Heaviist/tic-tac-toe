# tic-tac-toe
The Odin Project´s Tic Tac Toe project in ruby

# Assignment
Build a tic-tac-toe game on the command line where two human players can play against each other and the board is displayed in between turns.

# Goal
1. Think about how you would set up the different elements within the game… What should be a class? Instance variable? Method? A few minutes of thought can save you from wasting an hour of coding.
2. Build your game, taking care to not share information between classes any more than you have to.

# Expectations and challenges
- Will think about structure before writing the code
- How to best store the board could be interesting. Use variables for the game states per square?
- Probably create a seperate class for just writing down the board with the current state every turn. Which takes the values per square from a class that store the states per square
- It seems trivial to create 2 players with names and ask for their input
- Loop the game until a winning or drawing state is reached
- How to check for winning states? Create a nested array filled with the variables for each square? Then match to winning states? Probably don't need to check winning states until turn 5, so keep the number of turns somehow?

# Results and Evaluation
- Structure: I generally had a good idea of how to do this. On the go, I have found out you can pass objects into other objects as variables used for initializing an instance. This is pretty fun and usefull.
- Storing the board turned out to be intuitive once the board was drawn. This was easiest with an array, from which everything else followed.
- Turns out to be easier, just store in an array and draw that array
- Trivial to create, yes, always obvious how to use, no. As stated before, passing them into initializing the game class make sense and is easier for using the player variables.
- Looping took some rewriting. Having the variables for player objects available helped a lot. Once that was set up, it made more sense to just use a method call to switch the current player every time, instead of working with changing states and from that reading corresponding player details.
- Took some struggling with this. Ended up stating the winning states as a constant which was then used to check against the current board. Kind of obvious, but took some time to figure out the workings. Good strategy to keep in mind for the future.

# To reconsider when revisiting in the future
- Create players in initializing game object instead of sperate calls in general code?
- Variable board size?
- Play versus computer
