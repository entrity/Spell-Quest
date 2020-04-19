import sys, re

MAX_WIDTH = 100
WIDTH = min(MAX_WIDTH, int(sys.argv[1]) if (len(sys.argv) > 1) else MAX_WIDTH)
HANGING_INDENT = 4

class Line(object):
	def __init__(self, text):
		self.text = text
		self.tokens = re.split(r'(\s+)', text)
		self.outbuf = ''
		self.printlen = 0
		self.lineno = 0
		self.hanging_indent = 0

	def loop(self):
		# If first char is '*', use a hanging indent
		if len(self.tokens) and re.match(r'\*|[0-9]+\.', self.tokens[0]):
			self.hanging_indent = HANGING_INDENT
		# Loop through tokens
		for token in self.tokens:
			plaintext = re.sub(r'\033\[[0-9;]+m', '', token)
			# If a single token is too long for even a line of its own, starting printing it
			if self.printlen == 0:
				while len(plaintext) > WIDTH:
					plainpart = plaintext[:WIDTH]
					plaintext = plaintext[WIDTH:]
					count = 0
					while len(plainpart):
						if token[0] == plainpart[0]: # If the token buffer's beginning is a plaintext char, we can move forward on the plainpart buffer
							plainpart = plainpart[1:]
						sys.stdout.write(token[0])
						count += 1
						token = token[1:]
					self.__print()
			# Buffer at capacity. Print and update self.color
			if self.printlen + len(plaintext) > WIDTH:
				self.__print()
			# Append to buffer
			if self.lineno == 0 or self.printlen > self.hanging_indent or re.search(r'\S', token):
				self.printlen += len(plaintext)
				self.outbuf += token
		# End of loop
		self.__print()

	def __print(self):
		global color
		sys.stdout.write('%s' % color)
		print(self.outbuf)
		matches = re.findall(r'\033\[[0-9;]+m', self.outbuf)
		if matches is not None and len(matches) > 0:
			color = matches[-1]
		self.lineno += 1
		self.printlen = self.hanging_indent
		self.outbuf = ' ' * self.hanging_indent

color = '\033[0m'
for line in sys.stdin:
	Line(line.rstrip()).loop()
