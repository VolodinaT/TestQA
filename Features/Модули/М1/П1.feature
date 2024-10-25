﻿#language: ru

@tree

Функционал: Проверка расчета суммы документа Заказ

Как администратор я хочу
проверять расчет суммы документа Заказ при изменении количества и цены 
чтобы избежать ошибок при создании Заказа   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: создание документа Заказ
    * Открытие формы создания документа
		Когда В панели разделов я выбираю "Продажи"
		И В командном интерфейсе я выбираю "Продажи" "Заказы"
		Тогда открылось окно "Заказы товаров"
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Заказ (создание)"
		И из выпадающего списка с именем 'Организация' я выбираю точное значение "ООО \"Товары\""
		И из выпадающего списка с именем 'Покупатель' я выбираю точное значение "Магазин \"Обувь\""
		И из выпадающего списка с именем 'Склад' я выбираю точное значение "Склад отдела продаж"
		И из выпадающего списка с именем 'Валюта' я выбираю точное значение "Рубли"
	* Заполнение товарной части
		И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
		Тогда открылось окно "Товары"
		И я нажимаю на кнопку с именем 'ФормаСписок'
		И в таблице 'Список' я перехожу к строке:
			| "Код"       | "Наименование" |
			| "000000031" | "Босоножки"    |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Заказ (создание) *"
		И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
		И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "2"
		И я перехожу к следующему реквизиту
		И в таблице 'Товары' я активизирую поле с именем 'ТоварыЦена'
		И в таблице 'Товары' в поле с именем 'ТоварыЦена' я ввожу текст "1 000,00"
		И я перехожу к следующему реквизиту
		И в таблице 'Товары' я завершаю редактирование строки
	* Проверка заполнения табличной части	
		Тогда таблица 'Товары' содержит строки:
			| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'    |
			| 'Босоножки' | '1 000,00' | '2'          | '2 000,00' |
	* Проверка изменения поля количество
		И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
		И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "3"
		И в таблице 'Товары' я завершаю редактирование строки
		Тогда таблица 'Товары' стала равной:
			| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'    |
			| 'Босоножки' | '1 000,00' | '3'          | '3 000,00' |
	* Проверка изменения поля цена
		И в таблице 'Товары' я активизирую поле с именем 'ТоварыЦена'
		И в таблице 'Товары' в поле с именем 'ТоварыЦена' я ввожу текст "2000"
		И в таблице 'Товары' я завершаю редактирование строки
		Тогда таблица 'Товары' стала равной:
			| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'    |
			| 'Босоножки' | '2 000,00' | '3'          | '6 000,00' |
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
	* Номер
		И я запоминаю значение поля "Номер" как "$Номер$"
    * Проведение документа	
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна "Заказ *" в течение 20 секунд
    * Проверка создания документа
		И таблица "Список" содержит строки:
			| 'Номер'     |
			| '$Номер$'   |