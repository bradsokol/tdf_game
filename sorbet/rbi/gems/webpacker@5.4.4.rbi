# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `webpacker` gem.
# Please instead update this file by running `bin/tapioca gem webpacker`.

# source://webpacker//lib/webpacker.rb#6
module Webpacker
  extend ::Webpacker

  # source://webpacker//lib/webpacker.rb#35
  def bootstrap(*_arg0, **_arg1, &_arg2); end

  # source://webpacker//lib/webpacker.rb#35
  def clean(*_arg0, **_arg1, &_arg2); end

  # source://webpacker//lib/webpacker.rb#35
  def clobber(*_arg0, **_arg1, &_arg2); end

  # source://webpacker//lib/webpacker.rb#34
  def commands(*_arg0, **_arg1, &_arg2); end

  # source://webpacker//lib/webpacker.rb#35
  def compile(*_arg0, **_arg1, &_arg2); end

  # source://webpacker//lib/webpacker.rb#34
  def compiler(*_arg0, **_arg1, &_arg2); end

  # source://webpacker//lib/webpacker.rb#34
  def config(*_arg0, **_arg1, &_arg2); end

  # source://webpacker//lib/webpacker.rb#34
  def dev_server(*_arg0, **_arg1, &_arg2); end

  # source://webpacker//lib/webpacker.rb#25
  def ensure_log_goes_to_stdout; end

  # source://webpacker//lib/webpacker.rb#33
  def env(*_arg0, **_arg1, &_arg2); end

  # source://webpacker//lib/webpacker.rb#13
  def instance; end

  # source://webpacker//lib/webpacker.rb#9
  def instance=(instance); end

  # source://webpacker//lib/webpacker.rb#33
  def logger(*_arg0, **_arg1, &_arg2); end

  # source://webpacker//lib/webpacker.rb#33
  def logger=(arg); end

  # source://webpacker//lib/webpacker.rb#34
  def manifest(*_arg0, **_arg1, &_arg2); end

  # source://webpacker//lib/webpacker.rb#17
  def with_node_env(env); end
end

# source://webpacker//lib/webpacker/commands.rb#1
class Webpacker::Commands
  # @return [Commands] a new instance of Commands
  #
  # source://webpacker//lib/webpacker/commands.rb#4
  def initialize(webpacker); end

  # source://webpacker//lib/webpacker/commands.rb#46
  def bootstrap; end

  # Cleanup old assets in the compile directory. By default it will
  # keep the latest version, 2 backups created within the past hour.
  #
  # Examples
  #
  #   To force only 1 backup to be kept, set count=1 and age=0.
  #
  #   To only keep files created within the last 10 minutes, set count=0 and
  #   age=600.
  #
  # source://webpacker//lib/webpacker/commands.rb#18
  def clean(count = T.unsafe(nil), age = T.unsafe(nil)); end

  # source://webpacker//lib/webpacker/commands.rb#41
  def clobber; end

  # source://webpacker//lib/webpacker/commands.rb#50
  def compile; end

  # source://webpacker//lib/webpacker/commands.rb#2
  def compiler(*_arg0, **_arg1, &_arg2); end

  # source://webpacker//lib/webpacker/commands.rb#2
  def config(*_arg0, **_arg1, &_arg2); end

  # source://webpacker//lib/webpacker/commands.rb#2
  def logger(*_arg0, **_arg1, &_arg2); end

  # source://webpacker//lib/webpacker/commands.rb#2
  def manifest(*_arg0, **_arg1, &_arg2); end

  private

  # source://webpacker//lib/webpacker/commands.rb#65
  def current_version; end

  # source://webpacker//lib/webpacker/commands.rb#57
  def versions; end
end

# source://webpacker//lib/webpacker/compiler.rb#4
class Webpacker::Compiler
  # @return [Compiler] a new instance of Compiler
  #
  # source://webpacker//lib/webpacker/compiler.rb#17
  def initialize(webpacker); end

  # source://webpacker//lib/webpacker/compiler.rb#21
  def compile; end

  # source://webpacker//lib/webpacker/compiler.rb#15
  def config(*_arg0, **_arg1, &_arg2); end

  # source://webpacker//lib/webpacker/compiler.rb#13
  def env; end

  # source://webpacker//lib/webpacker/compiler.rb#13
  def env=(val); end

  # Returns true if all the compiled packs are up to date with the underlying asset files.
  #
  # @return [Boolean]
  #
  # source://webpacker//lib/webpacker/compiler.rb#37
  def fresh?; end

  # source://webpacker//lib/webpacker/compiler.rb#15
  def logger(*_arg0, **_arg1, &_arg2); end

  # Returns true if the compiled packs are out of date with the underlying asset files.
  #
  # @return [Boolean]
  #
  # source://webpacker//lib/webpacker/compiler.rb#42
  def stale?; end

  # source://webpacker//lib/webpacker/compiler.rb#9
  def watched_paths; end

  # source://webpacker//lib/webpacker/compiler.rb#9
  def watched_paths=(val); end

  private

  # source://webpacker//lib/webpacker/compiler.rb#100
  def compilation_digest_path; end

  # source://webpacker//lib/webpacker/compiler.rb#91
  def default_watched_paths; end

  # source://webpacker//lib/webpacker/compiler.rb#49
  def last_compilation_digest; end

  # source://webpacker//lib/webpacker/compiler.rb#62
  def record_compilation_digest; end

  # source://webpacker//lib/webpacker/compiler.rb#67
  def run_webpack; end

  # source://webpacker//lib/webpacker/compiler.rb#54
  def watched_files_digest; end

  # source://webpacker//lib/webpacker/compiler.rb#104
  def webpack_env; end

  # Returns the value of attribute webpacker.
  #
  # source://webpacker//lib/webpacker/compiler.rb#47
  def webpacker; end

  class << self
    # source://webpacker//lib/webpacker/compiler.rb#13
    def env; end

    # source://webpacker//lib/webpacker/compiler.rb#13
    def env=(val); end

    # source://webpacker//lib/webpacker/compiler.rb#9
    def watched_paths; end

    # source://webpacker//lib/webpacker/compiler.rb#9
    def watched_paths=(val); end
  end
end

# source://webpacker//lib/webpacker/configuration.rb#5
class Webpacker::Configuration
  # @return [Configuration] a new instance of Configuration
  #
  # source://webpacker//lib/webpacker/configuration.rb#8
  def initialize(root_path:, config_path:, env:); end

  # source://webpacker//lib/webpacker/configuration.rb#30
  def additional_paths; end

  # source://webpacker//lib/webpacker/configuration.rb#34
  def additional_paths_globbed; end

  # @return [Boolean]
  #
  # source://webpacker//lib/webpacker/configuration.rb#54
  def cache_manifest?; end

  # source://webpacker//lib/webpacker/configuration.rb#58
  def cache_path; end

  # source://webpacker//lib/webpacker/configuration.rb#66
  def check_yarn_integrity=(value); end

  # @return [Boolean]
  #
  # source://webpacker//lib/webpacker/configuration.rb#18
  def compile?; end

  # Returns the value of attribute config_path.
  #
  # source://webpacker//lib/webpacker/configuration.rb#6
  def config_path; end

  # source://webpacker//lib/webpacker/configuration.rb#14
  def dev_server; end

  # Returns the value of attribute env.
  #
  # source://webpacker//lib/webpacker/configuration.rb#6
  def env; end

  # source://webpacker//lib/webpacker/configuration.rb#62
  def extensions; end

  # @return [Boolean]
  #
  # source://webpacker//lib/webpacker/configuration.rb#74
  def extract_css?; end

  # source://webpacker//lib/webpacker/configuration.rb#50
  def public_manifest_path; end

  # source://webpacker//lib/webpacker/configuration.rb#46
  def public_output_path; end

  # source://webpacker//lib/webpacker/configuration.rb#42
  def public_path; end

  # Returns the value of attribute root_path.
  #
  # source://webpacker//lib/webpacker/configuration.rb#6
  def root_path; end

  # source://webpacker//lib/webpacker/configuration.rb#38
  def source_entry_path; end

  # source://webpacker//lib/webpacker/configuration.rb#22
  def source_path; end

  # source://webpacker//lib/webpacker/configuration.rb#26
  def source_path_globbed; end

  # @return [Boolean]
  #
  # source://webpacker//lib/webpacker/configuration.rb#70
  def webpack_compile_output?; end

  private

  # source://webpacker//lib/webpacker/configuration.rb#91
  def data; end

  # source://webpacker//lib/webpacker/configuration.rb#113
  def defaults; end

  # source://webpacker//lib/webpacker/configuration.rb#87
  def fetch(key); end

  # source://webpacker//lib/webpacker/configuration.rb#125
  def globbed_path_with_extensions(path); end

  # source://webpacker//lib/webpacker/configuration.rb#95
  def load; end

  # source://webpacker//lib/webpacker/configuration.rb#79
  def resolved_paths; end
end

# source://webpacker//lib/webpacker/dev_server.rb#1
class Webpacker::DevServer
  # @return [DevServer] a new instance of DevServer
  #
  # source://webpacker//lib/webpacker/dev_server.rb#10
  def initialize(config); end

  # Returns the value of attribute config.
  #
  # source://webpacker//lib/webpacker/dev_server.rb#8
  def config; end

  # source://webpacker//lib/webpacker/dev_server.rb#6
  def connect_timeout; end

  # source://webpacker//lib/webpacker/dev_server.rb#6
  def connect_timeout=(val); end

  # source://webpacker//lib/webpacker/dev_server.rb#54
  def env_prefix; end

  # source://webpacker//lib/webpacker/dev_server.rb#25
  def host; end

  # source://webpacker//lib/webpacker/dev_server.rb#46
  def host_with_port; end

  # @return [Boolean]
  #
  # source://webpacker//lib/webpacker/dev_server.rb#33
  def https?; end

  # source://webpacker//lib/webpacker/dev_server.rb#29
  def port; end

  # @return [Boolean]
  #
  # source://webpacker//lib/webpacker/dev_server.rb#50
  def pretty?; end

  # source://webpacker//lib/webpacker/dev_server.rb#42
  def protocol; end

  # @return [Boolean]
  #
  # source://webpacker//lib/webpacker/dev_server.rb#14
  def running?; end

  private

  # source://webpacker//lib/webpacker/dev_server.rb#63
  def defaults; end

  # source://webpacker//lib/webpacker/dev_server.rb#59
  def fetch(key); end

  class << self
    # source://webpacker//lib/webpacker/dev_server.rb#6
    def connect_timeout; end

    # source://webpacker//lib/webpacker/dev_server.rb#6
    def connect_timeout=(val); end
  end
end

# source://webpacker//lib/webpacker/dev_server.rb#2
Webpacker::DevServer::DEFAULT_ENV_PREFIX = T.let(T.unsafe(nil), String)

# source://webpacker//lib/webpacker/dev_server_proxy.rb#3
class Webpacker::DevServerProxy < ::Rack::Proxy
  # @return [DevServerProxy] a new instance of DevServerProxy
  #
  # source://webpacker//lib/webpacker/dev_server_proxy.rb#6
  def initialize(app = T.unsafe(nil), opts = T.unsafe(nil)); end

  # source://webpacker//lib/webpacker/dev_server_proxy.rb#4
  def config(*_arg0, **_arg1, &_arg2); end

  # source://webpacker//lib/webpacker/dev_server_proxy.rb#4
  def dev_server(*_arg0, **_arg1, &_arg2); end

  # source://webpacker//lib/webpacker/dev_server_proxy.rb#12
  def perform_request(env); end

  private

  # source://webpacker//lib/webpacker/dev_server_proxy.rb#30
  def public_output_uri_path; end
end

# source://webpacker//lib/webpacker/railtie.rb#6
class Webpacker::Engine < ::Rails::Engine
  class << self
    # source://activesupport/7.1.2/lib/active_support/callbacks.rb#70
    def __callbacks; end
  end
end

# source://webpacker//lib/webpacker/env.rb#1
class Webpacker::Env
  # @return [Env] a new instance of Env
  #
  # source://webpacker//lib/webpacker/env.rb#10
  def initialize(webpacker); end

  # source://webpacker//lib/webpacker/env.rb#4
  def config_path(*_arg0, **_arg1, &_arg2); end

  # source://webpacker//lib/webpacker/env.rb#14
  def inquire; end

  # source://webpacker//lib/webpacker/env.rb#4
  def logger(*_arg0, **_arg1, &_arg2); end

  private

  # source://webpacker//lib/webpacker/env.rb#28
  def available_environments; end

  # source://webpacker//lib/webpacker/env.rb#20
  def current; end

  # source://webpacker//lib/webpacker/env.rb#24
  def fallback_env_warning; end

  class << self
    # source://webpacker//lib/webpacker/env.rb#6
    def inquire(webpacker); end
  end
end

# source://webpacker//lib/webpacker/env.rb#2
Webpacker::Env::DEFAULT = T.let(T.unsafe(nil), String)

# source://webpacker//lib/webpacker/helper.rb#1
module Webpacker::Helper
  # Computes the relative path for a given Webpacker asset.
  # Returns the relative path using manifest.json and passes it to path_to_asset helper.
  # This will use path_to_asset internally, so most of their behaviors will be the same.
  #
  # Example:
  #
  #   # When extract_css is false in webpacker.yml and the file is a css:
  #   <%= asset_pack_path 'calendar.css' %>  # => nil
  #
  #   # When extract_css is true in webpacker.yml or the file is not a css:
  #   <%= asset_pack_path 'calendar.css' %> # => "/packs/calendar-1016838bab065ae1e122.css"
  #
  # source://webpacker//lib/webpacker/helper.rb#20
  def asset_pack_path(name, **options); end

  # Computes the absolute path for a given Webpacker asset.
  # Returns the absolute path using manifest.json and passes it to url_to_asset helper.
  # This will use url_to_asset internally, so most of their behaviors will be the same.
  #
  # Example:
  #
  #   # When extract_css is false in webpacker.yml and the file is a css:
  #   <%= asset_pack_url 'calendar.css' %> # => nil
  #
  #   # When extract_css is true in webpacker.yml or the file is not a css:
  #   <%= asset_pack_url 'calendar.css' %> # => "http://example.com/packs/calendar-1016838bab065ae1e122.css"
  #
  # source://webpacker//lib/webpacker/helper.rb#37
  def asset_pack_url(name, **options); end

  # Returns the current Webpacker instance.
  # Could be overridden to use multiple Webpacker
  # configurations within the same app (e.g. with engines).
  #
  # source://webpacker//lib/webpacker/helper.rb#5
  def current_webpacker_instance; end

  # Creates a link tag for a favicon that references the named pack file.
  #
  # Example:
  #
  #  <%= favicon_pack_tag 'mb-icon.png', rel: 'apple-touch-icon', type: 'image/png' %>
  #  <link href="/packs/mb-icon-k344a6d59eef8632c9d1.png" rel="apple-touch-icon" type="image/png" />
  #
  # source://webpacker//lib/webpacker/helper.rb#68
  def favicon_pack_tag(name, **options); end

  # Creates an image tag that references the named pack file.
  #
  # Example:
  #
  #  <%= image_pack_tag 'application.png', size: '16x10', alt: 'Edit Entry' %>
  #  <img alt='Edit Entry' src='/packs/application-k344a6d59eef8632c9d1.png' width='16' height='10' />
  #
  #  <%= image_pack_tag 'picture.png', srcset: { 'picture-2x.png' => '2x' } %>
  #  <img srcset= "/packs/picture-2x-7cca48e6cae66ec07b8e.png 2x" src="/packs/picture-c38deda30895059837cf.png" >
  #
  # source://webpacker//lib/webpacker/helper.rb#52
  def image_pack_tag(name, **options); end

  # Creates a script tag that references the named pack file, as compiled by webpack per the entries list
  # in package/environments/base.js. By default, this list is auto-generated to match everything in
  # app/javascript/packs/*.js. In production mode, the digested reference is automatically looked up.
  #
  # Example:
  #
  #   <%= javascript_pack_tag 'calendar', 'data-turbolinks-track': 'reload' %> # =>
  #   <script src="/packs/calendar-1016838bab065ae1e314.js" data-turbolinks-track="reload"></script>
  #
  # source://webpacker//lib/webpacker/helper.rb#80
  def javascript_pack_tag(*names, **options); end

  # Creates script tags that reference the js chunks from entrypoints when using split chunks API,
  # as compiled by webpack per the entries list in package/environments/base.js.
  # By default, this list is auto-generated to match everything in
  # app/javascript/packs/*.js and all the dependent chunks. In production mode, the digested reference is automatically looked up.
  # See: https://webpack.js.org/plugins/split-chunks-plugin/
  #
  # Example:
  #
  #   <%= javascript_packs_with_chunks_tag 'calendar', 'map', 'data-turbolinks-track': 'reload' %> # =>
  #   <script src="/packs/vendor-16838bab065ae1e314.chunk.js" data-turbolinks-track="reload"></script>
  #   <script src="/packs/calendar~runtime-16838bab065ae1e314.chunk.js" data-turbolinks-track="reload"></script>
  #   <script src="/packs/calendar-1016838bab065ae1e314.chunk.js" data-turbolinks-track="reload"></script>
  #   <script src="/packs/map~runtime-16838bab065ae1e314.chunk.js" data-turbolinks-track="reload"></script>
  #   <script src="/packs/map-16838bab065ae1e314.chunk.js" data-turbolinks-track="reload"></script>
  #
  # DO:
  #
  #   <%= javascript_packs_with_chunks_tag 'calendar', 'map' %>
  #
  # DON'T:
  #
  #   <%= javascript_packs_with_chunks_tag 'calendar' %>
  #   <%= javascript_packs_with_chunks_tag 'map' %>
  #
  # source://webpacker//lib/webpacker/helper.rb#107
  def javascript_packs_with_chunks_tag(*names, **options); end

  # Creates a link tag, for preloading, that references a given Webpacker asset.
  # In production mode, the digested reference is automatically looked up.
  # See: https://developer.mozilla.org/en-US/docs/Web/HTML/Preloading_content
  #
  # Example:
  #
  #   <%= preload_pack_asset 'fonts/fa-regular-400.woff2' %> # =>
  #   <link rel="preload" href="/packs/fonts/fa-regular-400-944fb546bd7018b07190a32244f67dc9.woff2" as="font" type="font/woff2" crossorigin="anonymous">
  #
  # source://webpacker//lib/webpacker/helper.rb#119
  def preload_pack_asset(name, **options); end

  # Creates a link tag that references the named pack file, as compiled by webpack per the entries list
  # in package/environments/base.js. By default, this list is auto-generated to match everything in
  # app/javascript/packs/*.js. In production mode, the digested reference is automatically looked up.
  #
  # Note: If the development server is running and hot module replacement is active, this will return nothing.
  # In that setup you need to configure your styles to be inlined in your JavaScript for hot reloading.
  #
  # Examples:
  #
  #   # When extract_css is false in webpacker.yml:
  #   <%= stylesheet_pack_tag 'calendar', 'data-turbolinks-track': 'reload' %> # =>
  #   nil
  #
  #   # When extract_css is true in webpacker.yml:
  #   <%= stylesheet_pack_tag 'calendar', 'data-turbolinks-track': 'reload' %> # =>
  #   <link rel="stylesheet" media="screen" href="/packs/calendar-1016838bab065ae1e122.css" data-turbolinks-track="reload" />
  #
  # source://webpacker//lib/webpacker/helper.rb#143
  def stylesheet_pack_tag(*names, **options); end

  # Creates link tags that reference the css chunks from entrypoints when using split chunks API,
  # as compiled by webpack per the entries list in package/environments/base.js.
  # By default, this list is auto-generated to match everything in
  # app/javascript/packs/*.js and all the dependent chunks. In production mode, the digested reference is automatically looked up.
  # See: https://webpack.js.org/plugins/split-chunks-plugin/
  #
  # Examples:
  #
  #   <%= stylesheet_packs_with_chunks_tag 'calendar', 'map' %> # =>
  #   <link rel="stylesheet" media="screen" href="/packs/3-8c7ce31a.chunk.css" />
  #   <link rel="stylesheet" media="screen" href="/packs/calendar-8c7ce31a.chunk.css" />
  #   <link rel="stylesheet" media="screen" href="/packs/map-8c7ce31a.chunk.css" />
  #
  # DO:
  #
  #   <%= stylesheet_packs_with_chunks_tag 'calendar', 'map' %>
  #
  # DON'T:
  #
  #   <%= stylesheet_packs_with_chunks_tag 'calendar' %>
  #   <%= stylesheet_packs_with_chunks_tag 'map' %>
  #
  # source://webpacker//lib/webpacker/helper.rb#170
  def stylesheet_packs_with_chunks_tag(*names, **options); end

  private

  # source://webpacker//lib/webpacker/helper.rb#189
  def resolve_path_to_image(name); end

  # source://webpacker//lib/webpacker/helper.rb#181
  def sources_from_manifest_entries(names, type:); end

  # source://webpacker//lib/webpacker/helper.rb#185
  def sources_from_manifest_entrypoints(names, type:); end

  # @return [Boolean]
  #
  # source://webpacker//lib/webpacker/helper.rb#177
  def stylesheet?(name); end
end

# source://webpacker//lib/webpacker/instance.rb#1
class Webpacker::Instance
  # @return [Instance] a new instance of Instance
  #
  # source://webpacker//lib/webpacker/instance.rb#6
  def initialize(root_path: T.unsafe(nil), config_path: T.unsafe(nil)); end

  # source://webpacker//lib/webpacker/instance.rb#34
  def commands; end

  # source://webpacker//lib/webpacker/instance.rb#22
  def compiler; end

  # source://webpacker//lib/webpacker/instance.rb#14
  def config; end

  # Returns the value of attribute config_path.
  #
  # source://webpacker//lib/webpacker/instance.rb#4
  def config_path; end

  # source://webpacker//lib/webpacker/instance.rb#26
  def dev_server; end

  # source://webpacker//lib/webpacker/instance.rb#10
  def env; end

  # source://webpacker//lib/webpacker/instance.rb#2
  def logger; end

  # source://webpacker//lib/webpacker/instance.rb#2
  def logger=(val); end

  # source://webpacker//lib/webpacker/instance.rb#30
  def manifest; end

  # Returns the value of attribute root_path.
  #
  # source://webpacker//lib/webpacker/instance.rb#4
  def root_path; end

  class << self
    # source://webpacker//lib/webpacker/instance.rb#2
    def logger; end

    # source://webpacker//lib/webpacker/instance.rb#2
    def logger=(val); end
  end
end

# Singleton registry for accessing the packs path using a generated manifest.
# This allows javascript_pack_tag, stylesheet_pack_tag, asset_pack_path to take a reference to,
# say, "calendar.js" or "calendar.css" and turn it into "/packs/calendar-1016838bab065ae1e314.js" or
# "/packs/calendar-1016838bab065ae1e314.css".
#
# When the configuration is set to on-demand compilation, with the `compile: true` option in
# the webpacker.yml file, any lookups will be preceded by a compilation if one is needed.
#
# source://webpacker//lib/webpacker/manifest.rb#8
class Webpacker::Manifest
  # @return [Manifest] a new instance of Manifest
  #
  # source://webpacker//lib/webpacker/manifest.rb#13
  def initialize(webpacker); end

  # source://webpacker//lib/webpacker/manifest.rb#11
  def compiler(*_arg0, **_arg1, &_arg2); end

  # source://webpacker//lib/webpacker/manifest.rb#11
  def config(*_arg0, **_arg1, &_arg2); end

  # source://webpacker//lib/webpacker/manifest.rb#11
  def dev_server(*_arg0, **_arg1, &_arg2); end

  # Computes the relative path for a given Webpacker asset using manifest.json.
  # If no asset is found, returns nil.
  #
  # Example:
  #
  #   Webpacker.manifest.lookup('calendar.js') # => "/packs/calendar-1016838bab065ae1e122.js"
  #
  # source://webpacker//lib/webpacker/manifest.rb#41
  def lookup(name, pack_type = T.unsafe(nil)); end

  # Like lookup, except that if no asset is found, raises a Webpacker::Manifest::MissingEntryError.
  #
  # source://webpacker//lib/webpacker/manifest.rb#48
  def lookup!(name, pack_type = T.unsafe(nil)); end

  # source://webpacker//lib/webpacker/manifest.rb#21
  def lookup_pack_with_chunks(name, pack_type = T.unsafe(nil)); end

  # source://webpacker//lib/webpacker/manifest.rb#31
  def lookup_pack_with_chunks!(name, pack_type = T.unsafe(nil)); end

  # source://webpacker//lib/webpacker/manifest.rb#17
  def refresh; end

  private

  # source://webpacker//lib/webpacker/manifest.rb#57
  def compile; end

  # @return [Boolean]
  #
  # source://webpacker//lib/webpacker/manifest.rb#53
  def compiling?; end

  # source://webpacker//lib/webpacker/manifest.rb#61
  def data; end

  # source://webpacker//lib/webpacker/manifest.rb#69
  def find(name); end

  # source://webpacker//lib/webpacker/manifest.rb#73
  def full_pack_name(name, pack_type); end

  # @raise [Webpacker::Manifest::MissingEntryError]
  #
  # source://webpacker//lib/webpacker/manifest.rb#78
  def handle_missing_entry(name, pack_type); end

  # source://webpacker//lib/webpacker/manifest.rb#82
  def load; end

  # The `manifest_name` method strips of the file extension of the name, because in the
  # manifest hash the entrypoints are defined by their pack name without the extension.
  # When the user provides a name with a file extension, we want to try to strip it off.
  #
  # source://webpacker//lib/webpacker/manifest.rb#93
  def manifest_name(name, pack_type); end

  # source://webpacker//lib/webpacker/manifest.rb#98
  def manifest_type(pack_type); end

  # source://webpacker//lib/webpacker/manifest.rb#106
  def missing_file_from_manifest_error(bundle_name); end
end

# source://webpacker//lib/webpacker/manifest.rb#9
class Webpacker::Manifest::MissingEntryError < ::StandardError; end
