#Область УправлениеДоступом

// См. УправлениеДоступомПереопределяемый.ПриЗаполненииВидовДоступа.
Процедура ПриЗаполненииВидовДоступа(ВидыДоступа) Экспорт
	
	// Потенциально могут быть добавлены и другой библиотекой, поэтому добавляем с проверкой.
	
	// Организации.
	Если ВидыДоступа.Найти("Организации", "Имя") = Неопределено Тогда
		ВидДоступа = ВидыДоступа.Добавить();
		ВидДоступа.Имя = "Организации";
		ВидДоступа.Представление = НСтр("ru = 'Организации'");
		ВидДоступа.ТипЗначений   = Тип("СправочникСсылка.Организации");
	КонецЕсли;
	
	// Физические лица.
	Если ВидыДоступа.Найти("ГруппыФизическихЛиц", "Имя") = Неопределено Тогда
		ВидДоступа = ВидыДоступа.Добавить();
		ВидДоступа.Имя = "ГруппыФизическихЛиц";
		ВидДоступа.Представление = НСтр("ru = 'Группы физических лиц'");
		ВидДоступа.ТипЗначений = Тип("СправочникСсылка.ФизическиеЛица");
		ВидДоступа.ТипГруппЗначений = Тип("СправочникСсылка.ГруппыДоступаФизическихЛиц");
	КонецЕсли;
	
	// Подразделения организаций.
	Если ВидыДоступа.Найти("ПодразделенияОрганизаций", "Имя") = Неопределено Тогда
		ВидДоступа = ВидыДоступа.Добавить();
		ВидДоступа.Имя = "ПодразделенияОрганизаций";
		ВидДоступа.Представление = НСтр("ru = 'Подразделения организаций'");
		ВидДоступа.ТипЗначений = Тип("СправочникСсылка.ПодразделенияОрганизаций");
	КонецЕсли;
	
	// Подразделения организаций.
	Если ВидыДоступа.Найти("МестаВозникновенияЗатрат", "Имя") = Неопределено Тогда
		ВидДоступа = ВидыДоступа.Добавить();
		ВидДоступа.Имя = "МестаВозникновенияЗатрат";
		ВидДоступа.Представление = НСтр("ru = 'Места возникновения затрат'");
		ВидДоступа.ТипЗначений = Тип("СправочникСсылка.МестаВозникновенияЗатрат");
	КонецЕсли;
	
КонецПроцедуры

Процедура ПриЗаполненииВидовОграниченийПравОбъектовМетаданных(Описание) Экспорт
	
	// Бюджетирование
	Описание = Описание + "
	|РегистрСведений.НастройкиБюджетированияРасширенная.Чтение.Организации
	|РегистрСведений.НастройкиБюджетированияРасширенная.Изменение.Организации
	|РегистрСведений.КадровыеСведенияСотрудниковОрганизаций.Чтение.ГруппыФизическихЛиц
	|РегистрСведений.КадровыеСведенияСотрудниковОрганизаций.Чтение.Организации
	|РегистрСведений.КадровыеСведенияСотрудниковОрганизаций.Изменение.ГруппыФизическихЛиц
	|РегистрСведений.КадровыеСведенияСотрудниковОрганизаций.Изменение.Организации
	|РегистрНакопления.РасчетыПоказателейБюджетовПрогнозов.Чтение.ГруппыФизическихЛиц
	|РегистрНакопления.РасчетыПоказателейБюджетовПрогнозов.Чтение.Организации
	|РегистрНакопления.РасчетыПоказателейБюджетовПрогнозов.Изменение.ГруппыФизическихЛиц
	|РегистрНакопления.РасчетыПоказателейБюджетовПрогнозов.Изменение.Организации
	|РегистрНакопления.РасчетыПоказателейРезервов.Чтение.ГруппыФизическихЛиц
	|РегистрНакопления.РасчетыПоказателейРезервов.Чтение.Организации
	|РегистрНакопления.РасчетыПоказателейРезервов.Изменение.ГруппыФизическихЛиц
	|РегистрНакопления.РасчетыПоказателейРезервов.Изменение.Организации
	|";
	// Конец Бюджетирование
	
	// Бюджетирование.ВводДанных
	Описание = Описание + " 
	|Документ.ЗагрузочнаяТаблица.Чтение.ГруппыФизическихЛиц
	|Документ.ЗагрузочнаяТаблица.Чтение.ПодразделенияОрганизаций
	|Документ.ЗагрузочнаяТаблица.Чтение.Организации 
	|Документ.ЗагрузочнаяТаблица.Изменение.ГруппыФизическихЛиц
	|Документ.ЗагрузочнаяТаблица.Изменение.ПодразделенияОрганизаций
	|Документ.ЗагрузочнаяТаблица.Изменение.Организации 
	|Документ.РасчетПоказателейБюджетовПрогнозов.Чтение.ГруппыФизическихЛиц
	|Документ.РасчетПоказателейБюджетовПрогнозов.Чтение.ПодразделенияОрганизаций
	|Документ.РасчетПоказателейБюджетовПрогнозов.Чтение.Организации
	|Документ.РасчетПоказателейБюджетовПрогнозов.Изменение.ГруппыФизическихЛиц
	|Документ.РасчетПоказателейБюджетовПрогнозов.Изменение.ПодразделенияОрганизаций
	|Документ.РасчетПоказателейБюджетовПрогнозов.Изменение.Организации
	|Документ.БюджетПрогнозПоНачислению.Чтение.Организации
	|Документ.БюджетПрогнозПоНачислению.Изменение.Организации
	|Документ.БюджетПрогнозПоНачислению.Чтение.ПодразделенияОрганизаций
	|Документ.БюджетПрогнозПоНачислению.Изменение.ПодразделенияОрганизаций
	|Документ.БюджетПрогнозПоОплате.Чтение.Организации
	|Документ.БюджетПрогнозПоОплате.Изменение.Организации 
	|Документ.БюджетПрогнозПоОплате.Чтение.ПодразделенияОрганизаций
	|Документ.БюджетПрогнозПоОплате.Изменение.ПодразделенияОрганизаций 
	|Документ.РасчетРезерва.Чтение.Организации
	|Документ.РасчетРезерва.Изменение.Организации
	|Документ.РасчетРезерва.Чтение.ГруппыФизическихЛиц
	|Документ.РасчетРезерва.Изменение.ГруппыФизическихЛиц
	|Документ.РасчетРезерва.Чтение.ПодразделенияОрганизаций
	|Документ.РасчетРезерва.Изменение.ПодразделенияОрганизаций  
	|ЖурналДокументов.ВсеБюджетныеДокументы.Чтение.ГруппыФизическихЛиц   
	|ЖурналДокументов.ВсеБюджетныеДокументы.Чтение.Организации
	|";
	// Бюджетирование.ВводДанных
	
	// Бюджетирование.Справочники
	Описание = Описание + "
	|Справочник.ВнешниеПользователи.Изменение.ВнешниеПользователи
	|Справочник.ГруппыВнешнихПользователей.Чтение.ВнешниеПользователи
	|Справочник.ГруппыПользователей.Чтение.Пользователи
	|Справочник.Пользователи.Чтение.Пользователи
	|Справочник.Пользователи.Изменение.Пользователи
    |Справочник.Организации.Чтение.Организации
    |Справочник.Организации.Изменение.Организации
	|Справочник.ПодразделенияОрганизаций.Чтение.Организации
	|Справочник.ПодразделенияОрганизаций.Изменение.Организации
	|Справочник.ФизическиеЛица.Чтение.ГруппыФизическихЛиц
	|Справочник.ФизическиеЛица.Изменение.ГруппыФизическихЛиц
	|Справочник.МестаВозникновенияЗатрат.Чтение.Организации
	|Справочник.МестаВозникновенияЗатрат.Изменение.Организации 
	|Справочник.ПозицииШтатногоРасписания.Чтение.Организации
	|Справочник.ПозицииШтатногоРасписания.Изменение.Организации
	|";
	// Конец Бюджетирование.Справочники
	
	// Бюджетирование.ФормированиеБюджетовПрогнозов
	Описание = Описание + "
	|";
	// Конец Бюджетирование.ФормированиеБюджетовПрогнозов
	
	// Бюджетирование.ФормированиеБюджетовПрогнозов.ФункциональныеБюджетыПрогнозы
	Описание = Описание + "
	|";
	// Конец Бюджетирование.ФормированиеБюджетовПрогнозов.ФункциональныеБюджетыПрогнозы
	
	// Бюджетирование.ФормированиеБюджетовПрогнозов.МастерБюджетыПрогнозы
	Описание = Описание + "
	|";
	// Конец Бюджетирование.ФормированиеБюджетовПрогнозов.МастерБюджетыПрогнозы
	
	// Бюджетирование.АнализБюджетовПрогнозов
	Описание = Описание + "
	|";
	// Конец Бюджетирование.АнализБюджетовПрогнозов
	
	// Бюджетирование.НалогиТарифы
	Описание = Описание + "
	|";
	// Конец Бюджетирование.НалогиТарифы
	
	// Бюджетирование.НачисленияКоэффициенты
	Описание = Описание + "
	|";
	// Конец Бюджетирование.НачисленияКоэффициенты
	
	// Бюджетирование.АналитическиеОтчеты
	Описание = Описание + "
	|";
	// Конец Бюджетирование.АналитическиеОтчеты
	
	// БюджетированиеПодсистемы
	Описание = Описание + "
	|";
	// Конец БюджетированиеПодсистемы
	
	// БюджетированиеПриложения
	Описание = Описание + "
	|";
	// Конец БюджетированиеПриложения
	
	// БюджетированиеПриложения.КонфигурацииБюджетированиеРасширенная
	Описание = Описание + "
	|";
	// Конец БюджетированиеПриложения.КонфигурацииБюджетированиеРасширенная
	
	// БюджетированиеПриложения.ОрганизационнаяСтруктура
	Описание = Описание + "
	|";
	// Конец БюджетированиеПриложения.ОрганизационнаяСтруктура
	
	// БюджетированиеПриложения.ОтложенноеПроведениеДокументов
	Описание = Описание + "
	|";
	// Конец БюджетированиеПриложения.ОтложенноеПроведениеДокументов
	
	// БюджетированиеПриложения.МногопотоковоеЗаполнениеДокументов
	Описание = Описание + "
	|";
	// Конец БюджетированиеПриложения.МногопотоковоеЗаполнениеДокументов
	
	// БюджетированиеПриложения.БазовыеСправочныеДанные
	Описание = Описание + "
	|";
	// Конец БюджетированиеПриложения.БазовыеСправочныеДанные
	
	// БюджетированиеПриложения.БазовыеСправочныеДанные.Организации
	Описание = Описание + "
	|";
	// Конец БюджетированиеПриложения.БазовыеСправочныеДанные.Организации
	
	// БюджетированиеРасширеннаяПодсистемы
	Описание = Описание + "
	|";
	// Конец БюджетированиеРасширеннаяПодсистемы
	
	// БюджетированиеРасширеннаяПодсистемы.РасчетБюджетированиеРасширенная
	Описание = Описание + "
	|";
	// Конец БюджетированиеРасширеннаяПодсистемы.РасчетБюджетированиеРасширенная
	
	// АнализБюджетовПрогнозов
	Описание = Описание + "
	|";
	// Конец АнализБюджетовПрогнозов
	
КонецПроцедуры

Процедура ПриЗаполненииСписковСОграничениемДоступа(Списки) Экспорт
	
	// Бюджетирование
	Списки.Вставить(Метаданные.РегистрыСведений.КадровыеСведенияСотрудниковОрганизаций, Истина);
	Списки.Вставить(Метаданные.РегистрыСведений.НастройкиБюджетированияРасширенная, Истина);
	Списки.Вставить(Метаданные.РегистрыНакопления.РасчетыПоказателейБюджетовПрогнозов, Истина);
	Списки.Вставить(Метаданные.РегистрыНакопления.РасчетыПоказателейРезервов, Истина);
	
	Списки.Вставить(Метаданные.Справочники.ПодразделенияОрганизаций, Истина);
	Списки.Вставить(Метаданные.Справочники.Организации, Истина);
	Списки.Вставить(Метаданные.Справочники.ФизическиеЛица, Истина);
	Списки.Вставить(Метаданные.Справочники.МестаВозникновенияЗатрат, Истина);
	Списки.Вставить(Метаданные.Справочники.ПозицииШтатногоРасписания, Истина);
	
	Списки.Вставить(Метаданные.Документы.БюджетПрогнозПоНачислению, Истина);
	Списки.Вставить(Метаданные.Документы.БюджетПрогнозПоОплате, Истина);
	Списки.Вставить(Метаданные.Документы.ЗагрузочнаяТаблица, Истина);
	Списки.Вставить(Метаданные.Документы.РасчетПоказателейБюджетовПрогнозов, Истина);
	Списки.Вставить(Метаданные.Документы.РасчетРезерва, Истина);
	Списки.Вставить(Метаданные.ЖурналыДокументов.ВсеБюджетныеДокументы, Истина);
	// Конец Бюджетирование
	

КонецПроцедуры	

Процедура ПриЗаполненииОграниченияДоступа(Список, Ограничение) Экспорт

	Бюджетирование.ПриЗаполненииОграниченияДоступа(Список, Ограничение);
	
КонецПроцедуры	

Процедура ПриЗаполненииИспользованияВидаДоступа(ИмяВидаДоступа, Использование) Экспорт
	
	Если ИмяВидаДоступа = "ГруппыФизическихЛиц" Тогда
		Использование = Константы.ОграничиватьДоступНаУровнеЗаписейФизическиеЛица.Получить();
	ИначеЕсли ИмяВидаДоступа = "ПодразделенияОрганизаций" Тогда
		Использование = Константы.ОграничиватьДоступНаУровнеЗаписейПодразделенияОрганизаций.Получить();
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область БлокФункцийПолученияЗначенийПоУмолчанию

Процедура ПолучитьЗначенияПоУмолчанию(ЗаполняемыеЗначения, ДатаЗначений) Экспорт
	
	Если ЗаполняемыеЗначения.Свойство("Год") Тогда
		ЗаполняемыеЗначения.Год = Год(ДатаЗначений);
	КонецЕсли;
	Если ЗаполняемыеЗначения.Свойство("Месяц") Тогда
		ЗаполняемыеЗначения.Месяц = НачалоМесяца(ДатаЗначений);
	КонецЕсли;
		Если ЗаполняемыеЗначения.Свойство("Квартал") Тогда
		ЗаполняемыеЗначения.Квартал = НачалоКвартала(ДатаЗначений);
	КонецЕсли;
	Если ЗаполняемыеЗначения.Свойство("ПредыдущийГод") Тогда
		ЗаполняемыеЗначения.ПредыдущийГод = Год(ДатаЗначений) - 1;
	КонецЕсли;
	Если ЗаполняемыеЗначения.Свойство("ПредыдущийМесяц") Тогда
		ЗаполняемыеЗначения.ПредыдущийМесяц = НачалоМесяца(НачалоМесяца(ДатаЗначений) - 1);
	КонецЕсли;
	Если ЗаполняемыеЗначения.Свойство("ПредыдущийКвартал") Тогда
		ЗаполняемыеЗначения.ПредыдущийКвартал = НачалоКвартала(НачалоКвартала(ДатаЗначений) - 1);
	КонецЕсли;
	Если ЗаполняемыеЗначения.Свойство("ДатаСобытия") Тогда
		ЗаполняемыеЗначения.ДатаСобытия = ДатаЗначений;
	КонецЕсли;
	Если ЗаполняемыеЗначения.Свойство("Ответственный") Тогда
		ЗаполняемыеЗначения.Ответственный = Пользователи.ТекущийПользователь();
	КонецЕсли;
	
	Если ЗаполняемыеЗначения.Свойство("МесяцРасчета") Тогда
		ЗаполняемыеЗначения.МесяцРасчета = НачалоМесяца(ДатаЗначений);
		// Для упрощения берем усредненный день планируемой выплаты начислений
		ДеньВыплатыНачислений = 13;
		Если День(ДатаЗначений) <= ДеньВыплатыНачислений Тогда
			ЗаполняемыеЗначения.МесяцРасчета = ДобавитьМесяц(ЗаполняемыеЗначения.МесяцРасчета, -1);
		КонецЕсли;
	КонецЕсли;
	
	// Значение организации известно - получим зависящие от нее значения.
	ОрганизацияСсылка = НеОпределено;
	Если (ЗаполняемыеЗначения.Свойство("Организация", ОрганизацияСсылка) И ЗначениеЗаполнено(ОрганизацияСсылка)) Тогда
		
	КонецЕсли;
	
	Если ЗаполняемыеЗначения.Свойство("Организация") И НЕ ЗначениеЗаполнено(ЗаполняемыеЗначения["Организация"]) Тогда
		ЗаполняемыеЗначения.Организация = Справочники.Организации.ПустаяСсылка();
	КонецЕсли;
	
	Если ЗаполняемыеЗначения.Свойство("Подразделение") И НЕ ЗначениеЗаполнено(ЗаполняемыеЗначения["Подразделение"]) Тогда
		ЗаполняемыеЗначения.Подразделение = Справочники.ПодразделенияОрганизаций.ПустаяСсылка();
	КонецЕсли;
	
	Если ЗаполняемыеЗначения.Свойство("ГруппаДоступа") И НЕ ЗначениеЗаполнено(ЗаполняемыеЗначения["ГруппаДоступа"]) Тогда
		ЗаполняемыеЗначения.ГруппаДоступа = Справочники.ГруппыДоступаФизическихЛиц.ПустаяСсылка();
	КонецЕсли;
	
	Если ЗаполняемыеЗначения.Свойство("Руководитель") И НЕ ЗначениеЗаполнено(ЗаполняемыеЗначения["Руководитель"]) Тогда
		ЗаполняемыеЗначения.Руководитель = Справочники.ФизическиеЛица.ПустаяСсылка();
	КонецЕсли;
	
	Если ЗаполняемыеЗначения.Свойство("ДолжностьРуководителя") И НЕ ЗначениеЗаполнено(ЗаполняемыеЗначения["ДолжностьРуководителя"]) Тогда
		ЗаполняемыеЗначения.ДолжностьРуководителя = Справочники.Должности.ПустаяСсылка();
	КонецЕсли;
	
	Если ЗаполняемыеЗначения.Свойство("ГлавныйБухгалтер") И НЕ ЗначениеЗаполнено(ЗаполняемыеЗначения["ГлавныйБухгалтер"]) Тогда
		ЗаполняемыеЗначения.ГлавныйБухгалтер = Справочники.ФизическиеЛица.ПустаяСсылка();
	КонецЕсли;
	
	Если ЗаполняемыеЗначения.Свойство("Кассир") И НЕ ЗначениеЗаполнено(ЗаполняемыеЗначения["Кассир"]) Тогда
		ЗаполняемыеЗначения.Кассир = Справочники.ФизическиеЛица.ПустаяСсылка();
	КонецЕсли;
	
	Если ЗаполняемыеЗначения.Свойство("ДолжностьКассира") И НЕ ЗначениеЗаполнено(ЗаполняемыеЗначения["ДолжностьКассира"]) Тогда
		ЗаполняемыеЗначения.ДолжностьКассира = Справочники.Должности.ПустаяСсылка();
	КонецЕсли;
	
	Если ЗаполняемыеЗначения.Свойство("КоличествоСтавок") Тогда
		ЗаполняемыеЗначения.КоличествоСтавок = 1;
	КонецЕсли;
	
КонецПроцедуры

// Массив поддерживаемых идентификаторов значений по умолчанию.
Функция СписокДоступныхЗначенийПоУмолчанию() Экспорт
	
	ПоддерживаемыеИдентификаторы = Новый Массив();
	ПоддерживаемыеИдентификаторы.Добавить("Год");
	ПоддерживаемыеИдентификаторы.Добавить("Квартал");
	ПоддерживаемыеИдентификаторы.Добавить("Месяц");
	ПоддерживаемыеИдентификаторы.Добавить("ПредыдущийГод");
	ПоддерживаемыеИдентификаторы.Добавить("ПредыдущийМесяц");
	ПоддерживаемыеИдентификаторы.Добавить("ПредыдущийКвартал");
	ПоддерживаемыеИдентификаторы.Добавить("МесяцРасчета");
	ПоддерживаемыеИдентификаторы.Добавить("ДатаСобытия");
	ПоддерживаемыеИдентификаторы.Добавить("Ответственный");
	ПоддерживаемыеИдентификаторы.Добавить("Организация");
	ПоддерживаемыеИдентификаторы.Добавить("Руководитель");
	ПоддерживаемыеИдентификаторы.Добавить("ДолжностьРуководителя");
	ПоддерживаемыеИдентификаторы.Добавить("Подразделение");
	ПоддерживаемыеИдентификаторы.Добавить("ГруппаДоступа");
	ПоддерживаемыеИдентификаторы.Добавить("КоличествоСтавок");
	Возврат ПоддерживаемыеИдентификаторы;
	
КонецФункции

// Текущий расчетный месяц по умолчанию
Функция РасчетныйМесяц(Дата) Экспорт
	
	РасчетныйМесяц = НачалоМесяца(Дата);
	// Дефолтное значение
	ДеньВыплатыНачислений = 13;
	Если День(Дата) <= ДеньВыплатыНачислений Тогда
		РасчетныйМесяц = ДобавитьМесяц(РасчетныйМесяц, -1);
	КонецЕсли;
	
	Возврат РасчетныйМесяц;
	
КонецФункции

#КонецОбласти

#Область РаботаСДаннымиЭлементовСправочников

&НаСервере
Функция ДобавитьЛидирующиеНули(КодЧисло) Экспорт
	
	СтрокаЛидирующихНулей = "";
	
	ДлинаНомера = СтрДлина(Строка(КодЧисло));
	
	Пока ДлинаНомера < 4 Цикл
		
		СтрокаЛидирующихНулей = СтрокаЛидирующихНулей + "0";
		ДлинаНомера = СтрДлина(СтрокаЛидирующихНулей + Строка(КодЧисло));
		
	КонецЦикла;
	
	Возврат СтрокаЛидирующихНулей;
	
КонецФункции
	
&НаСервере
Функция ПолучитьНовыйКодПоМаске(ОрганизацияСсылка) Экспорт

	Запрос = Новый Запрос("ВЫБРАТЬ
	                      |	ПОДСТРОКА(ПодразделенияОрганизаций.Код, 6, ДЛИНАСТРОКИ(ПодразделенияОрганизаций.Код) - 5) КАК Код
	                      |ИЗ
	                      |	Справочник.ПодразделенияОрганизаций КАК ПодразделенияОрганизаций
	                      |ГДЕ
	                      |	ПодразделенияОрганизаций.Владелец = &Организация");
	
	Запрос.УстановитьПараметр("Организация", ОрганизацияСсылка);
	
	ТаблицаНомеров = Запрос.Выполнить().Выгрузить();
	
	МаксНомер = 0;
	
	Для Каждого ТекущийНомер Из ТаблицаНомеров Цикл
		
		ТекущийНомер = ?(ПустаяСтрока(ТекущийНомер.Код),0,Число(ТекущийНомер.Код));
		
		Если ТекущийНомер > МаксНомер Тогда
			МаксНомер = ТекущийНомер;	
		КонецЕсли;	
			
	КонецЦикла;
	
	Если МаксНомер = 0 Тогда
		СуффиксНомера = "0001";
	Иначе
		СуффиксНомера = ДобавитьЛидирующиеНули(МаксНомер + 1) + Строка(МаксНомер + 1);
	КонецЕсли;
	
	ПрефиксНомера = ДобавитьЛидирующиеНули(Число(ОрганизацияСсылка.Код))+Строка(Число(ОрганизацияСсылка.Код));
	
	Возврат ПрефиксНомера + "." + СуффиксНомера;
	
КонецФункции	


#КонецОбласти