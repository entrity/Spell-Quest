import sys, re

WIDTH = 65
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
		if len(self.tokens) and self.tokens[0] == '*':
			self.hanging_indent = HANGING_INDENT
		# Loop through tokens
		for token in self.tokens:
			plaintext = re.sub(r'\033\[[0-9;]m', '', token)
			# If a single token is too long for even a line of its own, starting printing it
			if self.printlen == 0:
				while len(plaintext) > WIDTH:
					plainpart = plaintext[:WIDTH]
					while len(plainpart):
						if token[0] == plainpart[0]:
							plainpart.pop(0)
						sys.stdout.write(token.pop(0))
			# Buffer at capacity. Print
			if self.printlen + len(plaintext) > WIDTH:
				self.__print()
			# Append to buffer
			if self.lineno == 0 or self.printlen or re.search(r'\S', token):
				self.printlen += len(plaintext)
				self.outbuf += token
		# End of loop
		self.__print()

	def __print(self):
		print(self.outbuf)
		self.lineno += 1
		self.printlen = self.hanging_indent
		self.outbuf = ' ' * self.hanging_indent


for line in sys.stdin:
	Line(line.rstrip()).loop()
