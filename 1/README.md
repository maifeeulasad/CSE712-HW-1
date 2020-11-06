# Problem statement :
Parse HTML file

# Solveing strategy:
 - HTML is a markup language, it has well defined tags, I tried to get a glimpse from [here](https://www.w3schools.com/TAGS/default.ASP)
 - After getting the list I declared them as TAGS in lexer_html.l
 - As all most all HTML tags consists of an opening and a closing tag, so I declared them respectivly like this 
   - {OPEN_ANGLE}{TAGS}{CLOSE_ANGLE}
   - {OPEN_ANGLE}{BACK_SLASH}{TAGS}{CLOSE_ANGLE}
 - I only knew one tag `</br>` that works independently so made I_TAGS for those, and declared grammer like this below
   - {OPEN_ANGLE}{BACK_SLASH}{I_TAGS}{CLOSE_ANGLE}

That's all, lexer or token recognizer was complete.

But, there is some TAGS, those accepts value being passed to them, it hasn't been taken care yet.
