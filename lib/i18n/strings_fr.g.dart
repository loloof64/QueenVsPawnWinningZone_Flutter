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
class TranslationsFr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsFr _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsCommonFr common = _TranslationsCommonFr._(_root);
	@override late final _TranslationsPagesFr pages = _TranslationsPagesFr._(_root);
}

// Path: common
class _TranslationsCommonFr implements TranslationsCommonEn {
	_TranslationsCommonFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsCommonButtonsFr buttons = _TranslationsCommonButtonsFr._(_root);
}

// Path: pages
class _TranslationsPagesFr implements TranslationsPagesEn {
	_TranslationsPagesFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsPagesHomeFr home = _TranslationsPagesHomeFr._(_root);
	@override late final _TranslationsPagesGameFr game = _TranslationsPagesGameFr._(_root);
	@override late final _TranslationsPagesSolutionFr solution = _TranslationsPagesSolutionFr._(_root);
}

// Path: common.buttons
class _TranslationsCommonButtonsFr implements TranslationsCommonButtonsEn {
	_TranslationsCommonButtonsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get close => 'Fermer';
}

// Path: pages.home
class _TranslationsPagesHomeFr implements TranslationsPagesHomeEn {
	_TranslationsPagesHomeFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Accueil';
	@override String get new_game => 'Nouvelle partie';
	@override String get generation_error => 'Échec de génération de l\'exercice. Veuillez réessayer.';
}

// Path: pages.game
class _TranslationsPagesGameFr implements TranslationsPagesGameEn {
	_TranslationsPagesGameFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Jeu';
	@override String get instruction => 'Veuillez cliquer sur toutes les cases de la zone gagnante et valider.';
	@override String get validate => 'Valider';
	@override String get help_title => 'Règles';
	@override String get help_sentence_1 => 'On vous présente une position de la finale d\'échecs dame contre pion, où le pion menace de faire promotion et la dame ne peut empêcher seule ce plan.';
	@override String get help_sentence_2 => 'Votre objectif est de définir la zone de gain pour le camp fort : l\'ensemble des cases depuis lesquelles le roi peut soit aider à arrêter le pion soit aider à mater le roi adverse.';
}

// Path: pages.solution
class _TranslationsPagesSolutionFr implements TranslationsPagesSolutionEn {
	_TranslationsPagesSolutionFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get back_to_home => 'Retour à l\'accueil';
	@override String get see_legend => 'Légende';
	@override String get correct_cell => 'Case correcte';
	@override String get wrong_cell => 'Case fausse';
	@override String get missed_cell => 'Case oubliée';
	@override String get legend_title => 'Légende';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.buttons.close': return 'Fermer';
			case 'pages.home.title': return 'Accueil';
			case 'pages.home.new_game': return 'Nouvelle partie';
			case 'pages.home.generation_error': return 'Échec de génération de l\'exercice. Veuillez réessayer.';
			case 'pages.game.title': return 'Jeu';
			case 'pages.game.instruction': return 'Veuillez cliquer sur toutes les cases de la zone gagnante et valider.';
			case 'pages.game.validate': return 'Valider';
			case 'pages.game.help_title': return 'Règles';
			case 'pages.game.help_sentence_1': return 'On vous présente une position de la finale d\'échecs dame contre pion, où le pion menace de faire promotion et la dame ne peut empêcher seule ce plan.';
			case 'pages.game.help_sentence_2': return 'Votre objectif est de définir la zone de gain pour le camp fort : l\'ensemble des cases depuis lesquelles le roi peut soit aider à arrêter le pion soit aider à mater le roi adverse.';
			case 'pages.solution.back_to_home': return 'Retour à l\'accueil';
			case 'pages.solution.see_legend': return 'Légende';
			case 'pages.solution.correct_cell': return 'Case correcte';
			case 'pages.solution.wrong_cell': return 'Case fausse';
			case 'pages.solution.missed_cell': return 'Case oubliée';
			case 'pages.solution.legend_title': return 'Légende';
			default: return null;
		}
	}
}

