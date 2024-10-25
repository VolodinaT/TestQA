﻿#language: ru
@ExportScenarios
@IgnoreOnCIMainBuild
@tree

Функционал: Проверка заполнения шапки документа Заказ покупателя

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект> 

Сценарий: Заполняю шапку документа Заказ покупателя
И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
Тогда открылось окно 'Заказы товаров'
И я нажимаю на кнопку с именем 'ФормаСоздать'
Тогда открылось окно 'Заказ (создание)'
И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Товары"'
И я нажимаю кнопку выбора у поля с именем "Покупатель"
Тогда открылось окно 'Контрагенты'
И в таблице  "Список" я перехожу на один уровень вниз
И в таблице "Список" я перехожу к строке:
	| 'Код'       | 'Наименование'           |
	| '000000016' | 'Магазин "Мясная лавка"' |
И в таблице "Список" я выбираю текущую строку
Тогда открылось окно 'Заказ (создание) *'
И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
И элемент формы с именем "Организация" стал равен 'ООО \"Товары\"'
И элемент формы с именем "Склад" стал равен 'Малый'
И элемент формы с именем "Покупатель" стал равен 'Магазин \"Мясная лавка\"'
И элемент формы с именем "ВидЦен" стал равен 'Мелкооптовая'
И элемент формы с именем "СостояниеЗаказа" стал равен 'Открыт'
Когда открылось окно 'Заказ (создание) *'
И я нажимаю кнопку выбора у поля с именем "Покупатель"
Тогда открылось окно 'Контрагенты'
И в таблице "Список" я перехожу к строке:
	| 'Код'       | 'Наименование' |
	| '000000004' | 'Шлюзовая ООО' |
И в таблице "Список" я выбираю текущую строку
И элемент формы с именем "Организация" стал равен 'ООО \"Товары\"'
И элемент формы с именем "Склад" стал равен 'Малый'
И элемент формы с именем "Покупатель" стал равен 'Шлюзовая ООО'
И элемент формы с именем "ВидЦен" стал равен 'Оптовая'






