'''

Name - Vishal Jadhav
RollNo - 04
Subject-ICS
Experiment = Implementation of RSA Algorithm

'''


from decimal import Decimal

def gcd(e,pien):
    while pien!= 0:
        c = e % pien
        e = pien
        pien= c
    return e

d=0
p = int(input("enter p "))
q = int(input("enter q "))
message = int(input("enter message "))

n = p*q

pien = (p-1)*(q-1)


for e in range(2,pien):
    if gcd(e,pien)== 1:
        break

for i in range(1,10):
    x = 1 + i*pien
    if x % e == 0:
        d = int(x/e)
        break

local_cipher = Decimal(0)
local_cipher =pow(message,e)
cipher_text = local_cipher % n

decrypt_t = Decimal(0)
decrypt_t= pow(cipher_text,d)
decrpyted_text = decrypt_t % n

print('n = '+str(n))
print('e = '+str(e))
print('pie(n) = '+str(pien))
print('d = '+str(d)) 
print('cipher text = '+str(cipher_text))
print('decrypted text = '+str(decrpyted_text))


'''
   Input:
enter p 3
enter q 13
enter message 10

   OutPut:
n = 39
e = 5
pie(n) = 24
d = 5
cipher text = 4
decrypted text = 10
'''
