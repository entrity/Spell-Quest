# Reads bytestream from stdin, flips least-significant bits to embed a message
# which is provided as args.

# Usage:
# cat infile | python $0 "My message" > "outfile"

'''
Example for bash
# Make a file of zeros:
for i in `seq 256` do; printf "\x00" >> zeroes.bin; done
# Run script
< zeroes.bin python $0 "this is my msg" | xxd
'''

import random
import struct, sys

def char_to_bytes(ch, outfile):
	for b in range(7,-1,-1):
		lsb = (ord(ch) & (1 << b)) >> b
		r = random.randint(0,255)
		if lsb == 0:
			out = r & 254
		else:
			out = r | 1
		outfile.write(struct.pack('<B', out))
		sys.stdout.write('%d' % lsb)
		
def demo():
	with open('bypy.tmp','wb') as f:
		for ch in 'Oh, boy!':
			c(ch, f)
	print()

'''
---------------------------------------
'''

CHUNK_SIZE = 2**11

def read(doer):
	while True:
		inbuf = sys.stdin.buffer.read(CHUNK_SIZE)
		if len(inbuf) == 0: break
		octets = [ bytearray(inbuf[i:i+8]) for i in range(0, CHUNK_SIZE, 8) ]
		for octet in octets:
			if False == doer._octet_callback(octet):
				return

class Embedder(object):
	def __init__(self):
		self.msg = ' '.join(sys.argv[1:])
		self.cur = 0 # message cursor

	def _embed_char(self, octet):
		if self.cur <= len(self.msg):
			if self.cur == len(self.msg):
				byte = 0
			else:
				byte = ord(self.msg[self.cur])
			self.cur += 1
			for i in range(7,-1,-1):
				bit = (byte & (1 << i))
				if bit:
					octet[i] |= 1
				else:
					octet[i] &= 254

	def _octet_callback(self, octet):
		self._embed_char(octet)
		sys.stdout.buffer.write(octet)

	def main(self):
		read(self)
		sys.stdout.buffer.flush()

class Reader(object):
	def _octet_callback(self, octet):
		byte = 0
		for i in range(8):
			if (octet[i] & 1):
				byte |= (1 << i)
		if byte == 0:
			sys.stdout.buffer.flush()
			return False
		else:
			sys.stdout.buffer.write(struct.pack('B', byte))

	def main(self):
		read(self)
		print()

if sys.stdout.isatty():
	Reader().main()
else:
	Embedder().main()
