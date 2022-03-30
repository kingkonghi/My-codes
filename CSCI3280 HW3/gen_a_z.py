with open('a_z.txt', 'w') as f:
    for i in range(1000000):
        f.write(chr(i%26+65))
    