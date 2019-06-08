# tzcalc
Used for calculating the best mutual meeting time for a group of people in different timezones. 
# Tutorial
As this program has no main function, it must be loaded in GHCi (using the command `:load main`). After having been loaded, the end user may use the function `besttime` to calculate the optimal meeting time. It takes three arguments, each of which are [Int]s. They are order-dependent, with each index corresponding to every respective individual. The first list is the UTC-offset for each person's timezone, the latter two are their rising and falling times respectively (of course, this uses 23-hour time starting at 0).
