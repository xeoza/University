# Простой загружаемый модуль ядра

В данном примере использовалась версия ядра `linux-4.4.0-112`


## Структура

* `lkm.c` - код загружаемого модуля
* `Makefile`

Что бы не было батхерта
> no spacerino in path plz

> $ - user, # - root

#### Билдим

```
$ make
```

Если всё ок, то сгенерится `lkm.ko`.

#### Загруженные модули

```
$ lsmod
```

#### Загружаем 

```
# insmod lkm.ko
```

#### Ищем в списке `lkm`

```
$ lsmod | grep lkm
```

Смотрим, что вывел сообщение, которое определили в функции инициализации

```
$ dmesg | tail -5
```

#### Выводим информацию о модуле

```
$ modinfo lkm.ko
```

Победа!

#### Выгружаем

```
# rmmod lkm
```

Смотрим, очередное сообщение

```
$ dmesg | tail -5
```

#### Клиним по необходимости 

```
$ make clean
```