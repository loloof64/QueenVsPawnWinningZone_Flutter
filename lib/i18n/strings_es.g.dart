///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsEs implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsEs _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsPagesEs pages = _TranslationsPagesEs._(_root);
}

// Path: pages
class _TranslationsPagesEs implements TranslationsPagesEn {
	_TranslationsPagesEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsPagesHomeEs home = _TranslationsPagesHomeEs._(_root);
	@override late final _TranslationsPagesGameEs game = _TranslationsPagesGameEs._(_root);
	@override late final _TranslationsPagesSolutionEs solution = _TranslationsPagesSolutionEs._(_root);
}

// Path: pages.home
class _TranslationsPagesHomeEs implements TranslationsPagesHomeEn {
	_TranslationsPagesHomeEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Inicio';
	@override String get new_game => 'Nueva partida';
	@override String get generation_error => 'No se pudo generar el ejercicio. Por favor, inténtalo de nuevo.';
}

// Path: pages.game
class _TranslationsPagesGameEs implements TranslationsPagesGameEn {
	_TranslationsPagesGameEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Juego';
	@override String get instruction => 'Haz clic en todas las celdas de la zona ganadora y validar.';
	@override String get validate => 'Validar';
}

// Path: pages.solution
class _TranslationsPagesSolutionEs implements TranslationsPagesSolutionEn {
	_TranslationsPagesSolutionEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get back_to_home => 'Volver a inicio';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'pages.home.title': return 'Inicio';
			case 'pages.home.new_game': return 'Nueva partida';
			case 'pages.home.generation_error': return 'No se pudo generar el ejercicio. Por favor, inténtalo de nuevo.';
			case 'pages.game.title': return 'Juego';
			case 'pages.game.instruction': return 'Haz clic en todas las celdas de la zona ganadora y validar.';
			case 'pages.game.validate': return 'Validar';
			case 'pages.solution.back_to_home': return 'Volver a inicio';
			default: return null;
		}
	}
}

