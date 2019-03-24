﻿
#Область Служебные_функции_и_процедуры

&НаКлиенте
// контекст фреймворка Vanessa-ADD
Перем Ванесса;

&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;

&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-ADD.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;

	ВсеТесты = Новый Массив;

	//описание параметров
	//пример вызова Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,ОписаниеШага,ТипШага,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯУстанавливаюSeverity(Парам01)","ЯУстанавливаюSeverity","Когда Я устанавливаю severity 'critical'","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯУстанавливаюНазваниеФичи(Парам01)","ЯУстанавливаюНазваниеФичи","Когда Я устанавливаю название фичи 'Мой дивный чудный мир'","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯУстанавливаюРучноеВыполнениеСценария()","ЯУстанавливаюРучноеВыполнениеСценария","Когда Я устанавливаю ручное выполнение сценария","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯУстанавливаюМеткеЗначение(Парам01,Парам02)","ЯУстанавливаюМеткеЗначение","Тогда Я устанавливаю метке 'issue' значение 'SUP-123'","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯВызываюИсключениеНеДано()","ЯВызываюИсключениеНеДано","И Я вызываю исключение не дано","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯУстанавливаюСсылкуСИменем()","ЯУстанавливаюСсылкуСИменем","И Я устанавливаю ссылку 'http://test/issue' с именем 'SUP-222'","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯУстанавливаюСсылкуСИменемСТипом()","ЯУстанавливаюСсылкуСИменемСТипом","И Я устанавливаю ссылку 'http://test/issue' с именем 'SUP-222' c типом 'tms'","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПодключаюФайлКШагу()","ЯПодключаюФайлКШагу","И Я подключаю файл '$workspaceRoot/fixtures/file.xls' к шагу 'id'","","");

	Возврат ВсеТесты;
КонецФункции

&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции

&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции

#КонецОбласти



#Область Работа_со_сценариями

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт

КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт

КонецПроцедуры

#КонецОбласти


///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//Когда Я устанавливаю severity 'critical'
//@ЯУстанавливаюSeverity(Парам01)
Процедура ЯУстанавливаюSeverity(Парам01) Экспорт
	ЯУстанавливаюМеткеЗначение("severity", Парам01);
КонецПроцедуры

&НаКлиенте
//Когда Я устанавливаю название фичи 'Мой дивный чудный мир'
//@ЯУстанавливаюНазваниеФичи(Парам01)
Процедура ЯУстанавливаюНазваниеФичи(Парам01) Экспорт
	ЯУстанавливаюМеткеЗначение("feature", Парам01);
КонецПроцедуры

&НаКлиенте
//Когда Я устанавливаю ручное выполнение сценария
//@ЯУстанавливаюРучноеВыполнениеСценария()
Процедура ЯУстанавливаюРучноеВыполнениеСценария() Экспорт
	Ванесса.ПризнакРучногоВыполненияШага = Истина;
КонецПроцедуры

&НаКлиенте
//Тогда Я устанавливаю метке 'issue' значение 'SUP-123'
//@ЯУстанавливаюМеткеЗначение(Парам01,Парам02)
Процедура ЯУстанавливаюМеткеЗначение(Метка, Значение) Экспорт
	СостояниеVanessaBehvior = Ванесса.ПолучитьСостояниеVanessaADD();

	РезультатПрохожденияТестовВСценарии = СостояниеVanessaBehvior["ТекущийСценарий"].РезультатПрохожденияТестовСценария;
	Если НЕ РезультатПрохожденияТестовВСценарии.Свойство("СписокМеток") Тогда
		РезультатПрохожденияТестовВСценарии.Вставить("СписокМеток", Новый СписокЗначений);
	КонецЕсли;

	РезультатПрохожденияТестовВСценарии["СписокМеток"].Добавить(Метка, Значение);

КонецПроцедуры

&НаКлиенте
//И Я вызываю исключение не дано
//@ЯВызываюИсключениеНеДано()
Процедура ЯВызываюИсключениеНеДано() Экспорт
	ВызватьИсключение "Не дано.";
КонецПроцедуры

&НаКлиенте
Процедура ЯУстанавливаюСсылкуСИменемСТипом(Ссылка, Имя, Тип = "issue") Экспорт

	СостояниеVanessaBehvior = Ванесса.ПолучитьСостояниеVanessaADD();

	РезультатПрохожденияТестовВСценарии = СостояниеVanessaBehvior["ТекущийСценарий"].РезультатПрохожденияТестовСценария;
	Если НЕ РезультатПрохожденияТестовВСценарии.Свойство("СписокСсылок") Тогда
		РезультатПрохожденияТестовВСценарии.Вставить("СписокСсылок", Новый СписокЗначений);
	КонецЕсли;

	СтруктураСсылки = Новый Структура("name, url, type", Имя, Ссылка, Тип);
	РезультатПрохожденияТестовВСценарии["СписокСсылок"].Добавить(СтруктураСсылки);

КонецПроцедуры

&НаКлиенте
Процедура ЯУстанавливаюСсылкуСИменем(Ссылка, Имя = "") Экспорт

	ЯУстанавливаюСсылкуСИменемСТипом(Ссылка, Имя);

КонецПроцедуры

&НаКлиенте
Процедура ЯПодключаюФайлКШагу(ПутьКФайлу, ИД = "") Экспорт


	ПлагинАллюра = Ванесса.Плагин("Аллюр2Отчет");
	ПлагинАллюра.ДобавитьФайлКТекущемуШагу(ПутьКФайлу);

КонецПроцедуры