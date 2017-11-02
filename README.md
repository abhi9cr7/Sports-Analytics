# Sports-Analytics

## Overview
Real Madrid is one of the largest soccer clubs in the world. There are millions of fans around the world and who watch every game without fail. Real Madrid won 12 champions league trophies which keeps it way ahead of any team in European soccer world. But, LaLiga(League cup) was always one of the important trophies in Real Madrid history. Real Madrid were champions of the spain 33 times, more than any other team in the history of the league. Winning a league is always challenging as they need to fare well in all the matches throught out the season.


## Aim of the Project
Analyze the perfromance of Real Madrid in the LaLiga seasons of 2014,2015 and 2016. Compare the results with their arch rivals, FC Barcelona. This will give an idea on why Real Madrid lost in the league and in what areas do they need to work on.

## Data Collection
The data is collected from http://football-data.co.uk/spainm.php where three seasons data is selected. The data gives us information about the primary division football (La Liga) match data. There are around 1098 instances and 24 attributes and the attribute names are abbreviated. The full names of the attribute names can be found at http://football-data.co.uk/notes.txt.

## Data Pre-Processing
Data from 3 different files were merged into a single larger file. Performed feauture selection by removing unimportant/irrelevent match data. Date anomolies are dealt using some excel formulae and the file was converted into supported format for further analysis in R.

## Core Analysis
* Select all the matches where Real Madrid is involved and make a subset for further analysis.
* Analyze the trends in categorical and numerical attributes of data.
* Check the distribution of data and carry out various sampling techniques.
* Check the winning distribution of Real Madrid and FC Barcelona at "Home" matches and "Away" matches.
* Plot some basic graphs which gives an idea on how both the teams performed against other teams. Also, plotted the distribution of number of goals scored by Real Madrid and Barcelona in Home and Away matches.

## Final observations
* Real Madrid and FC Barcelona performed similarly in "Home" games.
* FC Barcelona scored more goals in Home matches than Real Madrid. 
* When two teams tie with points by the end of the season, winner will be determined by the net number of goals scored against each other and other teams. So in this case, Barcelona would win the league even if Real Madrid levelled the points.
* FC Barcelona has more number of "Away" wins compared to Real Madrid which is the main reason why they won the league.
* Real Madrid performed well against the teams that come from southern part of Spain. This might be because of the weather conditions that they must endure during their trip towards north. 
