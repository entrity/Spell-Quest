	* When $(alt ^) appears at the start of a start of a regular expression, it means "look for a match at the start of the line." What does that mean? Well, a regular expression of just the letter $(alt c) would find a match in 'abc', 'cba', 'c', 'acb', and many more. But a regular expression of $(alt ^c) would only find a match in lines that *start* with $(alt c), such as 'cba' and 'c'.

	* Similarly, when $(alt '$') appears at the *end* of a regular expression, it means "look for a match at the end of the line." So a regular expression of $(alt c$) would match 'abc' and 'c' but not 'abc' or 'acb'.
	
	* Regular expressions *don't* need to begin with a $(alt \^) or a $(alt \$) if you want a match to be free to begin or end anywhere in a line.

	* When $(alt ^) appears not at the start of the regular expression but instead as the first character in a pair of brackets, it means "match any characters *except* for the ones that appear in these brackets."


-i 
-o