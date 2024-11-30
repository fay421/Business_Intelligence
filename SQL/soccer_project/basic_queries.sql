-- Basic Queries for Soccer Project
-- Query 25: write a  SQL query to find the players with shot numbers they took in penalty shootout matches. 
-- Return match_no, Team, player_name, jersey_no, score_goal, kick_no.
-- The query retrieves information about penalty shootouts for matches.
-- Specifically, it selects the match number, team country, player name, jersey number,
-- goals scored during the shootout, and the kick number for each player.

SELECT 
    p.match_no,               -- The match number for which the penalty shootout occurred
    c.country_name AS team,   -- The country name of the team involved in the shootout, renamed as "team"
    pl.player_name,           -- The player's name
    pl.jersey_no,             -- The player's jersey number
    p.score_goal,             -- Number of goals scored during the penalty by the player
    p.kick_no                 -- The kick number of the penalty shootout
FROM 
    penalty_shootout p,       -- The penalty_shootout table (alias p)
    country c,                -- The country table (alias c)
    player_mast pl            -- The player_mast table (alias pl)
WHERE 
    p.team_id = c.country_id  -- Match team_id in penalty_shootout with country_id in country
    AND p.player_id = pl.player_id  -- Match player_id in penalty_shootout with player_id in player_mast
ORDER BY 
    p.match_no,               -- Sort results first by match number
    p.kick_no;                -- Then by the kick number within each match
-----------------------------------------------------------------------------------------------------------------------
-- Basic Queries for Soccer Project
-- Query 26:write a  SQL query to count the number of penalty shots taken by each team. 
-- Return country name, number of shots as "Number of Shots". 
-- Select the country name and the total number of penalty shots for each country
SELECT 
    c.country_name,  -- Select the country name
    COUNT(*) AS "Number of Shots"  -- Count the number of rows in penalty_shootout for each country and label it as "Number of Shots"
FROM 
    country c,  -- The country table with alias 'c'
    penalty_shootout p  -- The penalty_shootout table with alias 'p'
WHERE 
    p.team_id = c.country_id  -- Match the team_id from penalty_shootout with country_id from country
GROUP BY 
    c.country_name  -- Group results by country name to get a count for each country
ORDER BY 
    COUNT(*) DESC;  -- Sort the results in descending order based on the number of shots

