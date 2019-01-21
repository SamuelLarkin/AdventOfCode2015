# sed -E --file=tsort.sed input | tsort | tac
s/([[:alpha:]]+) OR ([[:alpha:]]+) -> ([[:alpha:]]+)/\3 \1 \3 \2/;
s/([[:alpha:]]+) AND ([[:alpha:]]+) -> ([[:alpha:]]+)/\3 \1 \3 \2/;
s/([[:digit:]]+) OR ([[:alpha:]]+) -> ([[:alpha:]]+)/\3 \2/;
s/([[:digit:]]+) AND ([[:alpha:]]+) -> ([[:alpha:]]+)/\3 \2/;
s/([[:alpha:]]+) RSHIFT ([[:digit:]]+) -> ([[:alpha:]]+)/\3 \1/;
s/([[:alpha:]]+) LSHIFT ([[:digit:]]+) -> ([[:alpha:]]+)/\3 \1/;
s/NOT ([[:alpha:]]+) -> ([[:alpha:]]+)/\2 \1/;
s/([[:digit:]]+) -> ([[:alpha:]]+)//;
# lx -> a
s/([[:alpha:]]+) -> ([[:alpha:]]+)/\2 \1/;
