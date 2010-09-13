package de.bigsource.zarkov.model.base
{
	import de.bigsource.zarkov.Application;
	import de.bigsource.zarkov.ApplicationFacade;
	import de.bigsource.zarkov.model.BuildProxy;
	import de.bigsource.zarkov.model.ant.nested.AbstractParam;
	import de.bigsource.zarkov.model.ant.nested.BooleanParam;
	import de.bigsource.zarkov.model.ant.nested.DefineParam;
	import de.bigsource.zarkov.model.ant.nested.DimensionParam;
	import de.bigsource.zarkov.model.ant.nested.FrameParam;
	import de.bigsource.zarkov.model.ant.nested.IntegerParam;
	import de.bigsource.zarkov.model.ant.nested.LanguageRangeParam;
	import de.bigsource.zarkov.model.ant.nested.LicenseParam;
	import de.bigsource.zarkov.model.ant.nested.LocalizedParam;
	import de.bigsource.zarkov.model.ant.nested.NameParam;
	import de.bigsource.zarkov.model.ant.nested.NamespaceParam;
	import de.bigsource.zarkov.model.ant.nested.PathAppendParam;
	import de.bigsource.zarkov.model.ant.nested.PathParam;
	import de.bigsource.zarkov.model.ant.nested.ScriptLimitParam;
	import de.bigsource.zarkov.model.ant.nested.ValueParam;

	public class FlexStandardTask extends ZarkovTask 
	{

		public var onlyFirstError : Boolean = false;
		public var sdk : String;
		protected var _buildProxy : BuildProxy;

		public function FlexStandardTask() : void 
		{
			
			_buildProxy = ApplicationFacade.getInstance(Application.NAME).retrieveProxy(BuildProxy.NAME) as BuildProxy;
			
			_options["benchmark"] = new CO(true, false);
			_options["compiler.accessible"] = new CO(true, false);
			_options["benchmark"] = new CO(true, false);
			_options["compiler.accessible"] = new CO(true, false);
			_options["compiler.actionscript-file-encoding"] = new CO(false, false);
			_options["compiler.allow-source-path-overlap"] = new CO(true, false);
			_options["compiler.as3"] = new CO(true, false);
			_options["compiler.context-root"] = new CO(false, false);
			_options["compiler.debug"] = new CO(true, false);
			_options["compiler.defaults-css-files"] = new CO(false, true);
			_options["compiler.defaults-css-url"] = new CO(false, false);
			_options["compiler.define"] = new CO(true, true);
			_options["compiler.es"] = new CO(true, false);
			_options["compiler.external-library-path"] = new CO(false, true);
			_options["compiler.fonts.advanced-anti-aliasing"] = new CO(true, false);
			_options["compiler.fonts.flash-type"] = new CO(true, false);
			_options["compiler.fonts.languages.language-range"] = new CO(false, false);
			_options["compiler.fonts.local-fonts-snapshot"] = new CO(false, false);
			_options["compiler.fonts.managers"] = new CO(false, true);
			_options["compiler.fonts.max-cached-fonts"] = new CO(false, false);
			_options["compiler.fonts.max-glyphs-per-face"] = new CO(false, false);
			_options["compiler.headless-server"] = new CO(true, false);
			_options["compiler.include-libraries"] = new CO(false, true);
			_options["compiler.incremental"] = new CO(true, false);
			_options["compiler.keep-all-type-selectors"] = new CO(true, false);
			_options["compiler.keep-as3-metadata"] = new CO(true, true);
			_options["compiler.keep-generated-actionscript"] = new CO(true, false);
			_options["compiler.library-path"] = new CO(false, true);
			_options["compiler.locale"] = new CO(false, false);
			_options["compiler.mxml.compatibility-version"] = new CO(false, false);
			_options["compiler.namespaces.namespace"] = new CO(false, false);
			_options["compiler.optimize"] = new CO(true, false);
			_options["compiler.services"] = new CO(false, false);
			_options["compiler.show-actionscript-warnings"] = new CO(true, false);
			_options["compiler.show-binding-warnings"] = new CO(true, false);
			_options["compiler.show-shadowed-device-font-warnings"] = new CO(true, false);
			_options["compiler.show-unused-type-selector-warnings"] = new CO(true, false);
			_options["compiler.source-path"] = new CO(false, true);
			_options["compiler.strict"] = new CO(true, false);
			_options["compiler.theme"] = new CO(false, true);
			_options["compiler.use-resource-bundle-metadata"] = new CO(true, false);
			_options["compiler.verbose-stacktraces"] = new CO(true, false);
			_options["compiler.warn-array-tostring-changes"] = new CO(true, false);
			_options["compiler.warn-assignment-within-conditional"] = new CO(true, false);
			_options["compiler.warn-bad-array-cast"] = new CO(true, false);
			_options["compiler.warn-bad-bool-assignment"] = new CO(true, false);
			_options["compiler.warn-bad-date-cast"] = new CO(true, false);
			_options["compiler.warn-bad-es3-type-method"] = new CO(true, false);
			_options["compiler.warn-bad-es3-type-prop"] = new CO(true, false);
			_options["compiler.warn-bad-nan-comparison"] = new CO(true, false);
			_options["compiler.warn-bad-null-assignment"] = new CO(true, false);
			_options["compiler.warn-bad-null-comparison"] = new CO(true, false);
			_options["compiler.warn-bad-undefined-comparison"] = new CO(true, false);
			_options["compiler.warn-boolean-constructor-with-no-args"] = new CO(true, false);
			_options["compiler.warn-changes-in-resolve"] = new CO(true, false);
			_options["compiler.warn-class-is-sealed"] = new CO(true, false);
			_options["compiler.warn-const-not-initialized"] = new CO(true, false);
			_options["compiler.warn-constructor-returns-value"] = new CO(true, false);
			_options["compiler.warn-deprecated-event-handler-error"] = new CO(true, false);
			_options["compiler.warn-deprecated-function-error"] = new CO(true, false);
			_options["compiler.warn-deprecated-property-error"] = new CO(true, false);
			_options["compiler.warn-duplicate-argument-names"] = new CO(true, false);
			_options["compiler.warn-duplicate-variable-def"] = new CO(true, false);
			_options["compiler.warn-for-var-in-changes"] = new CO(true, false);
			_options["compiler.warn-import-hides-class"] = new CO(true, false);
			_options["compiler.warn-instance-of-changes"] = new CO(true, false);
			_options["compiler.warn-internal-error"] = new CO(true, false);
			_options["compiler.warn-level-not-supported"] = new CO(true, false);
			_options["compiler.warn-missing-namespace-decl"] = new CO(true, false);
			_options["compiler.warn-negative-uint-literal"] = new CO(true, false);
			_options["compiler.warn-no-constructor"] = new CO(true, false);
			_options["compiler.warn-no-explicit-super-call-in-constructor"] = new CO(true, false);
			_options["compiler.warn-no-type-decl"] = new CO(true, false);
			_options["compiler.warn-number-from-string-changes"] = new CO(true, false);
			_options["compiler.warn-scoping-change-in-this"] = new CO(true, false);
			_options["compiler.warn-slow-text-field-addition"] = new CO(true, false);
			_options["compiler.warn-unlikely-function-value"] = new CO(true, false);
			_options["compiler.warn-xml-class-has-changed"] = new CO(true, false);
			_options["debug-password"] = new CO(false, false);
			_options["default-background-color"] = new CO(false, false);
			_options["default-frame-rate"] = new CO(false, false);
			_options["default-script-limits"] = new CO(false, false);
			_options["default-size"] = new CO(false, false);
			_options["externs"] = new CO(false, true);
			_options["frames.frame"] = new CO(false, false);
			_options["include-resource-bundles"] = new CO(false, true);
			_options["includes"] = new CO(false, true);
			_options["licenses.license"] = new CO(false, false);
			_options["link-report"] = new CO(false, false);
			_options["load-config"] = new CO(false, true);
			_options["load-externs"] = new CO(false, false);
			_options["metadata.contributor"] = new CO(false, false);
			_options["metadata.creator"] = new CO(false, false);
			_options["metadata.date"] = new CO(false, false);
			_options["metadata.description"] = new CO(false, false);
			_options["metadata.language"] = new CO(false, false);
			_options["metadata.localized-description"] = new CO(false, false);
			_options["metadata.localized-title"] = new CO(false, false);
			_options["metadata.publisher"] = new CO(false, false);
			_options["metadata.title"] = new CO(false, false);
			_options["output"] = new CO(true, false);
			_options["raw-metadata"] = new CO(false, false);
			_options["resource-bundle-list"] = new CO(false, false);
			_options["runtime-shared-libraries"] = new CO(false, false);
			_options["runtime-shared-library-path"] = new CO(true, false);
			_options["static-link-runtime-shared-libraries"] = new CO(true, false);
			_options["target-player"] = new CO(true, false);
			_options["use-network"] = new CO(true, false);
			_options["verify-digests"] = new CO(true, false);
			_options["version"] = new CO(true, false);
			_options["warnings"] = new CO(true, false);
			_options["args"] = new CO(false, false);
		}


		/*
		 * ------------------------------------------------------------- benchmark
		 * -------------------------------------------------------------
		 */

		public function set benchmark(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("benchmark", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.accessible
		 * -------------------------------------------------------------
		 */

		public function set compiler__accessible(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.accessible", arg);
		}

		public function set accessible(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.accessible", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.actionscript-file-encoding
		 * -------------------------------------------------------------
		 */

		public function set compiler__actionscript_file_encoding(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "private", p_xml, properties);
			addToArglist("compiler.actionscript-file-encoding", arg);
		}

		public function set actionscript_file_encoding(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "actionscript_file_encoding", p_xml, properties);
			addToArglist("actionscript-file-encoding", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.allow-source-path-overlap
		 * -------------------------------------------------------------
		 */

		public function set compiler__allow_source_path_overlap(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.allow-source-path-overlap", arg);
		}

		public function set allow_source_path_overlap(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.allow-source-path-overlap", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.as3
		 * -------------------------------------------------------------
		 */

		public function set compiler__as3(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.as3", arg);
		}

		public function set as3(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.as3", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.context-root
		 * -------------------------------------------------------------
		 */

		public function set compiler__context_root(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "compiler__context_root", _basedir, p_xml, properties);
			addToArglist("compiler.context-root", arg);
		}

		public function set context_root(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "context_root", _basedir, p_xml, properties);
			addToArglist("compiler.context-root", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.debug
		 * -------------------------------------------------------------
		 */

		public function set compiler__debug(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.debug", arg);
		}

		public function set debug(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.debug", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.defaults-css-files
		 * -------------------------------------------------------------
		 */

		public function set compiler__defaults_css_files(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "compiler__defaults_css_files", _basedir, p_xml, properties);
			addToArglist("compiler.defaults-css-files", arg);
		}

		public function set defaults_css_files(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "defaults_css_files", _basedir, p_xml, properties);
			addToArglist("compiler.defaults-css-files", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.defaults-css-url
		 * -------------------------------------------------------------
		 */

		public function set compiler__defaults_css_url(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "compiler__defaults_css_url", p_xml, properties);
			addToArglist("compiler.defaults-css-url", arg);
		}

		public function set defaults_css_url(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "defaults_css_url", p_xml, properties);
			addToArglist("compiler.defaults-css-url", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.define
		 * -------------------------------------------------------------
		 */

		public function set compiler__define(p_xml : XML) : void 
		{
			var arg : DefineParam = new DefineParam(this, "compiler__define", p_xml, properties);
			addToArglist("compiler.define", arg);
		}

		public function set define(p_xml : XML) : void 
		{
			var arg : DefineParam = new DefineParam(this, "define", p_xml, properties);
			addToArglist("compiler.define", arg);
		}

		/*
		 * ------------------------------------------------------------- compiler.es
		 * -------------------------------------------------------------
		 */

		public function set compiler__es(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.es", arg);
		}

		public function set es(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.es", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.external-library-path
		 * -------------------------------------------------------------
		 */

		public function set compiler__external_library_path(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "compiler__external_library_path", _basedir, p_xml, properties);
			addToArglist("compiler.external-library-path", arg);
		}

		public function set external_library_path(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "external_library_path", _basedir, p_xml, properties);
			addToArglist("compiler.external-library-path", arg);
		}

		public function set el(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "el", _basedir, p_xml, properties);
			addToArglist("compiler.external-library-path", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.fonts.advanced-anti-aliasing
		 * -------------------------------------------------------------
		 */

		public function set compiler__fonts__advanced_anti_aliasing(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.fonts.advanced-anti-aliasing", arg);
		}

		public function set fonts__advanced_anti_aliasing(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.fonts.advanced-anti-aliasing", arg);
		}

		public function set advanced_anti_aliasing(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.fonts.advanced-anti-aliasing", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.fonts.flash-type
		 * -------------------------------------------------------------
		 */

		public function set compiler__fonts__flash_type(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.fonts.flash-type", arg);
		}

		public function set fonts__flash_type(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.fonts.flash-type", arg);
		}

		public function set flash_type(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.fonts.flash-type", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.fonts.languages.language-range
		 * -------------------------------------------------------------
		 */

		public function set compiler__fonts__languages_language_range(p_xml : XML) : void 
		{
			var arg : LanguageRangeParam = new LanguageRangeParam(this, "compiler__fonts__languages_language_range", p_xml, properties);
			addToArglist("compiler.fonts.languages.language-range", arg);
		}

		public function set fonts__languages_language_range(p_xml : XML) : void 
		{
			var arg : LanguageRangeParam = new LanguageRangeParam(this, "fonts__languages_language_range", p_xml, properties);
			addToArglist("compiler.fonts.languages.language-range", arg);
		}

		public function set language_range(p_xml : XML) : void 
		{
			var arg : LanguageRangeParam = new LanguageRangeParam(this, "language_range", p_xml, properties);
			addToArglist("compiler.fonts.languages.language-range", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.fonts.local-fonts-snapshot
		 * -------------------------------------------------------------
		 */

		public function set compiler__fonts__local_fonts_snapshot(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "compiler__fonts__local_fonts_snapshot", _basedir, p_xml, properties);
			addToArglist("compiler.fonts.local-fonts-snapshot", arg);
		}

		public function set fonts__local_fonts_snapshot(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "fonts__local_fonts_snapshot", _basedir, p_xml, properties);
			addToArglist("compiler.fonts.local-fonts-snapshot", arg);
		}

		public function set local_fonts_snapshot(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "fonts__local_fonts_snapshot", _basedir, p_xml, properties);
			addToArglist("compiler.fonts.local-fonts-snapshot", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.fonts.managers
		 * -------------------------------------------------------------
		 */

		public function set compiler__fonts__managers(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "compiler.fonts__managers", p_xml, properties);
			addToArglist("compiler.fonts.managers", arg);
		}

		public function set fonts__managers(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "fonts__managers", p_xml, properties);
			addToArglist("compiler.fonts.managers", arg);
		}

		public function set managers(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "managers", p_xml, properties);
			addToArglist("compiler.fonts.managers", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.fonts.max-cached-fonts
		 * -------------------------------------------------------------
		 */

		public function set compliler__fonts__max_cached_fonts(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "compiler__fonts__max_cached_fonts", p_xml, properties);
			addToArglist("compiler.fonts.max-cached-fonts", arg);
		}

		public function set fonts__max_cached_fonts(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "fonts__max_cached_fonts", p_xml, properties);
			addToArglist("compiler.fonts.max-cached-fonts", arg);
		}

		public function set max_cached_fonts(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "max_cached_fonts", p_xml, properties);
			addToArglist("compiler.fonts.max-cached-fonts", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.fonts.max-glyphs-per-face
		 * -------------------------------------------------------------
		 */

		public function set compiler__fonts__max_glyphs_per_face(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "compiler__fonts__max_glyphs_per_face", p_xml, properties);
			addToArglist("compiler.fonts.max-glyphs-per-face", arg);
		}

		public function set fonts__max_glyphs_per_face(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "fonts__max_glyphs_per_face", p_xml, properties);
			addToArglist("compiler.fonts.max-glyphs-per-face", arg);
		}

		public function set max_glyphs_per_face(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "max_glyphs_per_face", p_xml, properties);
			addToArglist("compiler.fonts.max-glyphs-per-face", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.headless-server
		 * -------------------------------------------------------------
		 */

		public function set compiler__headless_server(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.headless-server", arg);
		}

		public function set headless_server(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.headless-server", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.include-libraries
		 * -------------------------------------------------------------
		 */

		public function set compiler__include_libraries(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "compiler__include_libraries", _basedir, p_xml, properties);
			addToArglist("compiler.include-libraries", arg);
		}

		public function set include_libraries(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "include_libraries", _basedir, p_xml, properties);
			addToArglist("compiler.include-libraries", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.incremental
		 * -------------------------------------------------------------
		 */

		public function set compiler__incremental(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.incremental", arg);
		}

		public function set incremental(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.incremental", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.keep-all-type-selectors
		 * -------------------------------------------------------------
		 */

		public function set compiler__keep_all_type_selectors(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.keep-all-type-selectors", arg);
		}

		public function set keep_all_type_selectors(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.keep-all-type-selectors", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.keep-as3-metadata
		 * -------------------------------------------------------------
		 */

		public function set compiler__keep_as3_metadata(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "compiler__keep_as3_metadata", p_xml, properties);
			addToArglist("compiler.keep-as3-metadata", arg);
		}

		public function set keep_as3_metadata(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "keep_as3_metadata", p_xml, properties);
			addToArglist("compiler.keep-as3-metadata", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.keep-generated-actionscript
		 * -------------------------------------------------------------
		 */

		public function set compiler__keep_generated_actionscript(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.keep-generated-actionscript", arg);
		}

		public function set keep_generated_actionscript(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.keep-generated-actionscript", arg);
		}

		public function set keep(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.keep-generated-actionscript", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.library-path
		 * -------------------------------------------------------------
		 */

		public function set compiler__library_path(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "compiler__library_path", _basedir, p_xml, properties);
			addToArglist("compiler.library-path", arg);
		}

		public function set library_path(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "library_path", _basedir, p_xml, properties);
			addToArglist("compiler.library-path", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.locale
		 * -------------------------------------------------------------
		 */

		public function set compiler__Locale(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "compiler__locale", p_xml, properties);
			addToArglist("compiler.locale", arg);
		}

		public function set locale(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "locale", p_xml, properties);
			addToArglist("compiler.locale", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.mxml.compatibility-version
		 * -------------------------------------------------------------
		 */

		public function set compiler__mxml__compatibility_version(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "compiler__mxml__compatibility_version", p_xml, properties);
			addToArglist("compiler.mxml.compatibility-version", arg);
		}

		public function set mxml__compatibility_version(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "mxml__compatibility_version", p_xml, properties);
			addToArglist("compiler.mxml.compatibility-version", arg);
		}

		public function set compatibility_version(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "compatibility_version", p_xml, properties);
			addToArglist("compiler.mxml.compatibility-version", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.namespaces.namespace
		 * -------------------------------------------------------------
		 */

		public function set compiler__namespaces_namespace(p_xml : XML) : void 
		{
			var arg : NamespaceParam = new NamespaceParam(_basedir, p_xml, properties);
			addToArglist("compiler.namespaces.namespace", arg);
		}

		public function set namespaces_namespace(p_xml : XML) : void 
		{
			var arg : NamespaceParam = new NamespaceParam(_basedir, p_xml, properties);
			addToArglist("compiler.namespaces.namespace", arg);
		}

		public function set namespace(p_xml : XML) : void 
		{
			var arg : NamespaceParam = new NamespaceParam(_basedir, p_xml, properties);
			addToArglist("compiler.namespaces.namespace", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.optimize
		 * -------------------------------------------------------------
		 */

		public function set compiler__Optimize(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.optimize", arg);
		}

		public function set optimize(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.optimize", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.services
		 * -------------------------------------------------------------
		 */

		public function set compiler__Services(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "compiler__services", _basedir, p_xml, properties);
			addToArglist("compiler.services", arg);
		}

		public function set services(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "services", _basedir, p_xml, properties);
			addToArglist("compiler.services", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.show-actionscript-warnings
		 * -------------------------------------------------------------
		 */

		public function set compiler__show_actionscript_warnings(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.show-actionscript-warnings", arg);
		}

		public function set show_actionscript_warnings(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.show-actionscript-warnings", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.show-binding-warnings
		 * -------------------------------------------------------------
		 */

		public function set compiler__show_binding_warnings(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.show-binding-warnings", arg);
		}

		public function set show_binding_warnings(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.show-binding-warnings", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.show-shadowed-device-font-warnings
		 * -------------------------------------------------------------
		 */

		public function set compiler__show_shadowed_device_font_warnings(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.show-shadowed-device-font-warnings", arg);
		}

		public function set show_shadowed_device_font_warnings(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.show-shadowed-device-font-warnings", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.show-unused-type-selector-warnings
		 * -------------------------------------------------------------
		 */

		public function set compiler__show_unused_type_selector_warnings(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.show-unused-type-selector-warnings", arg);
		}

		public function set show_unused_type_selector_warnings(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.show-unused-type-selector-warnings", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.source-path
		 * -------------------------------------------------------------
		 */

		public function set compiler__source_path(p_xml : XML) : void 
		{
			var arg : PathAppendParam = new PathAppendParam(this, "compiler__source_path", _basedir, p_xml, properties);
			addToArglist("compiler.source-path", arg);
		}

		public function set source_path(p_xml : XML) : void 
		{
			var arg : PathAppendParam = new PathAppendParam(this, "source_path", _basedir, p_xml, properties);
			addToArglist("compiler.source-path", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.strict
		 * -------------------------------------------------------------
		 */

		public function set compiler__strict(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.strict", arg);
		}

		public function set strict(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.strict", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.theme
		 * -------------------------------------------------------------
		 */

		public function set compiler__theme(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "compiler__theme", _basedir, p_xml, properties);
			addToArglist("compiler.theme", arg);
		}

		public function set theme(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "theme", _basedir, p_xml, properties);
			addToArglist("compiler.theme", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.use-resource-bundle-metadata
		 * -------------------------------------------------------------
		 */

		public function set compiler__use_resource_bundle_metadata(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.use-resource-bundle-metadata", arg);
		}

		public function set use_resource_bundle_metadata(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.use-resource-bundle-metadata", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.verbose-stacktraces
		 * -------------------------------------------------------------
		 */

		public function set compiler__verbose_stacktraces(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.verbose-stacktraces", arg);
		}

		public function set verbose_stacktraces(p_xml : XML) : void 
		{
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.verbose-stacktraces", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-array-tostring-changes
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_array_tostring_changes(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-array-tostring-changes", arg);
		}

		public function set warn_array_tostring_changes(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-array-tostring-changes", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-assignment-within-conditional
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_assignment_within_conditional(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-assignment-within-conditional", arg);
		}

		public function set warn_assignment_within_conditional(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-assignment-within-conditional", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-bad-array-cast
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_bad_array_cast(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-bad-array-cast", arg);
		}

		public function set warn_bad_array_cast(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-bad-array-cast", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-bad-bool-assignment
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_bad_bool_assignment(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-bad-bool-assignment", arg);
		}

		public function set warn_bad_bool_assignment(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-bad-bool-assignment", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-bad-date-cast
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_bad_date_cast(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-bad-date-cast", arg);
		}

		public function set warn_bad_date_cast(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-bad-date-cast", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-bad-es3-type-method
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_bad_es3_type_method(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-bad-es3-type-method", arg);
		}

		public function set warn_bad_es3_type_method(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-bad-es3-type-method", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-bad-es3-type-prop
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_bad_es3_type_prop(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-bad-es3-type-prop", arg);
		}

		public function set warn_bad_es3_type_prop(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-bad-es3-type-prop", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-bad-nan-comparison
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_bad_nan_comparison(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-bad-nan-comparison", arg);
		}

		public function set warn_bad_nan_comparison(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-bad-nan-comparison", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-bad-null-assignment
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_bad_null_assignment(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-bad-null-assignment", arg);
		}

		public function set warn_bad_null_assignment(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-bad-null-assignment", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-bad-null-comparison
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_bad_null_comparison(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-bad-null-comparison", arg);
		}

		public function set warn_bad_null_comparison(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-bad-null-comparison", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-bad-undefined-comparison
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_bad_undefined_comparison(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-bad-undefined-comparison", arg);
		}

		public function set warn_bad_undefined_comparison(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-bad-undefined-comparison", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-boolean-constructor-with-no-args
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_boolean_constructor_with_no_args(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-boolean-constructor-with-no-args", arg);
		}

		public function set warn_boolean_constructor_with_no_args(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-boolean-constructor-with-no-args", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-changes-in-resolve
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_changes_in_resolve(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-changes-in-resolve", arg);
		}

		public function set warn_changes_in_resolve(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-changes-in-resolve", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-class-is-sealed
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_class_is_sealed(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-class-is-sealed", arg);
		}

		public function set warn_class_is_sealed(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-class-is-sealed", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-const-not-initialized
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_const_not_initialized(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-const-not-initialized", arg);
		}

		public function set warn_const_not_initialized(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-const-not-initialized", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-constructor-returns-value
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_constructor_returns_value(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-constructor-returns-value", arg);
		}

		public function set warn_constructor_returns_value(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-constructor-returns-value", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-deprecated-event-handler-error
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_deprecated_event_handler_error(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-deprecated-event-handler-error", arg);
		}

		public function set warn_deprecated_event_handler_error(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-deprecated-event-handler-error", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-deprecated-function-error
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_deprecated_function_error(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-deprecated-function-error", arg);
		}

		public function set warn_deprecated_function_error(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-deprecated-function-error", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-deprecated-property-error
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_deprecated_property_error(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-deprecated-property-error", arg);
		}

		public function set warn_deprecated_property_error(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-deprecated-property-error", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-duplicate-argument-names
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_duplicate_argument_names(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-duplicate-argument-names", arg);
		}

		public function set warn_duplicate_argument_names(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-duplicate-argument-names", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-duplicate-variable-def
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_duplicate_variable_def(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-duplicate-variable-def", arg);
		}

		public function set warn_duplicate_variable_def(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-duplicate-variable-def", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-for-var-in-changes
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_for_var_in_changes(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-for-var-in-changes", arg);
		}

		public function set warn_for_var_in_changes(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-for-var-in-changes", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-import-hides-class
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_import_hides_class(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-import-hides-class", arg);
		}

		public function set warn_import_hides_class(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-import-hides-class", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-instance-of-changes
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_instance_of_changes(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-instance-of-changes", arg);
		}

		public function set warn_instance_of_changes(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-instance-of-changes", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-internal-error
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_internal_error(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-internal-error", arg);
		}

		public function set warn_internal_error(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-internal-error", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-level-not-supported
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_level_not_supported(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-level-not-supported", arg);
		}

		public function set warn_level_not_supported(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-level-not-supported", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-missing-namespace-decl
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_missing_namespace_decl(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-missing-namespace-decl", arg);
		}

		public function set warn_missing_namespace_decl(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-missing-namespace-decl", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-negative-uint-literal
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_negative_uint_literal(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-negative-uint-literal", arg);
		}

		public function set warn_negative_uint_literal(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-negative-uint-literal", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-no-constructor
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_no_constructor(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-no-constructor", arg);
		}

		public function set warn_no_constructor(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-no-constructor", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-no-explicit-super-call-in-constructor
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_no_explicit_super_call_in_constructor(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-no-explicit-super-call-in-constructor", arg);
		}

		public function set warn_no_explicit_super_call_in_constructor(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-no-explicit-super-call-in-constructor", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-no-type-decl
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_no_type_decl(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-no-type-decl", arg);
		}

		public function set warn_no_type_decl(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-no-type-decl", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-number-from-string-changes
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_number_from_string_changes(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-number-from-string-changes", arg);
		}

		public function set warn_number_from_string_changes(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-number-from-string-changes", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-scoping-change-in-this
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_scoping_change_in_this(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-scoping-change-in-this", arg);
		}

		public function set warn_scoping_change_in_this(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-scoping-change-in-this", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-slow-text-field-addition
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_slow_text_field_addition(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-slow-text-field-addition", arg);
		}

		public function set warn_slow_text_field_addition(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-slow-text-field-addition", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-unlikely-function-value
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_unlikely_function_value(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-unlikely-function-value", arg);
		}

		public function set warn_unlikely_function_value(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-unlikely-function-value", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * compiler.warn-xml-class-has-changed
		 * -------------------------------------------------------------
		 */

		public function set compiler__warn_xml_class_has_changed(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-xml-class-has-changed", arg);
		}

		public function set warn_xml_class_has_changed(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compiler.warn-xml-class-has-changed", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * debug-password
		 * -------------------------------------------------------------
		 */

		public function set debug_password(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "debug_password", p_xml, properties);
			addToArglist("debug-password", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * default-background-color
		 * -------------------------------------------------------------
		 */

		public function set default_background_color(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "default_background_color", p_xml, properties);
			addToArglist("default-background-color", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * default-frame-rate
		 * -------------------------------------------------------------
		 */

		public function set default_frame_rate(p_xml : XML) : void 
		{
			var arg : IntegerParam = new IntegerParam(this, "default_frame_rate", p_xml, properties);
			addToArglist("default-frame-rate", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * default-script-limits
		 * -------------------------------------------------------------
		 */

		public function set default_script_limits(p_xml : XML) : void 
		{
			var arg : ScriptLimitParam = new ScriptLimitParam(this, "default_script_limits", p_xml, properties);
			addToArglist("default-script-limits", arg);

			_max_execution_time = int(arg.max_execution_time);
		}

		/*
		 * -------------------------------------------------------------
		 * default-size
		 * -------------------------------------------------------------
		 */

		public function set default_size(p_xml : XML) : void 
		{
			var arg : DimensionParam = new DimensionParam(this, "default_size", p_xml, properties);
			addToArglist("default-size", arg);
		}

		/*
		 * ------------------------------------------------------------- externs
		 * -------------------------------------------------------------
		 */

		public function set externs(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "externs", p_xml, properties);
			addToArglist("externs", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * frames.frame
		 * -------------------------------------------------------------
		 */

		public function set frames__frame(p_xml : XML) : void 
		{
			var arg : FrameParam = new FrameParam(this, "frames__frame", p_xml, properties);
			addToArglist("frames.frame", arg);
		}

		public function set frame(p_xml : XML) : void 
		{
			var arg : FrameParam = new FrameParam(this, "frame", p_xml, properties);
			addToArglist("frames.frame", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * include-resource-bundles
		 * -------------------------------------------------------------
		 */

		public function set include_resource_bundles(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "include_resource_bundles", p_xml, properties);
			addToArglist("include-resource-bundles", arg);
		}

		/*
		 * ------------------------------------------------------------- 
		 * includes
		 * -------------------------------------------------------------
		 */

		public function set includes(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "includes", _basedir, p_xml, properties);
			addToArglist("includes", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * licenses.license
		 * -------------------------------------------------------------
		 */

		public function set licenses__license(p_xml : XML) : void 
		{
			var arg : LicenseParam = new LicenseParam(p_xml, properties);
			addToArglist("licenses.license", arg);
		}

		public function set license(p_xml : XML) : void 
		{
			var arg : LicenseParam = new LicenseParam(p_xml, properties);
			addToArglist("licenses.license", arg);
		}

		/*
		 * ------------------------------------------------------------- link-report
		 * -------------------------------------------------------------
		 */

		public function set link_report(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "link_report", _basedir, p_xml, properties);
			addToArglist("link-report", arg);
		}

		/*
		 * ------------------------------------------------------------- load-config
		 * -------------------------------------------------------------
		 */

		public function set load_config(p_xml : XML) : void 
		{
			var arg : PathAppendParam = new PathAppendParam(this, "load_config", _basedir, p_xml, properties);
			addToArglist("load-config", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * load-externs
		 * -------------------------------------------------------------
		 */

		public function set load_externs(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "load_externs", _basedir, p_xml, properties);
			addToArglist("load-externs", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * metadata.contributor
		 * -------------------------------------------------------------
		 */

		public function set metadata__contributor(p_xml : XML) : void 
		{
			var arg : NameParam = new NameParam(this, "metadata__contributor", p_xml, properties);
			addToArglist("metadata.contributor", arg);
		}

		public function set contributor(p_xml : XML) : void 
		{
			var arg : NameParam = new NameParam(this, "contributor", p_xml, properties);
			addToArglist("metadata.contributor", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * metadata.creator
		 * -------------------------------------------------------------
		 */

		public function set metadata__creator(p_xml : XML) : void 
		{
			var arg : NameParam = new NameParam(this, "metadata__creator", p_xml, properties);
			addToArglist("metadata.creator", arg);
		}

		public function set creator(p_xml : XML) : void 
		{
			var arg : NameParam = new NameParam(this, "creator", p_xml, properties);
			addToArglist("metadata.creator", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * metadata.date
		 * -------------------------------------------------------------
		 */

		public function set metadata__date(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "metadata__date", p_xml, properties);
			addToArglist("metadata.date", arg);
		}

		public function set date(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "date", p_xml, properties);
			addToArglist("metadata.date", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * metadata.description
		 * -------------------------------------------------------------
		 */

		public function set metadata__description(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "metadata__description", p_xml, properties);
			addToArglist("metadata.description", arg);
		}

		public function set description(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "description", p_xml, properties);
			addToArglist("metadata.description", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * metadata.language
		 * -------------------------------------------------------------
		 */

		public function set metadata__language(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "metadata__language", p_xml, properties);
			addToArglist("metadata.language", arg);
		}

		public function set language(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "language", p_xml, properties);
			addToArglist("metadata.language", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * metadata.localized-description
		 * -------------------------------------------------------------
		 */

		public function set metadata__localized_description(p_xml : XML) : void 
		{
			var arg : LocalizedParam = new LocalizedParam(p_xml, properties);
			addToArglist("metadata.localized-description", arg);
		}

		public function set localized_description(p_xml : XML) : void 
		{
			var arg : LocalizedParam = new LocalizedParam(p_xml, properties);
			addToArglist("metadata.localized-description", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * metadata.localized-title
		 * -------------------------------------------------------------
		 */

		public function set metadata__Localized_title(p_xml : XML) : void 
		{
			var arg : LocalizedParam = new LocalizedParam(p_xml, properties);
			addToArglist("metadata.localized-title", arg);
		}

		public function set localized_title(p_xml : XML) : void 
		{
			var arg : LocalizedParam = new LocalizedParam(p_xml, properties);
			addToArglist("metadata.localized-title", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * metadata.publisher
		 * -------------------------------------------------------------
		 */

		public function set metadata__publisher(p_xml : XML) : void 
		{
			var arg : NameParam = new NameParam(this, "metadata__publisher", p_xml, properties);
			addToArglist("metadata.publisher", arg);
		}

		public function set publisher(p_xml : XML) : void 
		{
			var arg : NameParam = new NameParam(this, "publisher", p_xml, properties);
			addToArglist("metadata.publisher", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * metadata.title
		 * -------------------------------------------------------------
		 */

		public function set metadata__title(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "metadata__title", p_xml, properties);
			addToArglist("metadata.title", arg);
		}

		public function set title(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "title", p_xml, properties);
			addToArglist("metadata.title", arg);
		}

		/*
		 * ------------------------------------------------------------- output
		 * -------------------------------------------------------------
		 */

		public function set output(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "output", _basedir, p_xml, properties);
			addToArglist("output", arg);
		}

		public function set o(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "o", _basedir, p_xml, properties);
			addToArglist("output", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * raw-metadata
		 * -------------------------------------------------------------
		 */

		public function set raw_metadata(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "raw_metadata", p_xml, properties);
			addToArglist("raw-metadata", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * resource-bundle-list
		 * -------------------------------------------------------------
		 */

		public function set resource_bundle_list(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "resource_bundle_list", _basedir, p_xml, properties);
			addToArglist("resource-bundle-list", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * runtime-shared-libraries
		 * -------------------------------------------------------------
		 */

		public function set runtime_shared_libraries(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "runtime_shared_libraries", p_xml, properties);
			addToArglist("runtime-shared-libraries", arg);
		}

		public function set rsl(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "rsl", p_xml, properties);
			addToArglist("runtime-shared-libraries", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * runtime-shared-library-path
		 * -------------------------------------------------------------
		 */
		public function set runtime_shared_library_path(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "runtime_shared_library_path", p_xml, properties);
			addToArglist("runtime-shared-library-path", arg);
		}

		public function set rslp(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "rslp", p_xml, properties);
			addToArglist("runtime-shared-library-path", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * static-link-runtime-shared-libraries
		 * -------------------------------------------------------------
		 */

		public function set static_link_runtime_shared_libraries(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("static-link-runtime-shared-libraries", arg);
		}

		public function set static_rsls(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("static-link-runtime-shared-libraries", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * target-player
		 * -------------------------------------------------------------
		 */

		public function set target_player(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "target_player", p_xml, properties);
			addToArglist("target-player", arg);
		}

		/*
		 * ------------------------------------------------------------- use-network
		 * -------------------------------------------------------------
		 */

		public function set use_network(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("use-network", arg);
		}

		/*
		 * -------------------------------------------------------------
		 * verify-digests
		 * -------------------------------------------------------------
		 */

		public function set verify_digests(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("verify-digests", arg);
		}

		/*
		 * ------------------------------------------------------------- version
		 * -------------------------------------------------------------
		 */

		public function set version(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("version", arg);
		}

		/*
		 * ------------------------------------------------------------- warnings
		 * -------------------------------------------------------------
		 */

		public function set warnings(p_xml : XML) : void 
		{ 
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("warnings", arg);
		}

		/*
		 * ------------------------------------------------------------- args
		 * -------------------------------------------------------------
		 */

		public function set args(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "args", p_xml, properties);
			addToArglist("args", arg);
		}

		public function checkPreconditions() : void 
		{
			if (sdk == "" || sdk == null)
			{
				new BuildException("Usage of Eclipse Preferences is deprecated for compatibility reasons. Please use the sdk attribute at your tasks.\nExample: <bigsource.xxx basedir=\"${basedir}\" sdk=\"PATH TO SDK\" />", this.targetID);
				return;
			}
			else
			{
			
				var lc : Array = _args["load-config"];
			
				if (lc == null || lc.length == 0)
				{
				}
				else
				{
					for (var i : int = 0;i < lc.length;i++)
					{
						var param : AbstractParam = lc[i];
						_buildProxy.addMessage("Using config " + param, this.targetID);
					}
				}
			}
		}

		public function setOnlyFirstError(onlyfirsterror : Boolean) : void 
		{
			onlyFirstError = onlyfirsterror;
		}
	}
}
