# Лабораторная работа №1

### Цель:
Освоить базовые приёмы и абстракции функционального программирования: функции, поток управления и поток данных, сопоставление с образцом, рекурсия, свёртка, отображение, работа с функциями как с данными, списки.

В рамках лабораторной работы вам предлагается решить несколько задач [проекта Эйлер](https://projecteuler.net/archives). Список задач -- ваш вариант.

Для каждой проблемы должно быть представлено несколько решений:

1. монолитные реализации с использованием:
    - хвостовой рекурсии;
    - рекурсии (вариант с хвостовой рекурсией не является примером рекурсии);
2. модульной реализации, где явно разделена генерация последовательности, фильтрация и свёртка (должны использоваться функции reduce/fold, filter и аналогичные);
3. генерация последовательности при помощи отображения (map);
4. работа со спец. синтаксисом для циклов (где применимо);
5. работа с бесконечными списками для языков, поддерживающих ленивые коллекции или итераторы как часть языка (к примеру Haskell, Clojure);
6. реализация на любом удобном для вас традиционном языке программирования для сравнения.

Требуется использовать идиоматичный для технологии стиль программирования.

### Решения:
#### Задача №5:

>2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

0. Работа с бесконечными списками
```haskell
   list1 = take 20 [1,2..]
   list2 = take 1000 [1..]
```

1. Хвостовая рекурсия

Решение "в лоб" - ищем от единицы до n такое число, которое будет
делиться без остатка на все числа до bound включительно.

Используется bounded-функция helper с сохранением результата
и выхода из функции без повторных вычислений после разложения рекурсии.
```haskell
smallestDividendByAll :: Int -> Int
smallestDividendByAll bound = helper 1 1 bound
  where
    helper n result bound
      | n > bound = result
      | result `mod` n == 0 = helper (n+1) result bound
      | otherwise = helper 1 (result+1) bound
```

2. Рекурсия (с использованием built-in LCM)

При помощи рекурсивного вызова функции LCM из пакета Prelude
ищем наименьшее удовлетворяющее условиям число.

```haskell
lcmForList :: [Int] -> Int
lcmForList [] = 1
lcmForList [x] = x
lcmForList (x:xs) = customLcm x (lcmForList xs)
  where 
    customLcm _ 0 = 0
    customLcm 0 _ = 0
    customLcm x y =  abs ((x `quot` gcd x y) * y)
```

Решение на языке Python: 
```python
ls = [x for x in range(1, 21)]


def gcd(a, b):
while b:
a, b = b, a % b
return a


def lcm(ls):
tmp = 1
for i in ls:
tmp = tmp * i // gcd(tmp, i)
return tmp


print(lcm(ls))
```
#### Задача №26:

> A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:
>* 1/2	= 	0.5
>* 1/3	= 	0.(3)
>* 1/4	= 	0.25
>* 1/5	= 	0.2
>* 1/6	= 	0.1(6)
>* 1/7	= 	0.(142857)
>* 1/8	= 	0.125
>* 1/9	= 	0.(1)
>* 1/10	= 	0.1
>
>Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.
Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

1. Итератор и хвостовая рекурсия

```haskell 
   cycleLength :: Int -> Int
   cycleLength n =
   let
   remainders = iterate (\x -> mod (x * 10) n) 1
   findCycle [] (x:xs) = findCycle (x:[]) xs
   findCycle acc (x:xs) = case elemIndex x acc of
   Nothing -> findCycle (x:acc) xs
   Just i -> i + 1
   in
   findCycle [] remainders
   ```

2. Свёртка (вспомогательная функция для нахождения максимума)
```haskell
argMax :: Ord b => (a -> b) -> [a] -> a
argMax f = foldl1' (\x y -> if (f y) > (f x) then y else x)
```

Решение на языке Python:
```python
number = 1
p_max = 1

for n in range(3, 1000, 2):
    if n % 5 == 0:
        continue

    p = 10
    s = 1
    while p % n != 1:
        s += 1
        p *= 10

    if s > p_max:
        number, p_max = n, s

print(number, p_max)
```

### Вывод:

В ходе выполнения лабораторной работы были использованы такие базовые приемы
при работе с языком Haskell, как работа с генерацией списков, отображение/свёртка,
рекурсия (обычная и хвостовая), а также итератор.


