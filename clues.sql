-- Clue #1: We recently got word that someone fitting Carmen Sandiego's
-- description has been traveling through Southern Europe. She's most
-- likely traveling someplace where she won't be noticed, so find the least
-- populated country in Southern Europe, and we'll start looking for her there.

-- Answer #1 country code: VAT

-- SELECT * FROM country WHERE region = 'Southern Europe' ORDER BY population
-- OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;


-- Clue #2: Now that we're here, we have insight that Carmen was seen attending
-- a geography class. Our gumshoes figured out that she's headed to the second
-- smallest country in the world (by surface area). Once we arrive, we should 
-- set up a meeting with the head of state and see if they know anything.
-- Who is that? 


-- Answer #2 head of state: Rainier III

-- SELECT * FROM country ORDER BY surfacearea
-- OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;


-- Clue #3: After talking with the head of state, we found out that Carmen  
-- wants to build a vacation home in a new country! She is headed to the only  
-- country in the same region we're currently in that was established in the
-- 1500's.


-- Answer #3 country name: Netherlands

-- SELECT * FROM country 
-- WHERE region = 'Western Europe' 
-- AND indepyear BETWEEN 1500 AND 1600;


-- Clue #4: While in this country she started to learn the least spoken
-- language here. Oh no she's trying to pull a fast one! Carmen is headed to 
-- an island country that starts with the same first four letters of that 
-- language! She is trying to steal the crown of their current head of state
-- Who is that?

-- Answer #4 head of state: Elisabeth II

-- Part 1:

-- SELECT * FROM countrylanguage 
-- WHERE countrycode = 'NLD' AND percentage LIKE ( 
--     SELECT MIN(percentage) FROM countrylanguage WHERE countrycode = 'NLD' 
-- );

-- Answer: Turkish

-- Part 2:

-- SELECT * FROM country WHERE name LIKE 'Turk%';


-- Clue #5: Carmen is playing mind games with us. Apparently she is learning 
-- JavaScript so she can manipulate the DOM. Turns out she really likes those  
-- three letters. Is there a country in the same region we're in now that has
-- those letters in it's name? She also left behind a piece of paper with
-- 8495000 written on it! Where did she go?


-- Answer #5 country name: Dominican Republic

-- SELECT * FROM country 
-- WHERE region = 'Caribbean' 
-- AND LOWER( country.name ) LIKE '%dom%';


-- Clue #6: Carmen has brushed up on this country's main language. She's   
-- headed to a country in a different region, but the same current continent
-- where that language is spoken by 100% of the population. Where is she going?

-- Answer #6 country name: El Salvador

-- Part 1:

-- SELECT * FROM countrylanguage 
-- WHERE countrycode = 'DOM' AND percentage = ( 
--     SELECT MAX(percentage) FROM countrylanguage WHERE countrycode = 'DOM' 
-- );

-- ANSWER: Spanish

-- Part 2:

-- SELECT * FROM country c
-- JOIN countrylanguage cl ON c.code = cl.countrycode
-- WHERE c.continent = 'North America' AND c.region NOT LIKE 'Caribbean' 
-- AND cl.language = 'Spanish' AND cl.percentage = 100;

-- Part 2:

-- Clue #7:
--          Our playdate of late has truly been fun,
--          but now it's time I go to lay in the sun.
--          I've left you all of the very best clues,
--          while sampling all of the local shampoos.
--          Take a look at the answers you've found,
--          the first letter of each - jumbled around.
--          That's where I'm headed. It's where I'll be free,
--          Which is really nice, as I can't wait to ski.


-- We're counting on you, gumshoe. Find out where she's headed, send us the
-- info, and we'll be sure to meet her at the gates with bells on.

-- Answers so far: VRNEDE

-- Answer: Denver!
