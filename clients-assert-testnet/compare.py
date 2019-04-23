#!/bin/python3

#import filecmp
from filecmp import dircmp
import os, os.path

def print_diff_files(dcmp):
    for name in dcmp.diff_files:
        #print("diff_file %s found in %s and %s" % (name, dcmp.left, dcmp.right))
        for sub_dcmp in dcmp.subdirs.values():
            print_diff_files(sub_dcmp)
        return name
    return ""


#blockBase = 0

#try:
#    f = open("cache.txt", "r")
#    blockBase = f.read()
#    print("READ! "+str(blockBase))
#except:
#    pass

#filecmp.cmpfiles(dir1, dir2, common, shallow=True)
#print("oi")

dirBase = 0
#dirBase = 100000

#fullPath = '/home/imcoelho/git-reps/neo-storage-audit/'

try:
    f = open("dirBase.txt", "r")
    dirBase = int(f.read())
except:
    pass

while True:
    print("analysing " + str(dirBase))
    dcmp = dircmp('StorageBase/BlockStorage_'+str(dirBase), 'StorageNew/BlockStorage_'+str(dirBase))
    #dcmp = dircmp('BlockStorage_100000', 'BlockStorage_100000_')
    out = str(print_diff_files(dcmp))

    if out == "":
        print("ok until "+str(dirBase))
    else:
        print("fail: "+out)
        break

    f2 = open("dirBase.txt", "w")
    f2.write(str(dirBase))

    dirBase += 100000
    count_A = [name for name in os.listdir('StorageBase/BlockStorage_'+str(dirBase)+'/') if True]#os.path.isfile(fullPath+name)]
    count_B = [name for name in os.listdir('StorageNew/BlockStorage_'+str(dirBase)+'/') if True]#os.path.isfile(fullPath+name)]

    print("countA: " + str(len(count_A)) + " countB: " + str(len(count_B)) )
    if len(count_A) != len(count_B) or len(count_A) != 100:
        print("incomplete directories")
        break


#x = filecmp.dircmp('BlockStorage_0', 'BlockStorage_0_')
#print(x)
#x.report()
