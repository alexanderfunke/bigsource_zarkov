package de.bigsource.zarkov.base;

import java.util.ArrayList;

import org.apache.tools.ant.BuildException;

import de.bigsource.zarkov.ant.nested.AbstractParam;
import de.bigsource.zarkov.ant.nested.BooleanParam;
import de.bigsource.zarkov.ant.nested.DefineParam;
import de.bigsource.zarkov.ant.nested.DimensionParam;
import de.bigsource.zarkov.ant.nested.FrameParam;
import de.bigsource.zarkov.ant.nested.IntegerParam;
import de.bigsource.zarkov.ant.nested.LanguageRangeParam;
import de.bigsource.zarkov.ant.nested.LicenseParam;
import de.bigsource.zarkov.ant.nested.LocalizedParam;
import de.bigsource.zarkov.ant.nested.NameParam;
import de.bigsource.zarkov.ant.nested.NamespaceParam;
import de.bigsource.zarkov.ant.nested.PathAppendParam;
import de.bigsource.zarkov.ant.nested.PathParam;
import de.bigsource.zarkov.ant.nested.ScriptLimitParam;
import de.bigsource.zarkov.ant.nested.ValueParam;

public class FlexStandardTask extends ZarkovTask
{
	
	public boolean onlyFirstError = false;
	public String _sdk = "";
	
	
	public FlexStandardTask()
	{
		super();
		_options.put("benchmark", new CO(true, false));
		_options.put("compiler.accessible", new CO(true, false));
		_options.put("benchmark", new CO(true, false));
		_options.put("compiler.accessible", new CO(true, false));
		_options.put("compiler.actionscript-file-encoding", new CO(false, false));
		_options.put("compiler.allow-source-path-overlap", new CO(true, false));
		_options.put("compiler.as3", new CO(true, false));
		_options.put("compiler.context-root", new CO(false, false));
		_options.put("compiler.debug", new CO(true, false));
		_options.put("compiler.defaults-css-files", new CO(false, true));
		_options.put("compiler.defaults-css-url", new CO(false, false));
		_options.put("compiler.define", new CO(true, true));
		_options.put("compiler.es", new CO(true, false));
		_options.put("compiler.external-library-path", new CO(false, true));
		_options.put("compiler.fonts.advanced-anti-aliasing", new CO(true, false));
		_options.put("compiler.fonts.flash-type", new CO(true, false));
		_options.put("compiler.fonts.languages.language-range", new CO(false, false));
		_options.put("compiler.fonts.local-fonts-snapshot", new CO(false, false));
		_options.put("compiler.fonts.managers", new CO(false, true));
		_options.put("compiler.fonts.max-cached-fonts", new CO(false, false));
		_options.put("compiler.fonts.max-glyphs-per-face", new CO(false, false));
		_options.put("compiler.headless-server", new CO(true, false));
		_options.put("compiler.include-libraries", new CO(false, true));
		_options.put("compiler.incremental", new CO(true, false));
		_options.put("compiler.keep-all-type-selectors", new CO(true, false));
		_options.put("compiler.keep-as3-metadata", new CO(true, true));
		_options.put("compiler.keep-generated-actionscript", new CO(true, false));
		_options.put("compiler.library-path", new CO(false, true));
		_options.put("compiler.locale", new CO(false, false));
		_options.put("compiler.mxml.compatibility-version", new CO(false, false));
		_options.put("compiler.namespaces.namespace", new CO(false, false));
		_options.put("compiler.optimize", new CO(true, false));
		_options.put("compiler.services", new CO(false, false));
		_options.put("compiler.show-actionscript-warnings", new CO(true, false));
		_options.put("compiler.show-binding-warnings", new CO(true, false));
		_options.put("compiler.show-shadowed-device-font-warnings", new CO(true, false));
		_options.put("compiler.show-unused-type-selector-warnings", new CO(true, false));
		_options.put("compiler.source-path", new CO(false, true));
		_options.put("compiler.strict", new CO(true, false));
		_options.put("compiler.theme", new CO(false, true));
		_options.put("compiler.use-resource-bundle-metadata", new CO(true, false));
		_options.put("compiler.verbose-stacktraces", new CO(true, false));
		_options.put("compiler.warn-array-tostring-changes", new CO(true, false));
		_options.put("compiler.warn-assignment-within-conditional", new CO(true, false));
		_options.put("compiler.warn-bad-array-cast", new CO(true, false));
		_options.put("compiler.warn-bad-bool-assignment", new CO(true, false));
		_options.put("compiler.warn-bad-date-cast", new CO(true, false));
		_options.put("compiler.warn-bad-es3-type-method", new CO(true, false));
		_options.put("compiler.warn-bad-es3-type-prop", new CO(true, false));
		_options.put("compiler.warn-bad-nan-comparison", new CO(true, false));
		_options.put("compiler.warn-bad-null-assignment", new CO(true, false));
		_options.put("compiler.warn-bad-null-comparison", new CO(true, false));
		_options.put("compiler.warn-bad-undefined-comparison", new CO(true, false));
		_options.put("compiler.warn-boolean-constructor-with-no-args", new CO(true, false));
		_options.put("compiler.warn-changes-in-resolve", new CO(true, false));
		_options.put("compiler.warn-class-is-sealed", new CO(true, false));
		_options.put("compiler.warn-const-not-initialized", new CO(true, false));
		_options.put("compiler.warn-constructor-returns-value", new CO(true, false));
		_options.put("compiler.warn-deprecated-event-handler-error", new CO(true, false));
		_options.put("compiler.warn-deprecated-function-error", new CO(true, false));
		_options.put("compiler.warn-deprecated-property-error", new CO(true, false));
		_options.put("compiler.warn-duplicate-argument-names", new CO(true, false));
		_options.put("compiler.warn-duplicate-variable-def", new CO(true, false));
		_options.put("compiler.warn-for-var-in-changes", new CO(true, false));
		_options.put("compiler.warn-import-hides-class", new CO(true, false));
		_options.put("compiler.warn-instance-of-changes", new CO(true, false));
		_options.put("compiler.warn-internal-error", new CO(true, false));
		_options.put("compiler.warn-level-not-supported", new CO(true, false));
		_options.put("compiler.warn-missing-namespace-decl", new CO(true, false));
		_options.put("compiler.warn-negative-uint-literal", new CO(true, false));
		_options.put("compiler.warn-no-constructor", new CO(true, false));
		_options.put("compiler.warn-no-explicit-super-call-in-constructor", new CO(true, false));
		_options.put("compiler.warn-no-type-decl", new CO(true, false));
		_options.put("compiler.warn-number-from-string-changes", new CO(true, false));
		_options.put("compiler.warn-scoping-change-in-this", new CO(true, false));
		_options.put("compiler.warn-slow-text-field-addition", new CO(true, false));
		_options.put("compiler.warn-unlikely-function-value", new CO(true, false));
		_options.put("compiler.warn-xml-class-has-changed", new CO(true, false));
		_options.put("debug-password", new CO(false, false));
		_options.put("default-background-color", new CO(false, false));
		_options.put("default-frame-rate", new CO(false, false));
		_options.put("default-script-limits", new CO(false, false));
		_options.put("default-size", new CO(false, false));
		_options.put("externs", new CO(false, true));
		_options.put("frames.frame", new CO(false, false));
		_options.put("include-resource-bundles", new CO(false, true));
		_options.put("includes", new CO(false, true));
		_options.put("licenses.license", new CO(false, false));
		_options.put("link-report", new CO(false, false));
		_options.put("load-config", new CO(false, true));
		_options.put("load-externs", new CO(false, false));
		_options.put("metadata.contributor", new CO(false, false));
		_options.put("metadata.creator", new CO(false, false));
		_options.put("metadata.date", new CO(false, false));
		_options.put("metadata.description", new CO(false, false));
		_options.put("metadata.language", new CO(false, false));
		_options.put("metadata.localized-description", new CO(false, false));
		_options.put("metadata.localized-title", new CO(false, false));
		_options.put("metadata.publisher", new CO(false, false));
		_options.put("metadata.title", new CO(false, false));
		_options.put("output", new CO(true, false));
		_options.put("raw-metadata", new CO(false, false));
		_options.put("resource-bundle-list", new CO(false, false));
		_options.put("runtime-shared-libraries", new CO(false, false));
		_options.put("runtime-shared-library-path", new CO(true, false));
		_options.put("static-link-runtime-shared-libraries", new CO(true, false));
		_options.put("target-player", new CO(true, false));
		_options.put("use-network", new CO(true, false));
		_options.put("verify-digests", new CO(true, false));
		_options.put("version", new CO(true, false));
		_options.put("warnings", new CO(true, false));
		_options.put("args", new CO(false, false));
			
	}
	
	public void setSDK(String sdk)
	{
		_sdk = sdk;
	}
	
	public void setOnlyFirstError(Boolean onlyfirsterror)
	{
		onlyFirstError = onlyfirsterror;
	}
	
	/*
	 * benchmark
	 */

	public void addConfiguredBenchmark(BooleanParam arg)
	{
		addToArglist("benchmark", arg);
	}
	
	/*
	 * compiler.accessible
	 */

	public void addConfiguredCompiler__accessible(BooleanParam arg)
	{
		addToArglist("compiler.accessible", arg);
	}
	
	public void addConfiguredAccessible(BooleanParam arg)
	{
		addToArglist("compiler.accessible", arg);
	}
	
	/*
	 * compiler.actionscript-file-encoding
	 */

	public void addConfiguredCompiler__actionscript_file_encoding(ValueParam arg)
	{
		arg.task = this;
		arg.option = "compiler__actionscript_file_encoding";
		addToArglist("compiler.actionscript-file-encoding", arg);
	}
	
	public void addConfiguredActionscript_file_encoding(ValueParam arg)
	{
		arg.task = this;
		arg.option = "actionscript_file_encoding";
		addToArglist("actionscript-file-encoding", arg);
	}
	
	/*
	 * compiler.allow-source-path-overlap
	 */

	public void addConfiguredCompiler__allow_source_path_overlap(BooleanParam arg)
	{
		addToArglist("compiler.allow-source-path-overlap", arg);
	}
	
	public void addConfiguredAllow_source_path_overlap(BooleanParam arg)
	{
		addToArglist("compiler.allow-source-path-overlap", arg);
	}
	
	/*
	 * compiler.as3
	 */

	public void addConfiguredCompiler__as3(BooleanParam arg)
	{
		addToArglist("compiler.as3", arg);
	}
	
	public void addConfiguredAs3(BooleanParam arg)
	{
		addToArglist("compiler.as3", arg);
	}
	
	/*
	 * compiler.context-root
	 */

	public void addConfiguredCompiler__context_root(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "compiler__context_root";
		addToArglist("compiler.context-root", arg);
	}
	
	public void addConfiguredContext_root(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "context_root";
		addToArglist("compiler.context-root", arg);
	}
	
	/*
	 * compiler.debug
	 */

	public void addConfiguredCompiler__debug(BooleanParam arg)
	{
		addToArglist("compiler.debug", arg);
	}
	
	public void addConfiguredDebug(BooleanParam arg)
	{
		addToArglist("compiler.debug", arg);
	}
	
	/*
	 * compiler.defaults-css-files
	 */

	public void addConfiguredCompiler__defaults_css_files(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "compiler__defaults_css_files";
		addToArglist("compiler.defaults-css-files", arg);
	}
	
	public void addConfiguredDefaults_css_files(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "defaults_css_files";
		addToArglist("compiler.defaults-css-files", arg);
	}
	
	/*
	 * compiler.defaults-css-url
	 */

	public void addConfiguredCompiler__defaults_css_url(ValueParam arg)
	{
		arg.task = this;
		arg.option = "compiler__defaults_css_url";
		addToArglist("compiler.defaults-css-url", arg);
	}
	
	public void addConfiguredDefaults_css_url(ValueParam arg)
	{
		arg.task = this;
		arg.option = "defaults_css_url";
		addToArglist("compiler.defaults-css-url", arg);
	}
	
	/*
	 * compiler.define
	 */

	public void addConfiguredCompiler__define(DefineParam arg)
	{
		arg.task = this;
		arg.option = "compiler__define";
		addToArglist("compiler.define", arg);
	}
	
	public void addConfiguredDefine(DefineParam arg)
	{
		arg.task = this;
		arg.option = "define";
		addToArglist("compiler.define", arg);
	}
	
	/*
	 * compiler.es
	 */

	public void addConfiguredCompiler__es(BooleanParam arg)
	{
		addToArglist("compiler.es", arg);
	}
	
	public void addConfiguredEs(BooleanParam arg)
	{
		addToArglist("compiler.es", arg);
	}
	
	/*
	 * compiler.external-library-path
	 */

	public void addConfiguredCompiler__external_library_path(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "compiler__external_library_path";
		addToArglist("compiler.external-library-path", arg);
	}
	
	public void addConfiguredExternal_library_path(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "external_library_path";
		addToArglist("compiler.external-library-path", arg);
	}
	
	public void addConfiguredEl(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "el";
		addToArglist("compiler.external-library-path", arg);
	}
	
	/*
	 * compiler.fonts.advanced-anti-aliasing
	 */

	public void addConfiguredCompiler__fonts__advanced_anti_aliasing(BooleanParam arg)
	{
		addToArglist("compiler.fonts.advanced-anti-aliasing", arg);
	}
	
	public void addConfiguredFonts__advanced_anti_aliasing(BooleanParam arg)
	{
		addToArglist("compiler.fonts.advanced-anti-aliasing", arg);
	}
	
	public void addConfiguredAdvanced_anti_aliasing(BooleanParam arg)
	{
		addToArglist("compiler.fonts.advanced-anti-aliasing", arg);
	}
	
	/*
	 * compiler.fonts.flash-type
	 */

	public void addConfiguredCompiler__fonts__flash_type(BooleanParam arg)
	{
		addToArglist("compiler.fonts.flash-type", arg);
	}
	
	public void addConfiguredFonts__flash_type(BooleanParam arg)
	{
		addToArglist("compiler.fonts.flash-type", arg);
	}
	
	public void addConfiguredFlash_type(BooleanParam arg)
	{
		addToArglist("compiler.fonts.flash-type", arg);
	}
	
	/*
	 * compiler.fonts.languages.language-range
	 */

	public void addConfiguredCompiler__fonts__languages_language_range(LanguageRangeParam arg)
	{
		arg.task = this;
		arg.option = "compiler__fonts__languages_language_range";
		addToArglist("compiler.fonts.languages.language-range", arg);
	}
	
	public void addConfiguredFonts__languages_language_range(LanguageRangeParam arg)
	{
		arg.task = this;
		arg.option = "fonts__languages_language_range";
		addToArglist("compiler.fonts.languages.language-range", arg);
	}
	
	public void addConfiguredLanguage_range(LanguageRangeParam arg)
	{
		arg.task = this;
		arg.option = "language_range";
		addToArglist("compiler.fonts.languages.language-range", arg);
	}
	
	/*
	 * compiler.fonts.local-fonts-snapshot
	 */

	public void addConfiguredCompiler__fonts__local_fonts_snapshot(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "compiler__fonts__local_fonts_snapshot";
		addToArglist("compiler.fonts.local-fonts-snapshot", arg);
	}
	
	public void addConfiguredFonts__local_fonts_snapshot(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "fonts__local_fonts_snapshot";
		addToArglist("compiler.fonts.local-fonts-snapshot", arg);
	}
	
	public void addConfiguredLocal_fonts_snapshot(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "fonts__local_fonts_snapshot";
		addToArglist("compiler.fonts.local-fonts-snapshot", arg);
	}
	
	/*
	 * compiler.fonts.managers
	 */

	public void addConfiguredCompiler__fonts__managers(ValueParam arg)
	{
		arg.task = this;
		arg.option = "compiler.fonts__managers";
		addToArglist("compiler.fonts.managers", arg);
	}
	
	public void addConfiguredFonts__managers(ValueParam arg)
	{
		arg.task = this;
		arg.option = "fonts__managers";
		addToArglist("compiler.fonts.managers", arg);
	}
	
	public void addConfiguredManagers(ValueParam arg)
	{
		arg.task = this;
		arg.option = "managers";
		addToArglist("compiler.fonts.managers", arg);
	}
	
	/*
	 * compiler.fonts.max-cached-fonts
	 */

	public void addConfiguredCompliler__fonts__max_cached_fonts(ValueParam arg)
	{
		arg.task = this;
		arg.option = "compiler__fonts__max_cached_fonts";
		addToArglist("compiler.fonts.max-cached-fonts", arg);
	}
	
	public void addConfiguredFonts__max_cached_fonts(ValueParam arg)
	{
		arg.task = this;
		arg.option = "fonts__max_cached_fonts";
		addToArglist("compiler.fonts.max-cached-fonts", arg);
	}
	
	public void addConfiguredMax_cached_fonts(ValueParam arg)
	{
		arg.task = this;
		arg.option = "max_cached_fonts";
		addToArglist("compiler.fonts.max-cached-fonts", arg);
	}
	
	/*
	 * compiler.fonts.max-glyphs-per-face
	 */

	public void addConfiguredCompiler__fonts__max_glyphs_per_face(ValueParam arg)
	{
		arg.task = this;
		arg.option = "compiler__fonts__max_glyphs_per_face";
		addToArglist("compiler.fonts.max-glyphs-per-face", arg);
	}
	
	public void addConfiguredFonts__max_glyphs_per_face(ValueParam arg)
	{
		arg.task = this;
		arg.option = "fonts__max_glyphs_per_face";
		addToArglist("compiler.fonts.max-glyphs-per-face", arg);
	}
	
	public void addConfiguredMax_glyphs_per_face(ValueParam arg)
	{
		arg.task = this;
		arg.option = "max_glyphs_per_face";
		addToArglist("compiler.fonts.max-glyphs-per-face", arg);
	}
	
	/*
	 * compiler.headless-server
	 */

	public void addConfiguredCompiler__headless_server(BooleanParam arg)
	{
		addToArglist("compiler.headless-server", arg);
	}
	
	public void addConfiguredHeadless_server(BooleanParam arg)
	{
		addToArglist("compiler.headless-server", arg);
	}
	
	/*
	 * compiler.include-libraries
	 */

	public void addConfiguredCompiler__include_libraries(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "compiler__include_libraries";
		addToArglist("compiler.include-libraries", arg);
	}
	
	public void addConfiguredInclude_libraries(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "include_libraries";
		addToArglist("compiler.include-libraries", arg);
	}
	
	/*
	 * compiler.incremental
	 */

	public void addConfiguredCompiler__incremental(BooleanParam arg)
	{
		addToArglist("compiler.incremental", arg);
	}
	
	public void addConfiguredIncremental(BooleanParam arg)
	{
		addToArglist("compiler.incremental", arg);
	}
	
	/*
	 * compiler.keep-all-type-selectors
	 */

	public void addConfiguredCompiler__keep_all_type_selectors(BooleanParam arg)
	{
		addToArglist("compiler.keep-all-type-selectors", arg);
	}
	
	public void addConfiguredKeep_all_type_selectors(BooleanParam arg)
	{
		addToArglist("compiler.keep-all-type-selectors", arg);
	}
	
	/*
	 * compiler.keep-as3-metadata
	 */

	public void addConfiguredCompiler__keep_as3_metadata(ValueParam arg)
	{
		arg.task = this;
		arg.option = "compiler__keep_as3_metadata";
		addToArglist("compiler.keep-as3-metadata", arg);
	}
	
	public void addConfiguredKeep_as3_metadata(ValueParam arg)
	{
		arg.task = this;
		arg.option = "keep_as3_metadata";
		addToArglist("compiler.keep-as3-metadata", arg);
	}
	
	/*
	 * compiler.keep-generated-actionscript
	 */

	public void addConfiguredCompiler__keep_generated_actionscript(BooleanParam arg)
	{
		addToArglist("compiler.keep-generated-actionscript", arg);
	}
	
	public void addConfiguredKeep_generated_actionscript(BooleanParam arg)
	{
		addToArglist("compiler.keep-generated-actionscript", arg);
	}
	
	public void addConfiguredKeep(BooleanParam arg)
	{
		addToArglist("compiler.keep-generated-actionscript", arg);
	}
	
	/*
	 * compiler.library-path
	 */

	public void addConfiguredCompiler__library_path(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "compiler__library_path";
		addToArglist("compiler.library-path", arg);
	}
	
	public void addConfiguredLibrary_path(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "library_path";
		addToArglist("compiler.library-path", arg);
	}
	
	/*
	 * compiler.locale
	 */

	public void addConfiguredCompiler__Locale(ValueParam arg)
	{
		arg.task = this;
		arg.option = "compiler__locale";
		addToArglist("compiler.locale", arg);
	}
	
	public void addConfiguredLocale(ValueParam arg)
	{
		arg.task = this;
		arg.option = "locale";
		addToArglist("compiler.locale", arg);
	}
	
	/*
	 * compiler.mxml.compatibility-version
	 */

	public void addConfiguredCompiler__mxml__compatibility_version(ValueParam arg)
	{
		arg.task = this;
		arg.option = "compiler__mxml__compatibility_version";
		addToArglist("compiler.mxml.compatibility-version", arg);
	}
	
	public void addConfiguredMxml__compatibility_version(ValueParam arg)
	{
		arg.task = this;
		arg.option = "mxml__compatibility_version";
		addToArglist("compiler.mxml.compatibility-version", arg);
	}
	
	public void addConfiguredCompatibility_version(ValueParam arg)
	{
		arg.task = this;
		arg.option = "compatibility_version";
		addToArglist("compiler.mxml.compatibility-version", arg);
	}
	
	/*
	 * compiler.namespaces.namespace
	 */

	public void addConfiguredCompiler__namespaces_namespace(NamespaceParam arg)
	{
		arg.basedir = _basedir;
		addToArglist("compiler.namespaces.namespace", arg);
	}
	
	public void addConfiguredNamespaces_namespace(NamespaceParam arg)
	{
		arg.basedir = _basedir;
		addToArglist("compiler.namespaces.namespace", arg);
	}
	
	public void addConfiguredNamespace(NamespaceParam arg)
	{
		arg.basedir = _basedir;
		addToArglist("compiler.namespaces.namespace", arg);
	}
	
	/*
	 * compiler.optimize
	 */

	public void addConfiguredCompiler__Optimize(BooleanParam arg)
	{
		addToArglist("compiler.optimize", arg);
	}
	
	public void addConfiguredOptimize(BooleanParam arg)
	{
		addToArglist("compiler.optimize", arg);
	}
	
	/*
	 * compiler.services
	 */

	public void addConfiguredCompiler__Services(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "compiler__services";
		addToArglist("compiler.services", arg);
	}
	
	public void addConfiguredServices(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "services";
		addToArglist("compiler.services", arg);
	}
	
	/*
	 * compiler.show-actionscript-warnings
	 */

	public void addConfiguredCompiler__show_actionscript_warnings(BooleanParam arg)
	{
		addToArglist("compiler.show-actionscript-warnings", arg);
	}
	
	public void addConfiguredShow_actionscript_warnings(BooleanParam arg)
	{
		addToArglist("compiler.show-actionscript-warnings", arg);
	}
	
	/*
	 * compiler.show-binding-warnings
	 */

	public void addConfiguredCompiler__show_binding_warnings(BooleanParam arg)
	{
		addToArglist("compiler.show-binding-warnings", arg);
	}
	
	public void addConfiguredShow_binding_warnings(BooleanParam arg)
	{
		addToArglist("compiler.show-binding-warnings", arg);
	}
	
	/*
	 * compiler.show-shadowed-device-font-warnings
	 */

	public void addConfiguredCompiler__show_shadowed_device_font_warnings(BooleanParam arg)
	{
		addToArglist("compiler.show-shadowed-device-font-warnings", arg);
	}
	
	public void addConfiguredShow_shadowed_device_font_warnings(BooleanParam arg)
	{
		addToArglist("compiler.show-shadowed-device-font-warnings", arg);
	}
	
	/*
	 * compiler.show-unused-type-selector-warnings
	 */

	public void addConfiguredCompiler__show_unused_type_selector_warnings(BooleanParam arg)
	{
		addToArglist("compiler.show-unused-type-selector-warnings", arg);
	}
	
	public void addConfiguredShow_unused_type_selector_warnings(BooleanParam arg)
	{
		addToArglist("compiler.show-unused-type-selector-warnings", arg);
	}
	
	/*
	 * compiler.source-path
	 */

	public void addConfiguredCompiler__source_path(PathAppendParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "compiler__source_path";
		addToArglist("compiler.source-path", arg);
	}
	
	public void addConfiguredSource_path(PathAppendParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "source_path";
		addToArglist("compiler.source-path", arg);
	}
	
	/*
	 * compiler.strict
	 */

	public void addConfiguredCompiler__strict(BooleanParam arg)
	{
		addToArglist("compiler.strict", arg);
	}
	
	public void addConfiguredStrict(BooleanParam arg)
	{
		addToArglist("compiler.strict", arg);
	}
	
	/*
	 * compiler.theme
	 */

	public void addConfiguredCompiler__theme(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "theme";
		addToArglist("compiler.theme", arg);
	}
	
	public void addConfiguredTheme(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "theme";
		addToArglist("compiler.theme", arg);
	}
	
	/*
	 * compiler.use-resource-bundle-metadata
	 */

	public void addConfiguredCompiler__use_resource_bundle_metadata(BooleanParam arg)
	{
		addToArglist("compiler.use-resource-bundle-metadata", arg);
	}
	
	public void addConfiguredUse_resource_bundle_metadata(BooleanParam arg)
	{
		addToArglist("compiler.use-resource-bundle-metadata", arg);
	}
	
	/*
	 * compiler.verbose-stacktraces
	 */

	public void addConfiguredCompiler__verbose_stacktraces(BooleanParam arg)
	{
		addToArglist("compiler.verbose-stacktraces", arg);
	}
	
	public void addConfiguredVerbose_stacktraces(BooleanParam arg)
	{
		addToArglist("compiler.verbose-stacktraces", arg);
	}
	
	/*
	 * compiler.warn-array-tostring-changes
	 */

	public void addConfiguredCompiler__warn_array_tostring_changes(BooleanParam arg)
	{
		addToArglist("compiler.warn-array-tostring-changes", arg);
	}
	
	public void addConfiguredWarn_array_tostring_changes(BooleanParam arg)
	{
		addToArglist("compiler.warn-array-tostring-changes", arg);
	}
	
	/*
	 * compiler.warn-assignment-within-conditional
	 */

	public void addConfiguredCompiler__warn_assignment_within_conditional(BooleanParam arg)
	{
		addToArglist("compiler.warn-assignment-within-conditional", arg);
	}
	
	public void addConfiguredWarn_assignment_within_conditional(BooleanParam arg)
	{
		addToArglist("compiler.warn-assignment-within-conditional", arg);
	}
	
	/*
	 * compiler.warn-bad-array-cast
	 */

	public void addConfiguredCompiler__warn_bad_array_cast(BooleanParam arg)
	{
		addToArglist("compiler.warn-bad-array-cast", arg);
	}
	
	public void addConfiguredWarn_bad_array_cast(BooleanParam arg)
	{
		addToArglist("compiler.warn-bad-array-cast", arg);
	}
	
	/*
	 * compiler.warn-bad-bool-assignment
	 */

	public void addConfiguredCompiler__warn_bad_bool_assignment(BooleanParam arg)
	{
		addToArglist("compiler.warn-bad-bool-assignment", arg);
	}
	
	public void addConfiguredWarn_bad_bool_assignment(BooleanParam arg)
	{
		addToArglist("compiler.warn-bad-bool-assignment", arg);
	}
	
	/*
	 * compiler.warn-bad-date-cast
	 */

	public void addConfiguredCompiler__warn_bad_date_cast(BooleanParam arg)
	{
		addToArglist("compiler.warn-bad-date-cast", arg);
	}
	
	public void addConfiguredWarn_bad_date_cast(BooleanParam arg)
	{
		addToArglist("compiler.warn-bad-date-cast", arg);
	}
	
	/*
	 * compiler.warn-bad-es3-type-method
	 */

	public void addConfiguredCompiler__warn_bad_es3_type_method(BooleanParam arg)
	{
		addToArglist("compiler.warn-bad-es3-type-method", arg);
	}
	
	public void addConfiguredWarn_bad_es3_type_method(BooleanParam arg)
	{
		addToArglist("compiler.warn-bad-es3-type-method", arg);
	}
	
	/*
	 * compiler.warn-bad-es3-type-prop
	 */

	public void addConfiguredCompiler__warn_bad_es3_type_prop(BooleanParam arg)
	{
		addToArglist("compiler.warn-bad-es3-type-prop", arg);
	}
	
	public void addConfiguredWarn_bad_es3_type_prop(BooleanParam arg)
	{
		addToArglist("compiler.warn-bad-es3-type-prop", arg);
	}
	
	/*
	 * compiler.warn-bad-nan-comparison
	 */

	public void addConfiguredCompiler__warn_bad_nan_comparison(BooleanParam arg)
	{
		addToArglist("compiler.warn-bad-nan-comparison", arg);
	}
	
	public void addConfiguredWarn_bad_nan_comparison(BooleanParam arg)
	{
		addToArglist("compiler.warn-bad-nan-comparison", arg);
	}
	
	/*
	 * compiler.warn-bad-null-assignment
	 */

	public void addConfiguredCompiler__warn_bad_null_assignment(BooleanParam arg)
	{
		addToArglist("compiler.warn-bad-null-assignment", arg);
	}
	
	public void addConfiguredWarn_bad_null_assignment(BooleanParam arg)
	{
		addToArglist("compiler.warn-bad-null-assignment", arg);
	}
	
	/*
	 * compiler.warn-bad-null-comparison
	 */

	public void addConfiguredCompiler__warn_bad_null_comparison(BooleanParam arg)
	{
		addToArglist("compiler.warn-bad-null-comparison", arg);
	}
	
	public void addConfiguredWarn_bad_null_comparison(BooleanParam arg)
	{
		addToArglist("compiler.warn-bad-null-comparison", arg);
	}
	
	/*
	 * compiler.warn-bad-undefined-comparison
	 */

	public void addConfiguredCompiler__warn_bad_undefined_comparison(BooleanParam arg)
	{
		addToArglist("compiler.warn-bad-undefined-comparison", arg);
	}
	
	public void addConfiguredWarn_bad_undefined_comparison(BooleanParam arg)
	{
		addToArglist("compiler.warn-bad-undefined-comparison", arg);
	}
	
	/*
	 * compiler.warn-boolean-constructor-with-no-args
	 */

	public void addConfiguredCompiler__warn_boolean_constructor_with_no_args(BooleanParam arg)
	{
		addToArglist("compiler.warn-boolean-constructor-with-no-args", arg);
	}
	
	public void addConfiguredWarn_boolean_constructor_with_no_args(BooleanParam arg)
	{
		addToArglist("compiler.warn-boolean-constructor-with-no-args", arg);
	}
	
	/*
	 * compiler.warn-changes-in-resolve
	 */

	public void addConfiguredCompiler__warn_changes_in_resolve(BooleanParam arg)
	{
		addToArglist("compiler.warn-changes-in-resolve", arg);
	}
	
	public void addConfiguredWarn_changes_in_resolve(BooleanParam arg)
	{
		addToArglist("compiler.warn-changes-in-resolve", arg);
	}
	
	/*
	 * compiler.warn-class-is-sealed
	 */

	public void addConfiguredCompiler__warn_class_is_sealed(BooleanParam arg)
	{
		addToArglist("compiler.warn-class-is-sealed", arg);
	}
	
	public void addConfiguredWarn_class_is_sealed(BooleanParam arg)
	{
		addToArglist("compiler.warn-class-is-sealed", arg);
	}
	
	/*
	 * compiler.warn-const-not-initialized
	 */

	public void addConfiguredCompiler__warn_const_not_initialized(BooleanParam arg)
	{
		addToArglist("compiler.warn-const-not-initialized", arg);
	}
	
	public void addConfiguredWarn_const_not_initialized(BooleanParam arg)
	{
		addToArglist("compiler.warn-const-not-initialized", arg);
	}
	
	/*
	 * compiler.warn-constructor-returns-value
	 */

	public void addConfiguredCompiler__warn_constructor_returns_value(BooleanParam arg)
	{
		addToArglist("compiler.warn-constructor-returns-value", arg);
	}
	
	public void addConfiguredWarn_constructor_returns_value(BooleanParam arg)
	{
		addToArglist("compiler.warn-constructor-returns-value", arg);
	}
	
	/*
	 * compiler.warn-deprecated-event-handler-error
	 */

	public void addConfiguredCompiler__warn_deprecated_event_handler_error(BooleanParam arg)
	{
		addToArglist("compiler.warn-deprecated-event-handler-error", arg);
	}
	
	public void addConfiguredWarn_deprecated_event_handler_error(BooleanParam arg)
	{
		addToArglist("compiler.warn-deprecated-event-handler-error", arg);
	}
	
	/*
	 * compiler.warn-deprecated-function-error
	 */

	public void addConfiguredCompiler__warn_deprecated_function_error(BooleanParam arg)
	{
		addToArglist("compiler.warn-deprecated-function-error", arg);
	}
	
	public void addConfiguredWarn_deprecated_function_error(BooleanParam arg)
	{
		addToArglist("compiler.warn-deprecated-function-error", arg);
	}
	
	/*
	 * compiler.warn-deprecated-property-error
	 */

	public void addConfiguredCompiler__warn_deprecated_property_error(BooleanParam arg)
	{
		addToArglist("compiler.warn-deprecated-property-error", arg);
	}
	
	public void addConfiguredWarn_deprecated_property_error(BooleanParam arg)
	{
		addToArglist("compiler.warn-deprecated-property-error", arg);
	}
	
	/*
	 * compiler.warn-duplicate-argument-names
	 */

	public void addConfiguredCompiler__warn_duplicate_argument_names(BooleanParam arg)
	{
		addToArglist("compiler.warn-duplicate-argument-names", arg);
	}
	
	public void addConfiguredWarn_duplicate_argument_names(BooleanParam arg)
	{
		addToArglist("compiler.warn-duplicate-argument-names", arg);
	}
	
	/*
	 * compiler.warn-duplicate-variable-def
	 */

	public void addConfiguredCompiler__warn_duplicate_variable_def(BooleanParam arg)
	{
		addToArglist("compiler.warn-duplicate-variable-def", arg);
	}
	
	public void addConfiguredWarn_duplicate_variable_def(BooleanParam arg)
	{
		addToArglist("compiler.warn-duplicate-variable-def", arg);
	}
	
	/*
	 * compiler.warn-for-var-in-changes
	 */

	public void addConfiguredCompiler__warn_for_var_in_changes(BooleanParam arg)
	{
		addToArglist("compiler.warn-for-var-in-changes", arg);
	}
	
	public void addConfiguredWarn_for_var_in_changes(BooleanParam arg)
	{
		addToArglist("compiler.warn-for-var-in-changes", arg);
	}
	
	/*
	 * compiler.warn-import-hides-class
	 */

	public void addConfiguredCompiler__warn_import_hides_class(BooleanParam arg)
	{
		addToArglist("compiler.warn-import-hides-class", arg);
	}
	
	public void addConfiguredWarn_import_hides_class(BooleanParam arg)
	{
		addToArglist("compiler.warn-import-hides-class", arg);
	}
	
	/*
	 * compiler.warn-instance-of-changes
	 */

	public void addConfiguredCompiler__warn_instance_of_changes(BooleanParam arg)
	{
		addToArglist("compiler.warn-instance-of-changes", arg);
	}
	
	public void addConfiguredWarn_instance_of_changes(BooleanParam arg)
	{
		addToArglist("compiler.warn-instance-of-changes", arg);
	}
	
	/*
	 * compiler.warn-internal-error
	 */

	public void addConfiguredCompiler__warn_internal_error(BooleanParam arg)
	{
		addToArglist("compiler.warn-internal-error", arg);
	}
	
	public void addConfiguredWarn_internal_error(BooleanParam arg)
	{
		addToArglist("compiler.warn-internal-error", arg);
	}
	
	/*
	 * compiler.warn-level-not-supported
	 */

	public void addConfiguredCompiler__warn_level_not_supported(BooleanParam arg)
	{
		addToArglist("compiler.warn-level-not-supported", arg);
	}
	
	public void addConfiguredWarn_level_not_supported(BooleanParam arg)
	{
		addToArglist("compiler.warn-level-not-supported", arg);
	}
	
	/*
	 * compiler.warn-missing-namespace-decl
	 */

	public void addConfiguredCompiler__warn_missing_namespace_decl(BooleanParam arg)
	{
		addToArglist("compiler.warn-missing-namespace-decl", arg);
	}
	
	public void addConfiguredWarn_missing_namespace_decl(BooleanParam arg)
	{
		addToArglist("compiler.warn-missing-namespace-decl", arg);
	}
	
	/*
	 * compiler.warn-negative-uint-literal
	 */

	public void addConfiguredCompiler__warn_negative_uint_literal(BooleanParam arg)
	{
		addToArglist("compiler.warn-negative-uint-literal", arg);
	}
	
	public void addConfiguredWarn_negative_uint_literal(BooleanParam arg)
	{
		addToArglist("compiler.warn-negative-uint-literal", arg);
	}
	
	/*
	 * compiler.warn-no-constructor
	 */

	public void addConfiguredCompiler__warn_no_constructor(BooleanParam arg)
	{
		addToArglist("compiler.warn-no-constructor", arg);
	}
	
	public void addConfiguredWarn_no_constructor(BooleanParam arg)
	{
		addToArglist("compiler.warn-no-constructor", arg);
	}
	
	/*
	 * compiler.warn-no-explicit-super-call-in-constructor
	 */

	public void addConfiguredCompiler__warn_no_explicit_super_call_in_constructor(BooleanParam arg)
	{
		addToArglist("compiler.warn-no-explicit-super-call-in-constructor", arg);
	}
	
	public void addConfiguredWarn_no_explicit_super_call_in_constructor(BooleanParam arg)
	{
		addToArglist("compiler.warn-no-explicit-super-call-in-constructor", arg);
	}
	
	/*
	 * compiler.warn-no-type-decl
	 */

	public void addConfiguredCompiler__warn_no_type_decl(BooleanParam arg)
	{
		addToArglist("compiler.warn-no-type-decl", arg);
	}
	
	public void addConfiguredWarn_no_type_decl(BooleanParam arg)
	{
		addToArglist("compiler.warn-no-type-decl", arg);
	}
	
	/*
	 * compiler.warn-number-from-string-changes
	 */

	public void addConfiguredCompiler__warn_number_from_string_changes(BooleanParam arg)
	{
		addToArglist("compiler.warn-number-from-string-changes", arg);
	}
	
	public void addConfiguredWarn_number_from_string_changes(BooleanParam arg)
	{
		addToArglist("compiler.warn-number-from-string-changes", arg);
	}
	
	/*
	 * compiler.warn-scoping-change-in-this
	 */

	public void addConfiguredCompiler__warn_scoping_change_in_this(BooleanParam arg)
	{
		addToArglist("compiler.warn-scoping-change-in-this", arg);
	}
	
	public void addConfiguredWarn_scoping_change_in_this(BooleanParam arg)
	{
		addToArglist("compiler.warn-scoping-change-in-this", arg);
	}
	
	/*
	 * compiler.warn-slow-text-field-addition
	 */

	public void addConfiguredCompiler__warn_slow_text_field_addition(BooleanParam arg)
	{
		addToArglist("compiler.warn-slow-text-field-addition", arg);
	}
	
	public void addConfiguredWarn_slow_text_field_addition(BooleanParam arg)
	{
		addToArglist("compiler.warn-slow-text-field-addition", arg);
	}
	
	/*
	 * compiler.warn-unlikely-function-value
	 */

	public void addConfiguredCompiler__warn_unlikely_function_value(BooleanParam arg)
	{
		addToArglist("compiler.warn-unlikely-function-value", arg);
	}
	
	public void addConfiguredWarn_unlikely_function_value(BooleanParam arg)
	{
		addToArglist("compiler.warn-unlikely-function-value", arg);
	}
	
	/*
	 * compiler.warn-xml-class-has-changed
	 */

	public void addConfiguredCompiler__warn_xml_class_has_changed(BooleanParam arg)
	{
		addToArglist("compiler.warn-xml-class-has-changed", arg);
	}
	
	public void addConfiguredWarn_xml_class_has_changed(BooleanParam arg)
	{
		addToArglist("compiler.warn-xml-class-has-changed", arg);
	}
	
	/*
	 * debug-password
	 */

	public void addConfiguredDebug_password(ValueParam arg)
	{
		arg.task = this;
		arg.option = "debug_password";
		addToArglist("debug-password", arg);
	}
	
	/*
	 * default-background-color
	 */

	public void addConfiguredDefault_background_color(ValueParam arg)
	{
		arg.task = this;
		arg.option = "default_background_color";
		addToArglist("default-background-color", arg);
	}
	
	/*
	 * default-frame-rate
	 */

	public void addConfiguredDefault_frame_rate(IntegerParam arg)
	{
		arg.task = this;
		arg.option = "default_frame_rate";
		addToArglist("default-frame-rate", arg);
	}
	
	/*
	 * default-script-limits
	 */

	public void addConfiguredDefault_script_limits(ScriptLimitParam arg)
	{
		_max_execution_time = new Integer(arg.max_execution_time);
		arg.task = this;
		arg.option = "default_script_limits";
		addToArglist("default-script-limits", arg);
	}
	
	/*
	 * default-size
	 */

	public void addConfiguredDefault_size(DimensionParam arg)
	{
		arg.task = this;
		arg.option = "default_size";
		addToArglist("default-size", arg);
	}
	
	/*
	 *  externs
	 */

	public void addConfiguredExterns(ValueParam arg)
	{
		arg.task = this;
		arg.option = "externs";
		addToArglist("externs", arg);
	}
	
	/*
	 * frames.frame
	 */

	public void addConfiguredFrames__frame(FrameParam arg)
	{
		arg.task = this;
		arg.option = "frames__frame";
		addToArglist("frames.frame", arg);
	}
	
	public void addConfiguredFrame(FrameParam arg)
	{
		arg.task = this;
		arg.option = "frame";
		addToArglist("frames.frame", arg);
	}
	
	/*
	 * include-resource-bundles
	 */

	public void addConfiguredInclude_resource_bundles(ValueParam arg)
	{
		arg.task = this;
		arg.option = "include_resource_bundles";
		addToArglist("include-resource-bundles", arg);
	}
	
	/*
	 * includes
	 */

	public void addConfiguredIncludes(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "includes";
		addToArglist("includes", arg);
	}
	
	/*
	 * licenses.license
	 */

	public void addConfiguredLicenses__license(LicenseParam arg)
	{
		addToArglist("licenses.license", arg);
	}
	
	public void addConfiguredLicense(LicenseParam arg)
	{
		addToArglist("licenses.license", arg);
	}
	
	/*
	 * link-report
	 */

	public void addConfiguredLink_report(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "link_report";
		addToArglist("link-report", arg);
	}
	
	/*
	 * load-config
	 */

	public void addConfiguredLoad_config(PathAppendParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "load_config";
		addToArglist("load-config", arg);
	}
	
	/*
	 * load-externs
	 */

	public void addConfiguredLoad_externs(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "load_externs";
		addToArglist("load-externs", arg);
	}
	
	/*
	 * metadata.contributor
	 */

	public void addConfiguredMetadata__contributor(NameParam arg)
	{
		arg.task = this;
		arg.option = "metadata__contributor";
		addToArglist("metadata.contributor", arg);
	}
	
	public void addConfiguredContributor(NameParam arg)
	{
		arg.task = this;
		arg.option = "contributor";
		addToArglist("metadata.contributor", arg);
	}
	
	/*
	 * metadata.creator
	 */

	public void addConfiguredMetadata__creator(NameParam arg)
	{
		arg.task = this;
		arg.option = "metadata__creator";
		addToArglist("metadata.creator", arg);
	}
	
	public void addConfiguredCreator(NameParam arg)
	{
		arg.task = this;
		arg.option = "creator";
		addToArglist("metadata.creator", arg);
	}
	
	/*
	 * metadata.date
	 */

	public void addConfiguredMetadata__date(ValueParam arg)
	{
		arg.task = this;
		arg.option = "metadata__date";
		addToArglist("metadata.date", arg);
	}
	
	public void addConfiguredDate(ValueParam arg)
	{
		arg.task = this;
		arg.option = "date";
		addToArglist("metadata.date", arg);
	}
	
	/*
	 * metadata.description
	 */

	public void addConfiguredMetadata__description(ValueParam arg)
	{
		arg.task = this;
		arg.option = "metadata__description";
		addToArglist("metadata.description", arg);
	}
	
	public void addConfiguredDescription(ValueParam arg)
	{
		arg.task = this;
		arg.option = "description";
		addToArglist("metadata.description", arg);
	}
	
	/*
	 * metadata.language
	 */

	public void addConfiguredMetadata__language(ValueParam arg)
	{
		arg.task = this;
		arg.option = "metadata__language";
		addToArglist("metadata.language", arg);
	}
	
	public void addConfiguredLanguage(ValueParam arg)
	{
		arg.task = this;
		arg.option = "language";
		addToArglist("metadata.language", arg);
	}
	
	/*
	 * metadata.localized-description
	 */

	public void addConfiguredMetadata__localized_description(LocalizedParam arg)
	{
		addToArglist("metadata.localized-description", arg);
	}
	
	public void addConfiguredLocalized_description(LocalizedParam arg)
	{
		addToArglist("metadata.localized-description", arg);
	}
	
	/*
	 * metadata.localized-title
	 */

	public void addConfiguredMetadata__Localized_title(LocalizedParam arg)
	{
		addToArglist("metadata.localized-title", arg);
	}
	
	public void addConfiguredLocalized_title(LocalizedParam arg)
	{
		addToArglist("metadata.localized-title", arg);
	}
	
	/*
	 * metadata.publisher
	 */

	public void addConfiguredMetadata__publisher(NameParam arg)
	{
		arg.task = this;
		arg.option = "metadata__publisher";
		addToArglist("metadata.publisher", arg);
	}
	
	public void addConfiguredPublisher(NameParam arg)
	{
		arg.task = this;
		arg.option = "publisher";
		addToArglist("metadata.publisher", arg);
	}
	
	/*
	 * metadata.title
	 */

	public void addConfiguredMetadata__title(ValueParam arg)
	{
		arg.task = this;
		arg.option = "metadata__title";
		addToArglist("metadata.title", arg);
	}
	
	public void addConfiguredTitle(ValueParam arg)
	{
		arg.task = this;
		arg.option = "title";
		addToArglist("metadata.title", arg);
	}
	
	/*
	 * output
	 */

	public void addConfiguredOutput(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "output";
		addToArglist("output", arg);
	}
	
	public void addConfiguredO(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "o";
		addToArglist("output", arg);
	}
	
	/*
	 * raw-metadata
	 */

	public void addConfiguredRaw_metadata(ValueParam arg)
	{
		arg.task = this;
		arg.option = "raw_metadata";
		addToArglist("raw-metadata", arg);
	}
	
	/*
	 * resource-bundle-list
	 */

	public void addConfiguredResource_bundle_list(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "resource_bundle_list";
		addToArglist("resource-bundle-list", arg);
	}
	
	/*
	 * runtime-shared-libraries
	 */

	public void addConfiguredRuntime_shared_libraries(ValueParam arg)
	{
		arg.task = this;
		arg.option = "runtime_shared_libraries";
		addToArglist("runtime-shared-libraries", arg);
	}
	
	public void addConfiguredRsl(ValueParam arg)
	{
		arg.task = this;
		arg.option = "rsl";
		addToArglist("runtime-shared-libraries", arg);
	}
	
	/*
	 * runtime-shared-library-path
	 */
	// TODO: Check Param
	public void addConfiguredRuntime_shared_library_path(ValueParam arg)
	{
		arg.task = this;
		arg.option = "runtime_shared_library_path";
		addToArglist("runtime-shared-library-path", arg);
	}
	
	public void addConfiguredRslp(ValueParam arg)
	{
		arg.task = this;
		arg.option = "rslp";
		addToArglist("runtime-shared-library-path", arg);
	}
	
	/*
	 * static-link-runtime-shared-libraries
	 */

	public void addConfiguredStatic_link_runtime_shared_libraries(BooleanParam arg)
	{
		addToArglist("static-link-runtime-shared-libraries", arg);
	}
	
	public void addConfiguredStatic_rsls(BooleanParam arg)
	{
		addToArglist("static-link-runtime-shared-libraries", arg);
	}
	
	/*
	 * target-player
	 */

	public void addConfiguredTarget_player(ValueParam arg)
	{
		arg.task = this;
		arg.option = "target_player";
		addToArglist("target-player", arg);
	}
	
	/*
	 * use-network
	 */

	public void addConfiguredUse_network(BooleanParam arg)
	{
		addToArglist("use-network", arg);
	}
	
	/*
	 * verify-digests
	 */

	public void addConfiguredVerify_digests(BooleanParam arg)
	{
		addToArglist("verify-digests", arg);
	}
	
	/*
	 * version
	 */

	public void addConfiguredVersion(BooleanParam arg)
	{
		addToArglist("version", arg);
	}
	
	/*
	 * warnings
	 */

	public void addConfiguredWarnings(BooleanParam arg)
	{
		addToArglist("warnings", arg);
	}
	
	/*
	 * args
	 */

	public void addConfiguredArgs(ValueParam arg)
	{
		arg.task = this;
		arg.option = "args";
		addToArglist("args", arg);
	}
	
	public void checkPreconditions()
	{
		// OUTPUT DEBUG INFORMATION
		if (_sdk == "" || _sdk == null)
		{
			throw new BuildException(TranslationUtil.getTranslation("general.usage_of_preferences"));
		}
		else
		{
			System.out.println(TranslationUtil.getTranslation("general.using_flex").replace("{#SDK#}", _sdk));
			
			ArrayList<AbstractParam> lc = _args.get("load-config");
			
			if (lc == null || lc.size() == 0)
			{
				System.out.println(TranslationUtil.getTranslation("general.standard_configuration"));
			}
			else
			{
				for (int i = 0; i < lc.size(); i++)
				{
					AbstractParam param = lc.get(i);
					System.out.println(TranslationUtil.getTranslation("general.using_configuration") + param);
				}
			}
		}
	}

}
