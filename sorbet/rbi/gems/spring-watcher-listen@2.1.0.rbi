# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `spring-watcher-listen` gem.
# Please instead update this file by running `bin/tapioca gem spring-watcher-listen`.

# source://spring-watcher-listen//lib/spring/watcher/listen.rb#19
module Spring
  class << self
    # source://spring/4.1.3/lib/spring/configuration.rb#31
    def after_fork(&block); end

    # source://spring/4.1.3/lib/spring/configuration.rb#27
    def after_fork_callbacks; end

    # source://spring/4.1.3/lib/spring/configuration.rb#5
    def application_root; end

    # source://spring/4.1.3/lib/spring/configuration.rb#5
    def application_root=(_arg0); end

    # source://spring/4.1.3/lib/spring/configuration.rb#39
    def application_root_path; end

    # source://spring/4.1.3/lib/spring/configuration.rb#8
    def gemfile; end

    # source://spring/4.1.3/lib/spring/configuration.rb#18
    def gemfile_lock; end

    # source://spring/4.1.3/lib/spring/configuration.rb#52
    def project_root_path; end

    # source://spring/4.1.3/lib/spring/configuration.rb#56
    def quiet; end

    # source://spring/4.1.3/lib/spring/configuration.rb#6
    def quiet=(_arg0); end

    # source://spring/4.1.3/lib/spring/configuration.rb#35
    def verify_environment; end

    # source://spring/4.1.3/lib/spring/watcher.rb#27
    def watch(*items); end

    # source://spring/4.1.3/lib/spring/watcher.rb#6
    def watch_interval; end

    # source://spring/4.1.3/lib/spring/watcher.rb#6
    def watch_interval=(_arg0); end

    # source://spring/4.1.3/lib/spring/watcher.rb#8
    def watch_method; end

    # source://spring/4.1.3/lib/spring/watcher.rb#11
    def watch_method=(method); end

    # source://spring/4.1.3/lib/spring/watcher.rb#23
    def watcher; end

    # source://spring/4.1.3/lib/spring/watcher.rb#7
    def watcher=(_arg0); end

    private

    # source://spring/4.1.3/lib/spring/configuration.rb#62
    def find_project_root(current_dir); end
  end
end

# source://spring-watcher-listen//lib/spring/watcher/listen.rb#20
module Spring::Watcher; end

# source://spring-watcher-listen//lib/spring/watcher/listen.rb#21
class Spring::Watcher::Listen < ::Spring::Watcher::Abstract
  # @return [Listen] a new instance of Listen
  #
  # source://spring-watcher-listen//lib/spring/watcher/listen.rb#26
  def initialize(*_arg0); end

  # source://spring-watcher-listen//lib/spring/watcher/listen.rb#76
  def base_directories; end

  # source://spring-watcher-listen//lib/spring/watcher/listen.rb#60
  def changed(modified, added, removed); end

  # Returns the value of attribute listener.
  #
  # source://spring-watcher-listen//lib/spring/watcher/listen.rb#24
  def listener; end

  # source://spring-watcher-listen//lib/spring/watcher/listen.rb#68
  def mark_stale; end

  # @return [Boolean]
  #
  # source://spring-watcher-listen//lib/spring/watcher/listen.rb#45
  def running?; end

  # source://spring-watcher-listen//lib/spring/watcher/listen.rb#31
  def start; end

  # source://spring-watcher-listen//lib/spring/watcher/listen.rb#38
  def stop; end

  # source://spring-watcher-listen//lib/spring/watcher/listen.rb#49
  def subjects_changed; end

  # @return [Boolean]
  #
  # source://spring-watcher-listen//lib/spring/watcher/listen.rb#56
  def watching?(file); end
end
