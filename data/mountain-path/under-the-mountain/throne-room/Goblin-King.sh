#!/bin/bash

tutorial () {
	speak <<-EOF
	${SPEECH}
	I am king of these goblins. Therefore, I must be the wisest and most knowledgeable. Oh, it is a heavy burden, to be sure, to have all of this brilliance within my head.

	But I am regal, not servile; therefore, I must never perform any labour. Labour is beneath my dignity.

	You, non-goblin, I have a task for you, and if you perform it well, I will reward you richly. You must find the nearest Amazon Hub pickup locations. My zip code is 95746, and as you can see if you visit $(alt https://www.amazon.com/ulp?zipcode=95746), there are zero pickup locations in this zip code.

	You must perform a search of all zip codes that begin 957--, and give me the results of your search. To speed you on your way, I will teach you a spell and a pair of techniques.

	The first technique is called a $(alt subshell). It means that you can cast a spell within a spell. The most common approach to this is setting a variable to be the output of a spell. A $(alt subshell) is created by putting a spell invocation inside of $(alt '$(...)'). For an example, let's name a variable $(alt MYVAR) and set its output to be the output of $(spell cat). Then let's $(spell grep) the variable for a pattern:

	$(spell 'MYVAR=$(cat some-file.txt)')
	$(spell "grep '[^0-9]\+' <<< \"\$MYVAR\"")

	The second technique is a $(alt for) loop. It goes like this:

	${SPELL}for MYVAR in word_a word_b word_c; do
	    echo "The current word is \$MYVAR"
	    grep "\$MYVAR" some-file.txt
	done${SPEECH_N}

	The format is $(spell 'for ... in ...; do ... done'). I could put whatever invocations I wished within the $(alt for) loop. In that respect, it's just like a $(alt while) loop. The $(alt for) loop executes once for each of the parameters that appear between $(alt in) and $(alt ;).

	When you want to loop over very many things, such as all of the zip codes that begin $(alt 957--), it's not convenient to actually write out all of the parameters for the $(alt for) loop. Instead, it's better to put a $(alt subshell) between $(alt in) and $(alt ;).

	One spell that is useful to invoke within a $(alt subshell) for a $(alt for) loop is $(spell seq). Its name, if you haven't guessed, is short for 'sequence'. It outputs all the numbers that belong in the sequence which its parameters define. For instance:

	$(spell 'seq 10 13')
	${RESET}10
	11
	12
	13${SPEECH}

	Suppose that I wanted to grep all the numbers between 8 and 800, with zero-padding. I might invoke the following:

	${SPELL}for NUMBER in \$(seq 8 800); do
	  printf -v ZERO_PADDED_NUMBER "%03d" \$NUMBER
	  grep \$ZERO_PADDED_NUMBER some-file.txt
	done${SPEECH_N}

	It's just that easy.

	Now the task I have set before you comes into focus... You'll need to use a $(alt for) loop to download the page $(alt 'https://www.amazon.com/ulp/ajax/find-pickup-points?zipcode=95746&isZipcodeRequest=true&ref=ulp_zip_95746'), but you'll need to substitute the zip code which you want to check for the zip codes that appear in that example web address.

	Go ahead and try this for the example zip code $(alt 95746). Then look at the result so that you can see what a failure looks like.

	In your $(alt for) loop, after downloading a single web response, you'll need to check whether it matches the failure response for 95746. You could use $(alt grep) with $(alt \-v) for this because that will only output lines that _don't_ match the failure. That is what I require.

	$CONTINUE
	EOF

	learned 'seq'
	learned '(technique) "for" loop'
	learned '(technique) subshell'

	wrap <<-EOF
	${SPEECH}
	Oh, it seems like quite a task the Goblin King has set. You must make many requests to $(alt 'https://www.amazon.com/ulp/ajax/find-pickup-points?zipcode=95746&isZipcodeRequest=true&ref=ulp_zip_95746'), substituting many different zip codes for the two zip codes that appear in that web address. You need to peform this check for every zip code that starts with $(alt 957--).

	Any non-failure responses should be piped or redirected into the Goblin King when you speak with him next.
	EOF
}
mistake () {
	wrap <<-EOF
	${SPEECH}

	No, no, no. This is not correct. You can try again if you like.
	EOF
}
reward () {
	wrap <<-EOF
	${SPEECH}
	Ah, well done, minion! Have your reward!

	${RESET}The Goblin King pulls a brown rabbit's foot from beneath his seat cusion and lobs it toward you. Instinctively, you catch it and slip it into your bag.
	EOF
	mkdir -p "${HOME}/bag"
	cp "${DATA}/rabbits-foot" "${HOME}/bag"
}
check () {
	read -d '' ANS
	[[ "$ANS" =~ \{\"pickupPointList\":\[\{.+\}\]\} ]]
}

if [[ -t 0 ]]; then
	tutorial
else
	if check; then
		reward
	else
		mistake
	fi
fi
