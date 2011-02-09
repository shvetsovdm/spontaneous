# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{spontaneous}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Garry Hill"]
  s.date = %q{2011-02-09}
  s.description = %q{TODO: longer description of your gem}
  s.email = %q{garry@magnetised.info}
  s.executables = ["unlimit-upload", "nginx", "spot", "unicorn", "limit-upload", "console", "back"]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "Rakefile",
    "application/css/editing.less",
    "application/css/spontaneous.less",
    "application/css/v2.less",
    "application/css/variables.less",
    "application/js/ajax.js",
    "application/js/compatibility.js",
    "application/js/content.js",
    "application/js/content_area.js",
    "application/js/dialogue.js",
    "application/js/dom.js",
    "application/js/edit_dialogue.js",
    "application/js/editing.js",
    "application/js/entry.js",
    "application/js/extensions.js",
    "application/js/field.js",
    "application/js/field_preview.js",
    "application/js/field_types/date_field.js",
    "application/js/field_types/discount_field.js",
    "application/js/field_types/file_field.js",
    "application/js/field_types/image_field.js",
    "application/js/field_types/string_field.js",
    "application/js/init.js",
    "application/js/load.js",
    "application/js/location.js",
    "application/js/page.js",
    "application/js/page_entry.js",
    "application/js/preview.js",
    "application/js/progress.js",
    "application/js/properties.js",
    "application/js/require.js",
    "application/js/side_bar.js",
    "application/js/slot.js",
    "application/js/slot_container.js",
    "application/js/spontaneous.js",
    "application/js/state.js",
    "application/js/status_bar.js",
    "application/js/top_bar.js",
    "application/js/types.js",
    "application/js/upload_manager.js",
    "application/js/vendor/JS.Class-2.1.5/CHANGELOG",
    "application/js/vendor/JS.Class-2.1.5/MIT-LICENSE",
    "application/js/vendor/JS.Class-2.1.5/README",
    "application/js/vendor/JS.Class-2.1.5/min/command.js",
    "application/js/vendor/JS.Class-2.1.5/min/comparable.js",
    "application/js/vendor/JS.Class-2.1.5/min/constant_scope.js",
    "application/js/vendor/JS.Class-2.1.5/min/core.js",
    "application/js/vendor/JS.Class-2.1.5/min/decorator.js",
    "application/js/vendor/JS.Class-2.1.5/min/enumerable.js",
    "application/js/vendor/JS.Class-2.1.5/min/forwardable.js",
    "application/js/vendor/JS.Class-2.1.5/min/hash.js",
    "application/js/vendor/JS.Class-2.1.5/min/linked_list.js",
    "application/js/vendor/JS.Class-2.1.5/min/loader.js",
    "application/js/vendor/JS.Class-2.1.5/min/method_chain.js",
    "application/js/vendor/JS.Class-2.1.5/min/observable.js",
    "application/js/vendor/JS.Class-2.1.5/min/package.js",
    "application/js/vendor/JS.Class-2.1.5/min/proxy.js",
    "application/js/vendor/JS.Class-2.1.5/min/ruby.js",
    "application/js/vendor/JS.Class-2.1.5/min/set.js",
    "application/js/vendor/JS.Class-2.1.5/min/stack_trace.js",
    "application/js/vendor/JS.Class-2.1.5/min/state.js",
    "application/js/vendor/JS.Class-2.1.5/min/stdlib.js",
    "application/js/vendor/JS.Class-2.1.5/src/command.js",
    "application/js/vendor/JS.Class-2.1.5/src/comparable.js",
    "application/js/vendor/JS.Class-2.1.5/src/constant_scope.js",
    "application/js/vendor/JS.Class-2.1.5/src/core.js",
    "application/js/vendor/JS.Class-2.1.5/src/decorator.js",
    "application/js/vendor/JS.Class-2.1.5/src/enumerable.js",
    "application/js/vendor/JS.Class-2.1.5/src/forwardable.js",
    "application/js/vendor/JS.Class-2.1.5/src/hash.js",
    "application/js/vendor/JS.Class-2.1.5/src/linked_list.js",
    "application/js/vendor/JS.Class-2.1.5/src/loader.js",
    "application/js/vendor/JS.Class-2.1.5/src/method_chain.js",
    "application/js/vendor/JS.Class-2.1.5/src/observable.js",
    "application/js/vendor/JS.Class-2.1.5/src/package.js",
    "application/js/vendor/JS.Class-2.1.5/src/proxy.js",
    "application/js/vendor/JS.Class-2.1.5/src/ruby.js",
    "application/js/vendor/JS.Class-2.1.5/src/set.js",
    "application/js/vendor/JS.Class-2.1.5/src/stack_trace.js",
    "application/js/vendor/JS.Class-2.1.5/src/state.js",
    "application/js/vendor/JS.Class-2.1.5/src/stdlib.js",
    "application/js/vendor/jquery-1.4.2.min.js",
    "application/js/vendor/jquery-1.4.3.min.js",
    "application/js/vendor/jquery-ui-1.8.6.custom.min.js",
    "application/js/vendor/jquery-ui-1.8.custom.min.js",
    "application/js/vendor/jquery.hotkeys-0.7.9.js",
    "application/js/vendor/jquery.hotkeys-0.7.9.min.js",
    "application/static/favicon.ico",
    "application/static/item-buttons.png",
    "application/static/location-arrow.png",
    "application/static/missing.png",
    "application/static/orange-down-arrow.png",
    "application/static/px.gif",
    "application/static/select-arrow-root.png",
    "application/static/select-arrow.png",
    "application/static/slot-down-arrow.png",
    "application/static/splash.png",
    "application/static/spontaneous.png",
    "application/views/index.erubis",
    "bin/back",
    "bin/console",
    "bin/limit-upload",
    "bin/nginx",
    "bin/spot",
    "bin/unicorn",
    "bin/unlimit-upload",
    "config/nginx.conf",
    "db/migrations/20100610142136_init.rb",
    "db/migrations/20101130104334_timestamps.rb",
    "db/migrations/20101202113205_site_publishing_flags.rb",
    "db/migrations/20101206124543_aliases.rb",
    "db/migrations/20110201133550_visibility.rb",
    "lib/cutaneous.rb",
    "lib/cutaneous/context_helper.rb",
    "lib/cutaneous/first_pass_parser.rb",
    "lib/cutaneous/first_pass_renderer.rb",
    "lib/cutaneous/parser_core.rb",
    "lib/cutaneous/preview_context.rb",
    "lib/cutaneous/preview_renderer.rb",
    "lib/cutaneous/publish_context.rb",
    "lib/cutaneous/renderer.rb",
    "lib/cutaneous/request_context.rb",
    "lib/cutaneous/second_pass_parser.rb",
    "lib/cutaneous/second_pass_renderer.rb",
    "lib/sequel/plugins/content_table_inheritance.rb",
    "lib/sequel/plugins/yajl_serialization.rb",
    "lib/spontaneous.rb",
    "lib/spontaneous/change.rb",
    "lib/spontaneous/change_set.rb",
    "lib/spontaneous/cli/adapter.rb",
    "lib/spontaneous/cli/base.rb",
    "lib/spontaneous/cli/console.rb",
    "lib/spontaneous/config.rb",
    "lib/spontaneous/constants.rb",
    "lib/spontaneous/content.rb",
    "lib/spontaneous/entry.rb",
    "lib/spontaneous/entry_set.rb",
    "lib/spontaneous/errors.rb",
    "lib/spontaneous/extensions/array.rb",
    "lib/spontaneous/extensions/class.rb",
    "lib/spontaneous/extensions/hash.rb",
    "lib/spontaneous/extensions/json.rb",
    "lib/spontaneous/extensions/object.rb",
    "lib/spontaneous/extensions/string.rb",
    "lib/spontaneous/facet.rb",
    "lib/spontaneous/field_types.rb",
    "lib/spontaneous/field_types/base.rb",
    "lib/spontaneous/field_types/date_field.rb",
    "lib/spontaneous/field_types/discount_field.rb",
    "lib/spontaneous/field_types/image_field.rb",
    "lib/spontaneous/field_types/string_field.rb",
    "lib/spontaneous/generators.rb",
    "lib/spontaneous/generators/page.rb",
    "lib/spontaneous/generators/page/inline.html.cut",
    "lib/spontaneous/generators/page/page.html.cut.tt",
    "lib/spontaneous/generators/page/page.rb.tt",
    "lib/spontaneous/generators/site.rb",
    "lib/spontaneous/generators/site/.gitignore",
    "lib/spontaneous/generators/site/Gemfile.tt",
    "lib/spontaneous/generators/site/Rakefile.tt",
    "lib/spontaneous/generators/site/config/back.ru",
    "lib/spontaneous/generators/site/config/boot.rb",
    "lib/spontaneous/generators/site/config/database.yml.tt",
    "lib/spontaneous/generators/site/config/deploy.rb.tt",
    "lib/spontaneous/generators/site/config/environment.rb.tt",
    "lib/spontaneous/generators/site/config/environments/development.rb.tt",
    "lib/spontaneous/generators/site/config/environments/production.rb.tt",
    "lib/spontaneous/generators/site/config/front.ru",
    "lib/spontaneous/generators/site/lib/tasks/site.rake.tt",
    "lib/spontaneous/generators/site/public/css/site.css",
    "lib/spontaneous/generators/site/public/favicon.ico",
    "lib/spontaneous/generators/site/public/js/.empty_directory",
    "lib/spontaneous/generators/site/public/js/site.js",
    "lib/spontaneous/generators/site/public/robots.txt",
    "lib/spontaneous/generators/site/schema/.map",
    "lib/spontaneous/generators/site/templates/page.html.cut.tt",
    "lib/spontaneous/image_size.rb",
    "lib/spontaneous/logger.rb",
    "lib/spontaneous/media.rb",
    "lib/spontaneous/page.rb",
    "lib/spontaneous/page_entry.rb",
    "lib/spontaneous/plugins.rb",
    "lib/spontaneous/plugins/aliases.rb",
    "lib/spontaneous/plugins/allowed_types.rb",
    "lib/spontaneous/plugins/application/paths.rb",
    "lib/spontaneous/plugins/application/render.rb",
    "lib/spontaneous/plugins/application/state.rb",
    "lib/spontaneous/plugins/entries.rb",
    "lib/spontaneous/plugins/fields.rb",
    "lib/spontaneous/plugins/fields/field_prototype.rb",
    "lib/spontaneous/plugins/fields/field_set.rb",
    "lib/spontaneous/plugins/instance_code.rb",
    "lib/spontaneous/plugins/json.rb",
    "lib/spontaneous/plugins/media.rb",
    "lib/spontaneous/plugins/page_search.rb",
    "lib/spontaneous/plugins/page_styles.rb",
    "lib/spontaneous/plugins/page_tree.rb",
    "lib/spontaneous/plugins/paths.rb",
    "lib/spontaneous/plugins/prototypes.rb",
    "lib/spontaneous/plugins/publishing.rb",
    "lib/spontaneous/plugins/render.rb",
    "lib/spontaneous/plugins/schema_hierarchy.rb",
    "lib/spontaneous/plugins/schema_title.rb",
    "lib/spontaneous/plugins/site/publishing.rb",
    "lib/spontaneous/plugins/site_map.rb",
    "lib/spontaneous/plugins/slots.rb",
    "lib/spontaneous/plugins/slots/slot.rb",
    "lib/spontaneous/plugins/slots/slot_definitions.rb",
    "lib/spontaneous/plugins/slots/slot_set.rb",
    "lib/spontaneous/plugins/styles.rb",
    "lib/spontaneous/plugins/visibility.rb",
    "lib/spontaneous/proxy_object.rb",
    "lib/spontaneous/publishing.rb",
    "lib/spontaneous/publishing/fire_and_forget.rb",
    "lib/spontaneous/publishing/immediate.rb",
    "lib/spontaneous/publishing/threaded.rb",
    "lib/spontaneous/rack.rb",
    "lib/spontaneous/rack/around_back.rb",
    "lib/spontaneous/rack/around_front.rb",
    "lib/spontaneous/rack/around_preview.rb",
    "lib/spontaneous/rack/back.rb",
    "lib/spontaneous/rack/front.rb",
    "lib/spontaneous/rack/public.rb",
    "lib/spontaneous/render.rb",
    "lib/spontaneous/render/context.rb",
    "lib/spontaneous/render/development_renderer.rb",
    "lib/spontaneous/render/engine.rb",
    "lib/spontaneous/render/format.rb",
    "lib/spontaneous/render/format/html.rb",
    "lib/spontaneous/render/preview_renderer.rb",
    "lib/spontaneous/render/published_renderer.rb",
    "lib/spontaneous/render/publishing_renderer.rb",
    "lib/spontaneous/render/renderer.rb",
    "lib/spontaneous/render_context.rb",
    "lib/spontaneous/render_format_proxy.rb",
    "lib/spontaneous/revision.rb",
    "lib/spontaneous/schema.rb",
    "lib/spontaneous/server.rb",
    "lib/spontaneous/site.rb",
    "lib/spontaneous/style.rb",
    "lib/spontaneous/style_definitions.rb",
    "lib/spontaneous/tasks.rb",
    "lib/spontaneous/tasks/database.rake",
    "lib/spontaneous/templates.rb",
    "lib/spontaneous/templates/erubis_template.rb",
    "lib/spontaneous/templates/template_base.rb",
    "lib/spontaneous/version.rb",
    "spontaneous.gemspec",
    "test/experimental/test_prototypes.rb",
    "test/experimental/test_visibility.rb",
    "test/fixtures/application/css/test.less",
    "test/fixtures/application/js/test.js",
    "test/fixtures/application/static/favicon.ico",
    "test/fixtures/application/static/test.html",
    "test/fixtures/application/views/index.erubis",
    "test/fixtures/config/config/environment.rb",
    "test/fixtures/config/config/environments/development.rb",
    "test/fixtures/config/config/environments/production.rb",
    "test/fixtures/config/config/environments/staging.rb",
    "test/fixtures/example_application/Gemfile",
    "test/fixtures/example_application/Gemfile.lock",
    "test/fixtures/example_application/config/back.rb",
    "test/fixtures/example_application/config/back.ru",
    "test/fixtures/example_application/config/back.yml",
    "test/fixtures/example_application/config/boot.rb",
    "test/fixtures/example_application/config/database.yml",
    "test/fixtures/example_application/config/environment.rb",
    "test/fixtures/example_application/config/environments/development.rb",
    "test/fixtures/example_application/config/environments/production.rb",
    "test/fixtures/example_application/config/environments/staging.rb",
    "test/fixtures/example_application/config/front.rb",
    "test/fixtures/example_application/config/front.ru",
    "test/fixtures/example_application/config/front.yml",
    "test/fixtures/example_application/config/unicorn.rb",
    "test/fixtures/example_application/public/css/test.css",
    "test/fixtures/example_application/public/favicon.ico",
    "test/fixtures/example_application/public/js/test.js",
    "test/fixtures/example_application/public/test.html",
    "test/fixtures/example_application/schema/client_project.rb",
    "test/fixtures/example_application/schema/client_projects.rb",
    "test/fixtures/example_application/schema/home_page.rb",
    "test/fixtures/example_application/schema/info_page.rb",
    "test/fixtures/example_application/schema/inline_image.rb",
    "test/fixtures/example_application/schema/project.rb",
    "test/fixtures/example_application/schema/project_image.rb",
    "test/fixtures/example_application/schema/projects_page.rb",
    "test/fixtures/example_application/schema/text.rb",
    "test/fixtures/example_application/templates/client_project.html.cut",
    "test/fixtures/example_application/templates/client_project/images.html.cut",
    "test/fixtures/example_application/templates/client_projects.html.cut",
    "test/fixtures/example_application/templates/home_page/page.html.cut",
    "test/fixtures/example_application/templates/info_page/inline.html.cut",
    "test/fixtures/example_application/templates/info_page/page.html.cut",
    "test/fixtures/example_application/templates/inline_image.html.cut",
    "test/fixtures/example_application/templates/project.html.cut",
    "test/fixtures/example_application/templates/project/inline.html.cut",
    "test/fixtures/example_application/templates/project/page.html.cut",
    "test/fixtures/example_application/templates/project_image.html.cut",
    "test/fixtures/example_application/templates/projects_page/projects_page.html.cut",
    "test/fixtures/example_application/templates/text.html.cut",
    "test/fixtures/images/rose.jpg",
    "test/fixtures/images/size.gif",
    "test/fixtures/images/size.jpg",
    "test/fixtures/images/size.png24",
    "test/fixtures/images/size.png8",
    "test/fixtures/media/101/003/rose.jpg",
    "test/fixtures/public/templates/site_page/default.html.cut",
    "test/fixtures/public/templates/site_page/default.pdf.cut",
    "test/fixtures/public/templates/site_page/dynamic.html.cut",
    "test/fixtures/templates/aliases/a/a_style.html.cut",
    "test/fixtures/templates/aliases/a/page.html.cut",
    "test/fixtures/templates/aliases/b/page.html.cut",
    "test/fixtures/templates/aliases/b_alias/alternate.html.cut",
    "test/fixtures/templates/aliases/c_alias/page.html.cut",
    "test/fixtures/templates/content/include.html.cut",
    "test/fixtures/templates/content/include_dir.html.cut",
    "test/fixtures/templates/content/included.epub.cut",
    "test/fixtures/templates/content/included.html.cut",
    "test/fixtures/templates/content/partial/included.html.cut",
    "test/fixtures/templates/content/preprocess.html.cut",
    "test/fixtures/templates/content/second.html.cut",
    "test/fixtures/templates/content/template.epub.cut",
    "test/fixtures/templates/content/template.html.cut",
    "test/fixtures/templates/default_style_class.html.cut",
    "test/fixtures/templates/direct.html.cut",
    "test/fixtures/templates/extended/grandparent.html.cut",
    "test/fixtures/templates/extended/main.html.cut",
    "test/fixtures/templates/extended/parent.html.cut",
    "test/fixtures/templates/page_class/inline_style.html.cut",
    "test/fixtures/templates/page_class/page_style.html.cut",
    "test/fixtures/templates/preview_render/entries.html.cut",
    "test/fixtures/templates/preview_render/inline.html.cut",
    "test/fixtures/templates/preview_render/page.html.cut",
    "test/fixtures/templates/preview_render/params.html.cut",
    "test/fixtures/templates/publishing/publishable_page/dynamic.html.cut",
    "test/fixtures/templates/publishing/publishable_page/static.html.cut",
    "test/fixtures/templates/template_class/anonymous_style.html.cut",
    "test/fixtures/templates/template_class/another_template.html.cut",
    "test/fixtures/templates/template_class/complex_template.html.cut",
    "test/fixtures/templates/template_class/complex_template.pdf.cut",
    "test/fixtures/templates/template_class/default_template_style.html.cut",
    "test/fixtures/templates/template_class/images_with_template.html.cut",
    "test/fixtures/templates/template_class/slots_template.html.cut",
    "test/fixtures/templates/template_class/slots_template.pdf.cut",
    "test/fixtures/templates/template_class/this_template.epub.cut",
    "test/fixtures/templates/template_class/this_template.html.cut",
    "test/fixtures/templates/template_class/this_template.pdf.cut",
    "test/fixtures/templates/template_params/page_style.html.cut",
    "test/functional/test_application.rb",
    "test/functional/test_back.rb",
    "test/functional/test_front.rb",
    "test/support/custom_matchers.rb",
    "test/support/timing.rb",
    "test/test_helper.rb",
    "test/test_javascript.rb",
    "test/ui/test_page_editing.rb",
    "test/ui_helper.rb",
    "test/unit/test_alias.rb",
    "test/unit/test_application.rb",
    "test/unit/test_config.rb",
    "test/unit/test_content.rb",
    "test/unit/test_content_inheritance.rb",
    "test/unit/test_extensions.rb",
    "test/unit/test_facet.rb",
    "test/unit/test_fields.rb",
    "test/unit/test_generators.rb",
    "test/unit/test_image_size.rb",
    "test/unit/test_images.rb",
    "test/unit/test_logger.rb",
    "test/unit/test_media.rb",
    "test/unit/test_page.rb",
    "test/unit/test_publishing.rb",
    "test/unit/test_render.rb",
    "test/unit/test_schema.rb",
    "test/unit/test_serialisation.rb",
    "test/unit/test_site.rb",
    "test/unit/test_slots.rb",
    "test/unit/test_styles.rb",
    "test/unit/test_templates.rb",
    "todo.taskpaper"
  ]
  s.homepage = %q{http://spontaneouscms.org}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{TODO: one-line summary of your gem}
  s.test_files = [
    "test/experimental/test_prototypes.rb",
    "test/experimental/test_visibility.rb",
    "test/fixtures/config/config/environment.rb",
    "test/fixtures/config/config/environments/development.rb",
    "test/fixtures/config/config/environments/production.rb",
    "test/fixtures/config/config/environments/staging.rb",
    "test/fixtures/example_application/config/back.rb",
    "test/fixtures/example_application/config/boot.rb",
    "test/fixtures/example_application/config/environment.rb",
    "test/fixtures/example_application/config/environments/development.rb",
    "test/fixtures/example_application/config/environments/production.rb",
    "test/fixtures/example_application/config/environments/staging.rb",
    "test/fixtures/example_application/config/front.rb",
    "test/fixtures/example_application/config/unicorn.rb",
    "test/fixtures/example_application/schema/client_project.rb",
    "test/fixtures/example_application/schema/client_projects.rb",
    "test/fixtures/example_application/schema/home_page.rb",
    "test/fixtures/example_application/schema/info_page.rb",
    "test/fixtures/example_application/schema/inline_image.rb",
    "test/fixtures/example_application/schema/project.rb",
    "test/fixtures/example_application/schema/project_image.rb",
    "test/fixtures/example_application/schema/projects_page.rb",
    "test/fixtures/example_application/schema/text.rb",
    "test/functional/test_application.rb",
    "test/functional/test_back.rb",
    "test/functional/test_front.rb",
    "test/support/custom_matchers.rb",
    "test/support/timing.rb",
    "test/test_helper.rb",
    "test/test_javascript.rb",
    "test/ui/test_page_editing.rb",
    "test/ui_helper.rb",
    "test/unit/test_alias.rb",
    "test/unit/test_application.rb",
    "test/unit/test_config.rb",
    "test/unit/test_content.rb",
    "test/unit/test_content_inheritance.rb",
    "test/unit/test_extensions.rb",
    "test/unit/test_facet.rb",
    "test/unit/test_fields.rb",
    "test/unit/test_generators.rb",
    "test/unit/test_image_size.rb",
    "test/unit/test_images.rb",
    "test/unit/test_logger.rb",
    "test/unit/test_media.rb",
    "test/unit/test_page.rb",
    "test/unit/test_publishing.rb",
    "test/unit/test_render.rb",
    "test/unit/test_schema.rb",
    "test/unit/test_serialisation.rb",
    "test/unit/test_site.rb",
    "test/unit/test_slots.rb",
    "test/unit/test_styles.rb",
    "test/unit/test_templates.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bundler>, ["~> 1.0.9"])
      s.add_runtime_dependency(%q<activesupport>, ["~> 3.0.4"])
      s.add_runtime_dependency(%q<home_run>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<sequel>, ["~> 3.20"])
      s.add_runtime_dependency(%q<yajl-ruby>, ["~> 0.7"])
      s.add_runtime_dependency(%q<erubis>, ["~> 2.6"])
      s.add_runtime_dependency(%q<tenjin>, ["~> 0.6.1"])
      s.add_runtime_dependency(%q<sinatra>, ["~> 1.1.2"])
      s.add_runtime_dependency(%q<rack>, [">= 0"])
      s.add_runtime_dependency(%q<thin>, ["~> 1.2"])
      s.add_runtime_dependency(%q<less>, ["~> 1.2"])
      s.add_runtime_dependency(%q<stringex>, ["~> 1.1"])
      s.add_runtime_dependency(%q<miso>, ["~> 0.3.3"])
      s.add_runtime_dependency(%q<fire_and_forget>, ["~> 0.3.2"])
      s.add_runtime_dependency(%q<thor>, ["~> 0.14.6"])
      s.add_runtime_dependency(%q<rdiscount>, ["~> 1.6.5"])
      s.add_development_dependency(%q<mysql2>, ["~> 0.2"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5"])
      s.add_development_dependency(%q<jnunemaker-matchy>, ["~> 0.4"])
      s.add_development_dependency(%q<shoulda>, ["~> 2.10"])
      s.add_development_dependency(%q<timecop>, ["~> 0.3"])
      s.add_development_dependency(%q<mocha>, ["~> 0.9"])
      s.add_development_dependency(%q<rack-test>, ["~> 0.5"])
      s.add_development_dependency(%q<leftright>, ["~> 0.9"])
      s.add_development_dependency(%q<stackdeck>, ["~> 0.2"])
      s.add_development_dependency(%q<selenium-client>, ["~> 1.2.18"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.0.9"])
      s.add_dependency(%q<activesupport>, ["~> 3.0.4"])
      s.add_dependency(%q<home_run>, ["~> 1.0.0"])
      s.add_dependency(%q<sequel>, ["~> 3.20"])
      s.add_dependency(%q<yajl-ruby>, ["~> 0.7"])
      s.add_dependency(%q<erubis>, ["~> 2.6"])
      s.add_dependency(%q<tenjin>, ["~> 0.6.1"])
      s.add_dependency(%q<sinatra>, ["~> 1.1.2"])
      s.add_dependency(%q<rack>, [">= 0"])
      s.add_dependency(%q<thin>, ["~> 1.2"])
      s.add_dependency(%q<less>, ["~> 1.2"])
      s.add_dependency(%q<stringex>, ["~> 1.1"])
      s.add_dependency(%q<miso>, ["~> 0.3.3"])
      s.add_dependency(%q<fire_and_forget>, ["~> 0.3.2"])
      s.add_dependency(%q<thor>, ["~> 0.14.6"])
      s.add_dependency(%q<rdiscount>, ["~> 1.6.5"])
      s.add_dependency(%q<mysql2>, ["~> 0.2"])
      s.add_dependency(%q<jeweler>, ["~> 1.5"])
      s.add_dependency(%q<jnunemaker-matchy>, ["~> 0.4"])
      s.add_dependency(%q<shoulda>, ["~> 2.10"])
      s.add_dependency(%q<timecop>, ["~> 0.3"])
      s.add_dependency(%q<mocha>, ["~> 0.9"])
      s.add_dependency(%q<rack-test>, ["~> 0.5"])
      s.add_dependency(%q<leftright>, ["~> 0.9"])
      s.add_dependency(%q<stackdeck>, ["~> 0.2"])
      s.add_dependency(%q<selenium-client>, ["~> 1.2.18"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.0.9"])
    s.add_dependency(%q<activesupport>, ["~> 3.0.4"])
    s.add_dependency(%q<home_run>, ["~> 1.0.0"])
    s.add_dependency(%q<sequel>, ["~> 3.20"])
    s.add_dependency(%q<yajl-ruby>, ["~> 0.7"])
    s.add_dependency(%q<erubis>, ["~> 2.6"])
    s.add_dependency(%q<tenjin>, ["~> 0.6.1"])
    s.add_dependency(%q<sinatra>, ["~> 1.1.2"])
    s.add_dependency(%q<rack>, [">= 0"])
    s.add_dependency(%q<thin>, ["~> 1.2"])
    s.add_dependency(%q<less>, ["~> 1.2"])
    s.add_dependency(%q<stringex>, ["~> 1.1"])
    s.add_dependency(%q<miso>, ["~> 0.3.3"])
    s.add_dependency(%q<fire_and_forget>, ["~> 0.3.2"])
    s.add_dependency(%q<thor>, ["~> 0.14.6"])
    s.add_dependency(%q<rdiscount>, ["~> 1.6.5"])
    s.add_dependency(%q<mysql2>, ["~> 0.2"])
    s.add_dependency(%q<jeweler>, ["~> 1.5"])
    s.add_dependency(%q<jnunemaker-matchy>, ["~> 0.4"])
    s.add_dependency(%q<shoulda>, ["~> 2.10"])
    s.add_dependency(%q<timecop>, ["~> 0.3"])
    s.add_dependency(%q<mocha>, ["~> 0.9"])
    s.add_dependency(%q<rack-test>, ["~> 0.5"])
    s.add_dependency(%q<leftright>, ["~> 0.9"])
    s.add_dependency(%q<stackdeck>, ["~> 0.2"])
    s.add_dependency(%q<selenium-client>, ["~> 1.2.18"])
  end
end

