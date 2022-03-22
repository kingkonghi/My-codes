#-*-coding:utf-8-*-

dic = {'Herman':18,'Kitty':16,'Teresa':50}

dic['Dad'] = 52

set1 = set([1,2,3,3,4,4,3,5])
set2 = set([1,2,4,6,7])
set3 = set2 - set1
print(set3)
if (len(set1) ==0):
    print("True")
else:
    print("Else")