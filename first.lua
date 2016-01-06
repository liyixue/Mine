print("lyx")
print("Hello World")
print(b) --nil
b=10     --全局变量
print(b) --10
b="Hello"--lua是动态语言 变量不要预定义类型 可直接修改 可以是任意类型的值
b=nil   --删除全局变量
print(b) --nil
---------------------------lua大小写敏感

---------------------------type查看值是什么类型
print(type("lyx")) --通过type测定类型 string

print(type(10))    --number 数全是number类型
print(type(3.14))

print(type(nil))   --nil

print(type(true))  --boolean

print(type(type))  --function
print(type(print))

--单行注释

--[[
这里是多行
注释
--]]

--lua中只有 nil false为假 其余均为真 0也为真

--相当于c中的常量
stra="one string"  --字符串不能修改
--通过string.gsub函数将stra中的值拷贝到strb中 然后将one修改陈two
strb=string.gsub(stra,"one","two") 
print(stra) --one string
print(strb) --two string

--输出"hello" 使用转义字符 \
print("\"hello\"")

print(10+1)    --11

print("10"+1)  --11 字符串遇到运算符 自动将字符串转换成number（字符串得为数字)
print("1"*2)   --2

print("10+1")  --10+1

print("Hello ".."World")  --..用来连接
print(600 .. 2)           --数连接 需要空格


--tonumber tostring
a=10
print(type(tostring(a)))  --将数字转成字符串 string
print(a)                  --10

print(type(tonumber(a))) --将字符串转为数字  number
print(a)				  --10

--逻辑运算符 and or   and的优先级比or高
-- a and b 如果a为false 返回a  否则返回 b
print(4 and 5)  --5
print(false and 6)  --false
print(nil and 7)    --nil
--a or b 如果a为true 返回a 否则返回 b
print(4 or 5)   --4
print(false or 6)  --6

--c语言中的三元运算符a?b:c在lua中用(a and b)or c
a,b=6,2    --同时赋值 用逗号隔开
print(a,b) --6 2
a,b=b,a    --交换变量值 先给=右边赋值 再赋给左边
print(a,b) --2 6

a,b,c=1,2     --c没值 默认补nil
print(a,b,c)  --1,2,nil

a,b=1,2,3     --默认忽略后面多的值
print(a,b)    --1 2

--声明局部变量 变量前加local
local x = 1  --x的作用域只在代码块中有效

if a>0 then
	y=10           --全局
	local  m = 1   --局部
	print(y,m)     --10 1
end
print(y,m)         --10 nil

--if
y=2
if y>2 then
	print(y)
end
if y<=2 then
	print("yyyy")
end

--else if
if y<0 then
	print("y<0")
elseif y<1 then
	print("y<1")
elseif y<3 then   --2
	print(y)
else
	print("y>=3")
end

--for for(int i=1,i<10,i++)
for i=1,10,1 do   --i=1 初始值 10 迭代次数 1操作+1(-1 操作-1)
	print(i)
end

for i=1,10 do   --第三个没有 默认 i+1操作
	print(i)
end

--while
y=5
while y>0 do
	print(y)
	y=y-1  --不能用--会当成注释 y-=1也不行
end

--function函数
function function_name()  ---函数名
	-- body
	print("Hello World")
end
--调用function
function_name()  --输出hello World

--定义函数（返回大)
function maxNumber(a,b)    --(参数a,参数b)
	-- body
	if a>b then
		return a
	else
		return b
	end
end

print(maxNumber(10,20))    --20
max=maxNumber(10,20)       
print(max)				   --20

--计算和
function sumFunc(m,k)
	-- body
	return m+k
end

local sum = sumFunc(1,2)
print(sum)                 --3

function func1( a,b )
	print(a)    --1
	print(b)    --2
end
func1(1,2,3)    --多余忽略
func1(1)        --缺少nil补足

--function函数 return 可返回多个值
function func2( a,b )
	return a,b
end
print(func2(3,4))   --3 4
x=func2(3,4)
print(x)          --3
x,y=func2(3)
print(x,y)        --3 nil

a,b,c=func2(1,2),100  --函数位于最后返回全部值 否则只返回第一个值
print(a,b,c)          --1,100,nil
a,b,c=100,func2(1,2)
print(a,b,c)          --1,2,100

--table
b={}     --创建一个空表
print(b.name)

--创建一个非空表
days={"Mon","Tues","Wed","Thur","Fri","Sat","Sun"}
print(days[0])   --nil
print(days[1])   --Mon 下标从1开始
print(days[4])
days[4]="周四"    --修改
print(days[4])
print(days[10])
days[10]="周十"   --添加
print(days[10])

person={name="张三",age=25,gender="男"} --key=value 默认key为12345...  存在哈希表中
print(person.name)  --张三  用点
print(person["name"]) --张三  用[""]

print(person.age)
print(person["age"])

person.gender="女"
print(person.gender)  --女


--pairs 遍历table中的所有键值对
for k,v in pairs(person) do
	print(k,v)
end

days={"10","20","30"} --存在数组中
for m,n in pairs(days) do
	print(m,n)
end

--ipairs 寻找key为1的开始往后遍历 --没说明key 默认从1开始 前面如果有1会覆盖 
person={[6]="bb",name="lyx",[2]="aa",age=20,gender="男",2} 
for k,v in ipairs(person) do   
	print(k,v)  --1 2  2 aa
end

--用来计算表中长度 
print(table.maxn(person))  --key的个数（key最大的那个
print(#person)           --value的个数（key=1的开始计算 到后面不间断的最大值）

