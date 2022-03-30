import random
with open('ran.txt', 'w') as f:
    for i in range(2000000):
        f.write(chr(random.randint(0, 25) + 65))
    
