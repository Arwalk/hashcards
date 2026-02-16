run:
    jj rebase -s drill -d main
    jj edit drill
    cd cards && hashcards check
    cd cards && hashcards drill
    jj git push
    jj edit main