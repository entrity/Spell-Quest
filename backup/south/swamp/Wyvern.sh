#!/bin/bash

PAGE_URL='http://eqcomics.com/2009/10/26/bobbing-for-mousetraps/'
IMG_URL='http://eqcomics.com/comics/2009-10-26-bobbing-for-mousetraps.png'
REFERENCE="$HOME/../data/img-for-wyvern.png"
TARGET='2009-10-26-bobbing-for-mousetraps.png'

tutorial () {
	[[ -e "$REFERENCE" ]] || wget -O "$REFERENCE" "$IMG_URL" >/dev/null &

	speak <<-EOF
	$(art wyvern.txt)
	${SPEECH}Whoosh! Do you dare brave the swamp? Hmph! It is said that fools rush in where angels dare not tread.

	You may venture forth if you will. There is no way for one such as yourself to reach the mountain but by entering the swamp, yet I caution you: if you know not where to go, you will surely become lost.

	There is only one path through the swamp that will stand you in good stead. I will give you a hint to the final leg of that journey if you will will grant me a boon: fetch for me a certain funny image of which I know and place it here next to me.

	To achieve this aim, you had better make use of the $(spell curl) or $(spell wget) spell.

	What's that you say? You don't know either of these spells? These are first-level Conjuration spells. Have you heard of the abundance of lore which swirls around the aether? Oh, I see, you know it by the name $(alt internet).

	These two spells are used for drawing this lore from the $(alt internet). They can perform the same tasks, but $(spell curl) is generally favoured for outputting the information into your terminal, and $(spell wget) is generally favoured for saving the information to a file. However, you might prefer to base any decision of which one to use on which one is already installed on your device: $(spell curl) tends to be pre-installed on MacOS devices, and $(spell wget) tends to be pre-installed on Linux devices.

	An important distinction between the two spells is how they deal with compressed (zipped) content. $(spell wget) will automatically unzip it for you, but if $(spell curl) receives zipped content, you'll have to add the $(alt '--compressed') parameter to tell $(spell curl) that its content is compressed and that it should unzip it for you.

	Let's suppose that you want to download a file from the $(alt internet) because that simplifies things. (You can always $(spell cat) it if you want it printed to the terminal, and you can always $(spell rm) it when you are finished with it.) Let's suppose that the address you want to download is $PAGE_URL.

	Here's how you do it with $(spell wget):
	$(spell "wget '$PAGE_URL'")
	Here's how you do it with $(spell curl):
	$(spell "curl --compressed --output 'my-download' '$PAGE_URL'")

	The parameter that follows $(alt '--output') is the name of the file to which you wish to save the download. It doesn't have to be $(alt 'my-download'); it can be any legal filename.

	For $(spell wget), you don't have to specify a filename for the downloaded file because $(spell wget) will assume you want to use the same name as appears at the end of the web address. If you want to specify a name for the file, though, you can use the parameter $(alt '--output-document'), which works just like $(spell curl)'s $(alt '--output') parameter.

	...Do you know how a web page works? A webpage file consists of a lot of text which specifies what colors and images and styles to use. I'll need you to fetch the page at $(alt $PAGE_URL) and then look through it for the address of the image which I desire. That text of that webpage's file surely holds many, many web addresses, but there should only be one which meets the following specifications:

	* It includes the text $(alt /comics/)
	* Immediately after $(alt /comics/), it has a date in the format $(alt YYYY-MM-DD)

	The image's address should be enclosed with quotation marks. That's how you'll know where the address starts and where it ends. Then you must cast a spell to fetch the image and save it as a file. But there's one thing more you must know:

	If you encounter an address which begins with $(alt /) or $(alt //), it is not immediately usable. You must prepend something to it. Addresses should begin $(alt http://) or $(alt https://). I know not the difference between, the two, though perhaps someone else on your journey might. I suggest trying them both; surely one is bound to succeed!

	Please save the file with the name that matches the base name of the image's web address (that is to say, the last level of the path).

	Can you do this? Once you have the file saved right here, speak with me again.

	$CONTINUE
	EOF

	learned wget
	learned curl

	wrap <<-EOF
	${SPEECH}Can you do as the Wyvern bade? Fetch the webpage at $(alt $PAGE_URL), and then scan its contents for an address such as the Wyvern described. Then fetch the image itself, saving it to a file in this very location.

	The image's address should be contained within the content of the webpage file. It should be the only address that matches this pattern:

	* It includes the text $(alt /comics/)
	* Immediately after $(alt /comics/), it has a date in the format $(alt YYYY-MM-DD)

	The web address should additionally adhere to these rules:

	* Immediately before it is a quotation mark $(alt '"')
	* Immediately after it is another quotation mark $(alt '"')
	* There are no quotation marks inside of it
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
