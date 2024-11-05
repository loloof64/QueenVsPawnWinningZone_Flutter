///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final TranslationsCommonEn common = TranslationsCommonEn._(_root);
	late final TranslationsPagesEn pages = TranslationsPagesEn._(_root);
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsCommonButtonsEn buttons = TranslationsCommonButtonsEn._(_root);
}

// Path: pages
class TranslationsPagesEn {
	TranslationsPagesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsPagesHomeEn home = TranslationsPagesHomeEn._(_root);
	late final TranslationsPagesGameEn game = TranslationsPagesGameEn._(_root);
	late final TranslationsPagesSolutionEn solution = TranslationsPagesSolutionEn._(_root);
}

// Path: common.buttons
class TranslationsCommonButtonsEn {
	TranslationsCommonButtonsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get close => 'Close';
}

// Path: pages.home
class TranslationsPagesHomeEn {
	TranslationsPagesHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Home';
	String get new_game => 'New game';
	String get generation_error => 'Failed to generate exercice. Please try again.';
}

// Path: pages.game
class TranslationsPagesGameEn {
	TranslationsPagesGameEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Game';
	String get instruction => 'Click on all the cells of the winning zone and validate.';
	String get validate => 'Validate';
}

// Path: pages.solution
class TranslationsPagesSolutionEn {
	TranslationsPagesSolutionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get back_to_home => 'Go back to home';
	String get see_legend => 'Legend';
	String get correct_cell => 'Correct cell';
	String get wrong_cell => 'Wrong cell';
	String get missed_cell => 'Forgotten cell';
	String get legend_title => 'Legend';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.buttons.close': return 'Close';
			case 'pages.home.title': return 'Home';
			case 'pages.home.new_game': return 'New game';
			case 'pages.home.generation_error': return 'Failed to generate exercice. Please try again.';
			case 'pages.game.title': return 'Game';
			case 'pages.game.instruction': return 'Click on all the cells of the winning zone and validate.';
			case 'pages.game.validate': return 'Validate';
			case 'pages.solution.back_to_home': return 'Go back to home';
			case 'pages.solution.see_legend': return 'Legend';
			case 'pages.solution.correct_cell': return 'Correct cell';
			case 'pages.solution.wrong_cell': return 'Wrong cell';
			case 'pages.solution.missed_cell': return 'Forgotten cell';
			case 'pages.solution.legend_title': return 'Legend';
			default: return null;
		}
	}
}

