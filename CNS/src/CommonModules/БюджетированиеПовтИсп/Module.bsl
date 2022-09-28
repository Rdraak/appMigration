// Проверяет принадлежность объекта метаданных к подсистемам. Проверка производится на вхождение
// в состав указанных подсистем и на вхождение в состав подсистем подчиненных указанным.
//
// Параметры:
//			ПолноеИмяОбъектаМетаданных 	- Строка, полное имя объекта метаданных (см. функцию НайтиПоПолномуИмени).
//			ИменаПодсистем				- Строка, имена подсистем, перечисленные через запятую.
//
// Возвращаемое значение:
//		Булево
//
Функция ОбъектМетаданныхВключенВПодсистемы(ПолноеИмяОбъектаМетаданных, ИменаПодсистем) Экспорт
	
	ЭтоОбъектПодсистемы = Ложь;
	
	МассивИменПодсистем = СтроковыеФункцииКлиентСервер.РазложитьСтрокуВМассивПодстрок(ИменаПодсистем);
	Для каждого ИмяПодсистемы Из МассивИменПодсистем Цикл
		
		МетаданныеПодсистемы = Метаданные.Подсистемы.Найти(ИмяПодсистемы);
		Если МетаданныеПодсистемы <> Неопределено Тогда
			ЭтоОбъектПодсистемы = ОбъектМетаданныхВключенВПодсистему(МетаданныеПодсистемы, ПолноеИмяОбъектаМетаданных);
		КонецЕсли;
		
		Если ЭтоОбъектПодсистемы Тогда
			Прервать;
		КонецЕсли; 
		
	КонецЦикла;
	
	Возврат ЭтоОбъектПодсистемы;
	
КонецФункции

// Проверяет вхождение объекта метаданных в подсистему. Рекурсивно проверяется вхождение
// объекта метаданных в подсистемы подчиненные указанной.
//
// Параметры:
//		МетаданныеПодсистемы	- Метаданные подсистемы.
//		МетаданныеОбъекта		- Метаданные объекта.
//
// Возвращаемое значение:
//		Булево
//
Функция ОбъектМетаданныхВключенВПодсистему(МетаданныеПодсистемы, ПолноеИмяОбъектаМетаданных)
	
	Возврат БюджетированиеПовтИсп.ОбъектыМетаданныхПодсистемы(МетаданныеПодсистемы.ПолноеИмя()).Получить(ПолноеИмяОбъектаМетаданных) = Истина;
	
КонецФункции

Функция ОбъектыМетаданныхПодсистемы(ПолноеИмяОбъектаМетаданныхПодсистемы) Экспорт
	
	СоставОбъектов = Новый Соответствие;
	ЗаполнитьОбъектыПодсистемы(Метаданные.НайтиПоПолномуИмени(ПолноеИмяОбъектаМетаданныхПодсистемы), СоставОбъектов);
	
	Возврат СоставОбъектов;
	
КонецФункции

Процедура ЗаполнитьОбъектыПодсистемы(МетаданныеПодсистемы, КоллекцияИменОбъектов)
	
	Для Каждого ОбъектСостава Из МетаданныеПодсистемы.Состав Цикл
		
		Если ОбъектСостава <> Неопределено Тогда
			КоллекцияИменОбъектов.Вставить(ОбъектСостава.ПолноеИмя(), Истина);
		КонецЕсли;
		
	КонецЦикла;
	
	Для Каждого МетаданныеПодчиненнойПодсистемы Из МетаданныеПодсистемы.Подсистемы Цикл
		ЗаполнитьОбъектыПодсистемы(МетаданныеПодчиненнойПодсистемы, КоллекцияИменОбъектов);
	КонецЦикла;
	
КонецПроцедуры
