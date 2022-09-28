
// Обслуживание подсистемы УправлениеДоступом
// см. УправлениеДоступомПереопределяемый.ПриЗаполненииВидовДоступа.
//
Процедура ПриЗаполненииВидовДоступа(ВидыДоступа) Экспорт
	
	// Структура предприятия.
	Если ВидыДоступа.Найти("Подразделения", "Имя") = Неопределено Тогда
		ВидДоступа = ВидыДоступа.Добавить();
		ВидДоступа.Имя = "Подразделения";
		ВидДоступа.Представление = НСтр("ru = 'Структура предприятия'");
		ВидДоступа.ТипЗначений = Тип("СправочникСсылка.СтруктураПредприятия");
	КонецЕсли;
	
КонецПроцедуры
