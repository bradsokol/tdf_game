# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `spring` gem.
# Please instead update this file by running `bin/tapioca gem spring`.

# Some parts adapted from
# https://golang.org/src/pkg/json/decode.go and
# https://golang.org/src/pkg/utf8/utf8.go
#
# source://spring//lib/spring/watcher/abstract.rb#5
module Spring
  class << self
    # source://spring//lib/spring/configuration.rb#30
    def after_fork(&block); end

    # source://spring//lib/spring/configuration.rb#26
    def after_fork_callbacks; end

    # Returns the value of attribute application_root.
    #
    # source://spring//lib/spring/configuration.rb#5
    def application_root; end

    # Sets the attribute application_root
    #
    # @param value the value to set the attribute application_root to.
    #
    # source://spring//lib/spring/configuration.rb#5
    def application_root=(_arg0); end

    # source://spring//lib/spring/configuration.rb#38
    def application_root_path; end

    # source://spring//lib/spring/configuration.rb#7
    def gemfile; end

    # source://spring//lib/spring/configuration.rb#17
    def gemfile_lock; end

    # source://spring//lib/spring/configuration.rb#51
    def project_root_path; end

    # Returns the value of attribute quiet.
    #
    # source://spring//lib/spring/configuration.rb#5
    def quiet; end

    # Sets the attribute quiet
    #
    # @param value the value to set the attribute quiet to.
    #
    # source://spring//lib/spring/configuration.rb#5
    def quiet=(_arg0); end

    # source://spring//lib/spring/configuration.rb#34
    def verify_environment; end

    # source://spring//lib/spring/watcher.rb#27
    def watch(*items); end

    # Returns the value of attribute watch_interval.
    #
    # source://spring//lib/spring/watcher.rb#6
    def watch_interval; end

    # Sets the attribute watch_interval
    #
    # @param value the value to set the attribute watch_interval to.
    #
    # source://spring//lib/spring/watcher.rb#6
    def watch_interval=(_arg0); end

    # Returns the value of attribute watch_method.
    #
    # source://spring//lib/spring/watcher.rb#8
    def watch_method; end

    # source://spring//lib/spring/watcher.rb#11
    def watch_method=(method); end

    # source://spring//lib/spring/watcher.rb#23
    def watcher; end

    # Sets the attribute watcher
    #
    # @param value the value to set the attribute watcher to.
    #
    # source://spring//lib/spring/watcher.rb#7
    def watcher=(_arg0); end

    private

    # source://spring//lib/spring/configuration.rb#57
    def find_project_root(current_dir); end
  end
end

# source://spring//lib/spring/errors.rb#2
class Spring::ClientError < ::StandardError; end

# source://spring//lib/spring/errors.rb#34
class Spring::CommandNotFound < ::Spring::ClientError; end

# source://spring//lib/spring/errors.rb#18
class Spring::MissingApplication < ::Spring::ClientError
  # @return [MissingApplication] a new instance of MissingApplication
  #
  # source://spring//lib/spring/errors.rb#21
  def initialize(project_root); end

  # source://spring//lib/spring/errors.rb#25
  def message; end

  # Returns the value of attribute project_root.
  #
  # source://spring//lib/spring/errors.rb#19
  def project_root; end
end

# source://spring//lib/spring/errors.rb#4
class Spring::UnknownProject < ::StandardError
  # @return [UnknownProject] a new instance of UnknownProject
  #
  # source://spring//lib/spring/errors.rb#7
  def initialize(current_dir); end

  # Returns the value of attribute current_dir.
  #
  # source://spring//lib/spring/errors.rb#5
  def current_dir; end

  # source://spring//lib/spring/errors.rb#11
  def message; end
end

# source://spring//lib/spring/watcher/abstract.rb#6
module Spring::Watcher; end

# A user of a watcher can use IO.select to wait for changes:
#
#   watcher = MyWatcher.new(root, latency)
#   IO.select([watcher]) # watcher is running in background
#   watcher.stale? # => true
#
# source://spring//lib/spring/watcher/abstract.rb#12
class Spring::Watcher::Abstract
  include ::Mutex_m

  # @return [Abstract] a new instance of Abstract
  #
  # source://spring//lib/spring/watcher/abstract.rb#17
  def initialize(root, latency); end

  # source://spring//lib/spring/watcher/abstract.rb#38
  def add(*items); end

  # source://spring//lib/spring/watcher/abstract.rb#34
  def debug; end

  # Returns the value of attribute directories.
  #
  # source://spring//lib/spring/watcher/abstract.rb#15
  def directories; end

  # Returns the value of attribute files.
  #
  # source://spring//lib/spring/watcher/abstract.rb#15
  def files; end

  # Returns the value of attribute latency.
  #
  # source://spring//lib/spring/watcher/abstract.rb#15
  def latency; end

  # source://mutex_m/0.1.2/mutex_m.rb#93
  def lock; end

  # source://mutex_m/0.1.2/mutex_m.rb#83
  def locked?; end

  # source://spring//lib/spring/watcher/abstract.rb#91
  def mark_stale; end

  # source://spring//lib/spring/watcher/abstract.rb#30
  def on_debug(&block); end

  # source://spring//lib/spring/watcher/abstract.rb#86
  def on_stale(&block); end

  # source://spring//lib/spring/watcher/abstract.rb#98
  def restart; end

  # Returns the value of attribute root.
  #
  # source://spring//lib/spring/watcher/abstract.rb#15
  def root; end

  # @return [Boolean]
  #
  # source://spring//lib/spring/watcher/abstract.rb#82
  def stale?; end

  # @raise [NotImplementedError]
  #
  # source://spring//lib/spring/watcher/abstract.rb#104
  def start; end

  # @raise [NotImplementedError]
  #
  # source://spring//lib/spring/watcher/abstract.rb#108
  def stop; end

  # @raise [NotImplementedError]
  #
  # source://spring//lib/spring/watcher/abstract.rb#112
  def subjects_changed; end

  # source://mutex_m/0.1.2/mutex_m.rb#78
  def synchronize(&block); end

  # source://mutex_m/0.1.2/mutex_m.rb#88
  def try_lock; end

  # source://mutex_m/0.1.2/mutex_m.rb#98
  def unlock; end
end

# source://spring//lib/spring/watcher/polling.rb#5
class Spring::Watcher::Polling < ::Spring::Watcher::Abstract
  # @return [Polling] a new instance of Polling
  #
  # source://spring//lib/spring/watcher/polling.rb#8
  def initialize(root, latency); end

  # source://spring//lib/spring/watcher/polling.rb#24
  def add(*_arg0); end

  # source://spring//lib/spring/watcher/polling.rb#14
  def check_stale; end

  # Returns the value of attribute mtime.
  #
  # source://spring//lib/spring/watcher/polling.rb#6
  def mtime; end

  # @return [Boolean]
  #
  # source://spring//lib/spring/watcher/polling.rb#60
  def running?; end

  # source://spring//lib/spring/watcher/polling.rb#29
  def start; end

  # source://spring//lib/spring/watcher/polling.rb#52
  def stop; end

  # source://spring//lib/spring/watcher/polling.rb#64
  def subjects_changed; end

  private

  # source://spring//lib/spring/watcher/polling.rb#72
  def compute_mtime; end

  # source://spring//lib/spring/watcher/polling.rb#93
  def expanded_files; end
end
