﻿#Область ОписаниеПеременных

Перем КонтекстЯдра;
Перем Утверждения;
Перем УтвержденияПроверкаТаблиц;

#КонецОбласти

#Область ПрограммныйИнтерфейс

#Область ИнтерфейсТестирования

Функция КлючНастройкиУстаревший()
	Возврат "ЗаписьГруппСправочников";
КонецФункции

Функция КлючНастройки()
	Если Не ЗначениеЗаполнено(ИмяТеста) Тогда
		ИмяТеста = Метаданные().Имя;
	КонецЕсли;
	
	Возврат ИмяТеста;
КонецФункции

Процедура Инициализация(КонтекстЯдраПараметр) Экспорт
	
	КонтекстЯдра = КонтекстЯдраПараметр;
	Утверждения = КонтекстЯдра.Плагин("БазовыеУтверждения");
	
	ЗагрузитьНастройки();
	
КонецПроцедуры

Процедура ЗаполнитьНаборТестов(НаборТестов, КонтекстЯдраПараметр) Экспорт
	
	КонтекстЯдра = КонтекстЯдраПараметр;
	ЗапросыИзБД = КонтекстЯдра.Плагин("ЗапросыИзБД");
	ЗапросыИзБД.Инициализация(КонтекстЯдра);
	
	
	ЗагрузитьНастройки();
	
	Если Не НужноВыполнятьТест() Тогда
		Возврат;
	КонецЕсли;
	
	Для Каждого МетаОбъект Из Метаданные.Справочники Цикл
		МожноМенять = ЗапросыИзБД.РазрешеноИзменятьОбъектВМоделиСервиса(МетаОбъект);
		Иерархический = МетаОбъект.Иерархический И МетаОбъект.ВидИерархии = Метаданные.СвойстваОбъектов.ВидИерархии.ИерархияГруппИЭлементов;
		
		Если МожноМенять И Иерархический И ПравоДоступа("Изменение", МетаОбъект)
			И (Не Настройки.ОтборПоПрефиксу ИЛИ СтрНачинаетсяС(ВРег(МетаОбъект.Имя), ВРег(Настройки.Префикс))) Тогда
			
			ДобавитьТестыДляСправочника(НаборТестов, МетаОбъект);
		КонецЕсли;
	КонецЦикла;
	
КонецПроцедуры

#КонецОбласти

#Область Тесты

Процедура ПередЗапускомТеста() Экспорт
	
	НачатьТранзакцию();
	
КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт
	
	Если ТранзакцияАктивна() Тогда
		ОтменитьТранзакцию();
	КонецЕсли;
	
КонецПроцедуры

Процедура Тест_ЗаписатьГруппуСправочника(СправочникСсылка) Экспорт
	
	ГруппаОбъект = СправочникСсылка.ПолучитьОбъект();
	ГруппаОбъект.Записать();
	
КонецПроцедуры

Процедура Тест_ПропуститьЗаписьГруппыСправочника(Знач Сообщение) Экспорт
	
	КонтекстЯдра.ПропуститьТест(Сообщение);
	
КонецПроцедуры

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

#Область Настройки

Процедура ЗагрузитьНастройки()
	
	Если ЗначениеЗаполнено(Настройки) Тогда
		Возврат;
	КонецЕсли;
	
	ПлагинНастройки = КонтекстЯдра.Плагин("Настройки");
	ПлагинНастройки.Инициализация(КонтекстЯдра);
	
	НастройкиПоУмолчанию = НастройкиПоУмолчанию();
	Настройки = ПлагинНастройки.ПолучитьНастройку(КлючНастройки());
	Если Не ЗначениеЗаполнено(Настройки) Тогда
		Настройки = ПлагинНастройки.ПолучитьНастройку(КлючНастройкиУстаревший()); // обратная совместимость
	КонецЕсли;
	Если Не ЗначениеЗаполнено(Настройки) ИЛИ ТипЗнч(Настройки) <> Тип("Структура") Тогда
		Настройки = НастройкиПоУмолчанию;
	КонецЕсли;
	
	ЗаполнитьЗначенияСвойств(НастройкиПоУмолчанию, Настройки);
	Настройки = НастройкиПоУмолчанию;
КонецПроцедуры

Функция НастройкиПоУмолчанию()
	
	Результат = Новый Структура;
	
	Результат.Вставить("Используется", Истина);
	Результат.Вставить("КоличествоПервыхГрупп", 10);
	Результат.Вставить("КоличествоПоследнихГрупп", 10);
	Результат.Вставить("Исключения", Новый Массив);
	Результат.Вставить("Префикс", "");
	Результат.Вставить("ОтборПоПрефиксу", Ложь);
	
	Возврат Результат;
КонецФункции

Функция НужноВыполнятьТест()
	
	ЗагрузитьНастройки();
	
	Если Не ЗначениеЗаполнено(Настройки) Тогда
		Возврат Истина;
	КонецЕсли;
	
	КлючНастройки = КлючНастройки();
	
	ВыполнятьТест = Истина;
	Если ТипЗнч(Настройки) = Тип("Структура")
		И Настройки.Свойство("Используется", ВыполнятьТест) Тогда
		
		Возврат ВыполнятьТест = Истина;
	КонецЕсли;
	
	Возврат Истина;
	
КонецФункции

#КонецОбласти

Процедура ДобавитьТестыДляСправочника(НаборТестов, МетаОбъект)
	
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ ПЕРВЫЕ &КоличествоПервыхГрупп
		|	Ссылка
		|ПОМЕСТИТЬ вт_Первые
		|ИЗ
		|	Справочник." + МетаОбъект.Имя + "
		|ГДЕ
		|	ЭтоГруппа
		|
		|УПОРЯДОЧИТЬ ПО
		|	Ссылка
		|;
		|
		|////////////////////////////////////////////////////////////////////////////////
		|ВЫБРАТЬ ПЕРВЫЕ &КоличествоПоследнихГрупп
		|	Ссылка
		|ПОМЕСТИТЬ вт_Последние
		|ИЗ
		|	Справочник." + МетаОбъект.Имя + "
		|ГДЕ
		|	ЭтоГруппа
		|
		|УПОРЯДОЧИТЬ ПО
		|	Ссылка УБЫВ
		|;
		|
		|////////////////////////////////////////////////////////////////////////////////
		|ВЫБРАТЬ
		|	вт_Первые.Ссылка КАК Ссылка
		|ПОМЕСТИТЬ вт_Все
		|ИЗ
		|	вт_Первые КАК вт_Первые
		|
		|ОБЪЕДИНИТЬ
		|
		|ВЫБРАТЬ
		|	вт_Последние.Ссылка
		|ИЗ
		|	вт_Последние КАК вт_Последние;
		|
		|ВЫБРАТЬ
		|	вт_Все.Ссылка,
		|   ПРЕДСТАВЛЕНИЕ(вт_Все.Ссылка) КАК Представление
		|ИЗ
		|	вт_Все КАК вт_Все";
	
	Запрос.Текст = СтрЗаменить(Запрос.Текст,
			"ВЫБРАТЬ ПЕРВЫЕ &КоличествоПервыхГрупп",
			"ВЫБРАТЬ ПЕРВЫЕ " + Формат(Настройки.КоличествоПервыхГрупп, "ЧГ=")
		);
	Запрос.Текст = СтрЗаменить(Запрос.Текст,
			"ВЫБРАТЬ ПЕРВЫЕ &КоличествоПоследнихГрупп",
			"ВЫБРАТЬ ПЕРВЫЕ " + Формат(Настройки.КоличествоПоследнихГрупп, "ЧГ=")
		);
	РезультатЗапроса = Запрос.Выполнить();
	Если РезультатЗапроса.Пустой() Тогда
		Возврат;
	КонецЕсли;
	
	НаборТестов.НачатьГруппу(МетаОбъект.Синоним + " - Справочник." + МетаОбъект.Имя);
	
	ПредставлениеТеста = "Проверка записи группы справочника - " + МетаОбъект.Имя;
	Сообщение = "Пропускаем из-за исключения по имени справочника - " + ПредставлениеТеста;
	Если ДобавитьТестИсключениеЕслиЕстьВИсключаемойКоллекции(МетаОбъект.Имя, Настройки.Исключения,
			Сообщение, НаборТестов) Тогда
		Возврат;
	КонецЕсли;
	
	Выборка = РезультатЗапроса.Выбрать();
	Пока Выборка.Следующий() Цикл
		ПараметрыТеста = НаборТестов.ПараметрыТеста(Выборка.Ссылка);
		ПредставлениеТеста = "Проверка записи группы справочника - " + Выборка.Представление;
		
		НаборТестов.Добавить("Тест_ЗаписатьГруппуСправочника", ПараметрыТеста, ПредставлениеТеста);
	КонецЦикла;
	
КонецПроцедуры

Функция ДобавитьТестИсключениеЕслиЕстьВИсключаемойКоллекции(Знач ЧтоИщем, Знач КоллекцияДляПоиска, Знач Сообщение,
		Знач НаборТестов)
	
	Если КонтекстЯдра.ЕстьВИсключаемойКоллекции(ЧтоИщем, КоллекцияДляПоиска) Тогда
		КонтекстЯдра.Отладка(Сообщение);
		ПараметрыТеста = НаборТестов.ПараметрыТеста(Сообщение);
		НаборТестов.Добавить("Тест_ПропуститьЗаписьГруппыСправочника", ПараметрыТеста, Сообщение);
		Возврат Истина;
	КонецЕсли;
	
	Возврат Ложь;
КонецФункции

Функция ИмяТеста()
	
	Возврат Метаданные().Имя;
	
КонецФункции

#КонецОбласти