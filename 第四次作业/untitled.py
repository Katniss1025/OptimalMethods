print("------黄金分割法------")
a = 0
d = 8
lamda = 0.6180
b = lamda*a + (1-lamda)*d
c = (1-lamda)*a + lamda*d

# 定义目标函数
def function(x):
    return -min(x/2, 2-(x-3)**2, 2-x/2)

# 5次迭代
for i in range(1, 6):
    if function(b) < function(c):
        d = c
        b = lamda * a + (1 - lamda) * d
        c = (1 - lamda) * a + lamda * d
        print("第{}次迭代:\n".format(i), "x1: {:.3f}".format(b), "x2: {:.3f}".format(c), "fval: {:.3f}".format(function(b)))

    elif function(b) > function(c):
        a = b # dl+1 = dl
        b = lamda * a + (1 - lamda) * d
        c = (1 - lamda) * a + lamda * d
        print("第{}次迭代:\n".format(i), "x1: {:.3f}".format(b), "x2: {:.3f}".format(c), "fval: {:.3f}".format(function(b)))


print("------斐波那契法------")

a = 0  #区间下限
b = 8  #区间上限
dx = 0.05  #迭代精度

def f(x):
    return -min(x/2, 2-(x-3)**2, 2-x/2)

N = (b-a)/dx
#获得斐波那契数列
F = [1, 1]
while F[-1] < N:  #获得小于10000的斐波那契数列
    F.append(F[-2] + F[-1])
print("斐波那契数列：", F)
n = len(F) - 1  # 获取斐波那契数列的长度(计数从0开始） n = 12

if n < 3:
    print("精度过低，无法进行斐波那契一维搜索")
else:
    pass

x1 = b - F[n - 1] / F[n] * (b - a)
x2 = a + F[n - 1] / F[n] * (b - a)
t = n
i = 0
while t > 3 and i < 5:
    i += 1
    if f(x1) < f(x2):  # 如果f(x1)<f(x2)，则在区间(x1,b)内搜索
        #a1 = a
        b = x2
        x2 = x1
        x1 = b - F[t - 1] / F[t] * (b - a)
        print("第{}次迭代:\n".format(i), "x1: {:.3f}".format(x1), "x2: {:.3f}".format(x2), "fval: {:.3f}".format(f(x1)))
    elif f(x1) > f(x2):  # 如果f(x1)>f(x2),则在区间(a,x2)内搜索
        a = x1
        x1 = x2
        x2 = a + F[t - 1] / F[t] * (b - a)
        print("第{}次迭代:\n".format(i), "x1: {:.3f}".format(x1), "x2: {:.3f}".format(x2), "fval: {:.3f}".format(f(x2)))
    t -= 1

'''固定步长法'''