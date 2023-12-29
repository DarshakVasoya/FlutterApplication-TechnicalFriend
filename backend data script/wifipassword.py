x = ""
a=["Ved","ved"]
b=["0","1","2","3","4","5","6","7","8","9"]
for i in a:
    for j in b:
        for k in b:
            for m in b:
                for n in b:
                    x=x+i+j+k+m+n+"@\n"

f = open("password1.txt", "w")
f.write(x)
f.close()


