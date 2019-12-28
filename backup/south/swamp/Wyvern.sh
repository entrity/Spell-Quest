#!/bin/bash

PAGE_URL='http://eqcomics.com/2009/10/26/bobbing-for-mousetraps/'
IMG_URL='http://eqcomics.com/comics/2009-10-26-bobbing-for-mousetraps.png'
REFERENCE="$HOME/../data/img-for-wyvern.png"
TARGET='2009-10-26-bobbing-for-mousetraps.png'

tutorial () {
	speak <<-EOF
	$(art wyvern.txt)
	${SPEECH}Whoosh! Do you dare brave the swamp? Hmph! It is said that fools rush in where angels dare not tread.

	You may venture forth if you will. There is no way for one such as yourself to reach the mountain but by entering the swamp, yet I caution you: if you know not where to go, you will surely become lost.

	There is only one path through the swamp that will stand you in good stead. I will give you a hint to the final leg of that journey if you will will grant me a boon: fetch for me a certain funny image of which I know and place it here next to me.

	To achieve this aim, you had better make use of the $(spell curl) and $(spell wget) spells?

	What's that you say? You don't know either of these spells? These are first-level Conjuration spells. Have you heard of the abundance of lore which swirls around the aether? Oh, I see, you know it by the name $(alt internet).

	These two spells are used for drawing this lore from the $(alt internet). They can perform the same tasks, but $(spell curl) is generally favoured for outputting the information into your terminal, and $(spell wget) is generally favoured for saving the information to a file.

	Do you know how a web page works? It contains a lot of text which specifies what colors and images and styles to use. I'll need you to fetch the page at $(alt $PAGE_URL) and then look through it for the address of the image which I desire. That page surely references many, many images, but there should only be one which meets the following specifications:

	* It includes the text $(alt /comics/)
	* Immediately after $(alt /comics/), it has a date in the format $(alt YYYY-MM-DD)

	The image's address should be enclosed with quotation marks. That's how you'll know where it starts and where it ends. Then you must cast a spell to fetch the image and save it as a file. But there's one thing more you must know:

	If you encounter an address which begins with $(alt /) or $(alt //), it is not immediately usable. You must prepend something to it. Addresses should begin $(alt http://) or $(alt https://).

	Can you do this? Once you have the file saved right here, speak with me again.

	$CONTINUE
	EOF

	[[ -e "$REFERENCE" ]] || wget -O "$REFERENCE" "$IMG_URL" >/dev/null

	learned wget
	learned curl

	wrap <<-EOF
	${SPEECH}Can you do as the Wyvern bade? Fetch the web page at $(alt $PAGE_URL), and then scan its contents for an address such as the Wyvern described. Then fetch the image itself, saving it to a file in this very location.
	EOF
}

reward () {
	wrap <<-EOF
	${SPEECH}Huzzah! This! This is what I have awaited these many years!

	Have you had a look at the funny image yet? You can open it by invoking $(spell "$IMAGER $TARGET").

	Now as promised, I will tell you a hint for the final leg of your journey into the swamp: let your feet be guided by the word $(alt winding).

	$CONTINUE
	EOF

	learned $IMAGER
}


if [[ -e "$TARGET" ]]; then
	if >/dev/null cmp "$TARGET" "$REFERENCE"; then
		reward
	else
		wrap <<-EOF
		${SPEECH}Hm. That's not quite right. I see a file of the correct name, but its contents are not what I expected to see.
		EOF
	fi
else
	tutorial
fi
