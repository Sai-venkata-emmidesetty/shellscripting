#!/bin/bash


word="Mississipi"

#count number of letters repeated in a word

repeat_letter_to_find="s"

letter_count=$(echo "$word" | grep -o "$repeat_letter_to_find" | wc -l)

echo "$letter_count"


#Explanation:
#----------------
#grep -o "$repeat_letter_to_find"
    #grep: Searches for patterns in text.
    #-o: Ensures that only the matching parts of the text (not the entire line) are printed.
    #"$repeat_letter_to_find": Specifies the pattern to search for (e.g., "s").
    #If word="Mississipi" and repeat_letter_to_find="s", the output of this step is each occurrence of the letter s, printed on a new line: 
#example output of: grep -o "$repeat_letter_to_find"(S wil be printed in 4 new lines)
    #s
    #s
    #s
    #s
#wc: Word count utility.
#-l: Counts the number of lines in the input.
#Since each occurrence of the letter s is printed on a separate line, wc -l counts how many lines there are, which equals the number of occurrences of the letter s
