﻿#language: ru

@tree

Функционал: создание 10 элементов справочника Номенклатура
Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект>   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Создание элементов справочника Номенклатура
	И Я запоминаю значение выражения '1' в переменную "Шаг"
	И я делаю 10 раз
		И Я запоминаю значение выражения '$Шаг$ + 1' в переменную "Шаг"
		И Я запоминаю значение выражения '"НовыйТовар"+$Шаг$' в переменную "НоваяПозиция"
		И я проверяю или создаю для справочника "Items" объекты:
		| 'Ref'                                                           | 'DeletionMark' | 'ItemType'                                                          | 'Unit'                                                          | 'MainPricture'                          | 'Vendor' | 'ItemID' | 'PackageUnit' | 'Description_en' | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
		| '{"e1cib/data/Catalog.Items?ref="+StrReplace(New UUID,"-","")}' | 'False'        | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6879' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'ValueStorage:AQEIAAAAAAAAAO+7v3siVSJ9' | ''       | ''       | ''            | '$НоваяПозиция$'  | ''                 | ''               | ''               |          |          |          |          |         |




