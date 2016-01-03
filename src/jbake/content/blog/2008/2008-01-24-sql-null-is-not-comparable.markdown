title=SQL NULL is not comparable
date=2008-01-24
type=post
status=published
tags=SQL
~~~~~~

I am starting out with one of my more common mistakes - comparing fields that may be null. In C or programmatical languages, a NULL would equal a NULL. However in SQL, that isn't the case.

An artificial example is:

table: **addresses**

 fName | mInit | lName | data
-------|-------|-------|-----
George | null | Washington | _blah_
John | null | Adams | _blah_
John | Q | Adams | _blah_

table: **orders**

 fName | mInit | lName | data
-------|-------|-------|-----
John | Q | Adams | _blah_
John | null | Adams | _blah_
George | null | Washington | _blah_

##Wrong Query##

    SELECT *
    FROM addresses a, orders o
    WHERE a.lName = o.lName
      AND a.fName = o.fName
      AND a.mInit = o.mInit


This returns less records than expected because if mInit column is null for "John Adams" in both tables, it still doesn't match. There are generally 2 options for addressing this:

- run a function on the nullable columns so null values get cast to a comparable value
- add an OR clause where both columns are null

##Solutions:##

###cast null values via functions:###

    SELECT *
    FROM addresses a, orders o
    WHERE a.lName = o.lName
      AND a.fName = o.fName
      AND NVL(a.mInit, "") = NVL(o.mInit, "")

###extra clauses###

    SELECT *
    FROM addresses a, orders o
    WHERE a.lName = o.lName
      AND a.fName = o.fName
      AND ( (a.mInit = o.mInit) OR (a.mInit IS NULL AND o.mInit IS NULL) )

Neither option is fun (extra code, which is often less readable, or performance hits), but basically required when joining relational tables. If you are comparing similar tables, then you can take advantage of set operators (such as minus/intersect/union in Oracle) and bypass this problem.