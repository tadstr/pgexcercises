-- Retrieve everything from a table
SELECT
  *
FROM
  cd.facilities;

-- Retrieve specific columns from a table
SELECT
  name,
  membercost
FROM
  cd.facilities;

-- Control which rows are retrieved
SELECT
  *
FROM
  cd.facilities
WHERE
  membercost > 0;

-- Control which rows are retrieved 2
SELECT
  facid,
  name,
  membercost,
  monthlymaintenance
FROM
  cd.facilities
WHERE
  membercost > 0
  AND membercost < monthlymaintenance / 50;

-- Basic string searches
SELECT
  *
FROM
  cd.facilities
WHERE
  name LIKE '%Tennis%';

/**
 * * Matching against multiple possible values
 * TODO: How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator. 
 **/
SELECT
  *
FROM
  cd.facilities
WHERE
  facid IN (1, 5);

/* The IN operator is a good early demonstrator of the elegance of the relational model. The argument it takes is not just a list of values - it's actually a table with a single column. Since queries also return tables, if you create a query that returns a single column, you can feed those results into an IN operator. To give a toy example: */
SELECT
  *
FROM
  cd.facilities
WHERE
  facid IN (
    SELECT
      facid
    FROM
      cd.facilities
  );

/**
 * * Classify results into buckets
 * TODO: How can you produce a list of facilities, with each labelled as 'cheap' or 'expensive' depending on if their monthly maintenance cost is more 	than $100? Return the name and monthly maintenance of the facilities in question.
 */
SELECT
  name,
  CASE
    WHEN monthlymaintenance > 100 THEN 'expensive'
    ELSE 'cheap'
  END AS cost
FROM
  cd.facilities;