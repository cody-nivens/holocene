#!/bin/bash
#
gawk -v FPAT="([^,]+)|(\"[^\"]+\")" '{
print "<section>"
print "<title>\2: \1"
print "</title>"
print "<region>\10</region>"
print "<event_type>\4</event_type>"
print "</section>"
}' t

