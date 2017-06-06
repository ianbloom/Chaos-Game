# Chaos-Game
Uses the chaos game to generate fractals according to user input

The <a href="https://en.wikipedia.org/wiki/Chaos_game">chaos game</a> is an iterative algorithm for drawing fractals.

The user chooses the number of generator points, as well as the conditions the program must abide by in choosing the next point.

The program chooses a random point on the screen.  It then chooses a generator point at random abiding by the chosen conditions.
The program then draws a point halfway between the random point and the chosen generator point.

For each subsequent iteration, the program chooses another generator point, and draws a point halfway between the previously
chosen point and the chosen generator point.
