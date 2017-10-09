def c():
     start="/Users/ial-ah/Desktop"
     count=0
     while 1:
        d=os.listdir(start)
        if 'Desktop' in d:
            count+=1
        else:
            print(count, d)
            break
        start+='/Desktop'
        print(count)
        print(d)
