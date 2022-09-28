

&НаСервере
Процедура ОбновитьФИОФизическогоЛица()

	Если Не Объект.Наименование = Объект.ФИО Тогда
		
		СтруктураФИО = ФизическиеЛицаКлиентСервер.ЧастиИмени(Объект.Наименование);
	    Фамилия 	 = СтруктураФИО.Фамилия;
		Имя 		 = СтруктураФИО.Имя;
		Отчество 	 = СтруктураФИО.Отчество;
		Инициалы     = Лев(СтруктураФИО.Имя,1)+"."+Лев(СтруктураФИО.Отчество,1)+".";
		ФИО          = Объект.Наименование;
		
		Модифицированность = Истина;
		
	КонецЕсли;	
		
КонецПроцедуры

&НаКлиенте
Процедура НаименованиеПриИзменении(Элемент)

	ОбновитьФИОФизическогоЛица(); 
	БюджетированиеКлиент.ВводЗначенияПриИзменении(ЭтаФорма, "Объект.Фамилия",  "Фамилия",  Модифицированность);   
	БюджетированиеКлиент.ВводЗначенияПриИзменении(ЭтаФорма, "Объект.Имя",      "Имя",      Модифицированность);   
	БюджетированиеКлиент.ВводЗначенияПриИзменении(ЭтаФорма, "Объект.Отчество", "Отчество", Модифицированность);   
	БюджетированиеКлиент.ВводЗначенияПриИзменении(ЭтаФорма, "Объект.Инициалы", "Инициалы", Модифицированность);   
	БюджетированиеКлиент.ВводЗначенияПриИзменении(ЭтаФорма, "Объект.ФИО", 	   "ФИО", Модифицированность);   

КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)

	Если Не ПустаяСтрока(Объект.ФИО) ИЛИ Не ПустаяСтрока(Объект.Наименование) Тогда 
		
		Если ПустаяСтрока(Объект.Фамилия) ИЛИ ПустаяСтрока(Объект.Имя)
				ИЛИ ПустаяСтрока(Объект.Отчество) ИЛИ ПустаяСтрока(Объект.ФИО) 
				ИЛИ ПустаяСтрока(Объект.Инициалы) Тогда
				
			Если Не ПустаяСтрока(Объект.ФИО) Тогда	
				СтруктураФИО = ФизическиеЛицаКлиентСервер.ЧастиИмени(Объект.ФИО);
				ФИО 	 = Объект.ФИО;	
			ИначеЕсли Не ПустаяСтрока(Объект.Наименование) Тогда
				СтруктураФИО = ФизическиеЛицаКлиентСервер.ЧастиИмени(Объект.Наименование);
				ФИО 	 = Объект.Наименование;
			КонецЕсли;	
		    Фамилия 	 = СтруктураФИО.Фамилия;
			Имя 		 = СтруктураФИО.Имя;
			Отчество 	 = СтруктураФИО.Отчество;
			Инициалы     = Лев(СтруктураФИО.Имя,1)+"."+Лев(СтруктураФИО.Отчество,1)+".";
			Модифицированность = Истина;
		Иначе
			Фамилия 	 = Объект.Фамилия;
			Имя 		 = Объект.Имя;
			Отчество 	 = Объект.Отчество;
			Инициалы     = Объект.Инициалы;
			ФИО 		 = Объект.ФИО;
	    КонецЕсли;
	КонецЕсли; 
	
	// Обработчик подсистемы "ВерсионированиеОбъектов".
	ВерсионированиеОбъектов.ПриСозданииНаСервере(ЭтаФорма);
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	
	МенятьФИО = Ложь;
	МенятьНаименование = Истина;
	
	Если Не ПустаяСтрока(ТекущийОбъект.ФИО) ИЛИ Не ПустаяСтрока(ТекущийОбъект.Наименование) Тогда 
		
		Если ПустаяСтрока(ТекущийОбъект.Фамилия) ИЛИ ПустаяСтрока(ТекущийОбъект.Имя)
				ИЛИ ПустаяСтрока(ТекущийОбъект.Отчество) ИЛИ ПустаяСтрока(ТекущийОбъект.ФИО) 
				ИЛИ ПустаяСтрока(ТекущийОбъект.Инициалы) Тогда
				
			Если Не ПустаяСтрока(ТекущийОбъект.ФИО) Тогда	
				СтруктураФИО = ФизическиеЛицаКлиентСервер.ЧастиИмени(ТекущийОбъект.ФИО);
				ТекущийОбъект.Наименование = ТекущийОбъект.ФИО;
			ИначеЕсли Не ПустаяСтрока(ТекущийОбъект.Наименование) Тогда
				СтруктураФИО = ФизическиеЛицаКлиентСервер.ЧастиИмени(ТекущийОбъект.Наименование); 
				ТекущийОбъект.ФИО = ТекущийОбъект.Наименование; 
			КонецЕсли;	
			
		    ТекущийОбъект.Фамилия 	 = СтруктураФИО.Фамилия;
			ТекущийОбъект.Имя 		 = СтруктураФИО.Имя;
			ТекущийОбъект.Отчество 	 = СтруктураФИО.Отчество;
			ТекущийОбъект.Инициалы   = Лев(СтруктураФИО.Имя,1)+"."+Лев(СтруктураФИО.Отчество,1)+".";
	
		КонецЕсли;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ФИОПриИзменении(Элемент)

	ОбновитьФИОФизическогоЛица(); 
	БюджетированиеКлиент.ВводЗначенияПриИзменении(ЭтаФорма, "Объект.Фамилия",  "Фамилия",  Модифицированность);   
	БюджетированиеКлиент.ВводЗначенияПриИзменении(ЭтаФорма, "Объект.Имя",      "Имя",      Модифицированность);   
	БюджетированиеКлиент.ВводЗначенияПриИзменении(ЭтаФорма, "Объект.Отчество", "Отчество", Модифицированность);   
	БюджетированиеКлиент.ВводЗначенияПриИзменении(ЭтаФорма, "Объект.Инициалы", "Инициалы", Модифицированность);   
	БюджетированиеКлиент.ВводЗначенияПриИзменении(ЭтаФорма, "Объект.ФИО", 	   "ФИО", Модифицированность);   

КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
	// СтандартныеПодсистемы.УправлениеДоступом
	Если ОбщегоНазначения.ПодсистемаСуществует("СтандартныеПодсистемы.УправлениеДоступом") Тогда
		МодульУправлениеДоступом = ОбщегоНазначения.ОбщийМодуль("УправлениеДоступом");
		МодульУправлениеДоступом.ПриЧтенииНаСервере(ЭтотОбъект, ТекущийОбъект);
	КонецЕсли;
	// Конец СтандартныеПодсистемы.УправлениеДоступом
	
КонецПроцедуры

&НаСервере
Процедура ПослеЗаписиНаСервере(ТекущийОбъект, ПараметрыЗаписи)
	
	// СтандартныеПодсистемы.УправлениеДоступом
	Если ОбщегоНазначения.ПодсистемаСуществует("СтандартныеПодсистемы.УправлениеДоступом") Тогда
		МодульУправлениеДоступом = ОбщегоНазначения.ОбщийМодуль("УправлениеДоступом");
		МодульУправлениеДоступом.ПослеЗаписиНаСервере(ЭтотОбъект, ТекущийОбъект, ПараметрыЗаписи);
	КонецЕсли;
	// Конец СтандартныеПодсистемы.УправлениеДоступом
	
КонецПроцедуры
