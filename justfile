run:
    jj git fetch
    jj rebase -s drill -d main
    jj edit drill
    hashcards check cards
    hashcards drill cards
    jj git push
    jj new main