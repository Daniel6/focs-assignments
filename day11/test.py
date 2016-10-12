p = False
q = True
r = False

print ((p or q or r) and ((not p) or (not q) or (not r)) and (p or (not q)) and (q or (not r)) or (r or (not p)))