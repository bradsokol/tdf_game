# typed: true
# frozen_string_literal: true

extend T::Sig # rubocop:disable Style/MixinUsage

T.bind(self, T.all(Rake::DSL, Object))

URL_BASE = 'http://localhost:3000'
STATIC_DIR = 'docs'

namespace :static do
  desc 'Crawl the site and build a static copy'
  task build: :environment do
    years = (2019..2024).to_a

    stages_fixups = {}
    years.each do |year|
      Spidr.start_at("#{URL_BASE}/overall/#{year}") do |spider|
        spider.every_page do |page|
          next unless page.url.to_s.start_with?(URL_BASE)

          if page.url.to_s.end_with?("stages/#{year}")
            abort "Expected a redirect for #{page.url}" unless page.redirect?
            stages_fixups[page.url.to_s] = page.redirects_to.first
          end

          # Must call #force_encoding because Spidr sets the encoding of the body to ASCII-8BIT
          content = page.body.force_encoding('UTF-8')

          content = adjust_links(html: content) if page.html?
          name = file_name(url: page.url, html: page.html?)
          save(content:, file_name: name)
        end
      end

      stages_fixups.each do |from, to|
        to_file_name = file_name(url: from, html: true)
        from_file_name = file_name(url: to, html: true)
        `cp #{from_file_name} #{to_file_name}`
      end
    end

    from_file_name = file_name(url: "#{URL_BASE}/overall/#{years.last}", html: true)
    to_file_name = file_name(url: "#{URL_BASE}/overall", html: true)
    index_file_name = file_name(url: "#{URL_BASE}/index", html: true)
    `cp #{from_file_name} #{to_file_name}`
    `cp #{from_file_name} #{index_file_name}`

    `find docs -name "*.html" -exec sed -i '' 's@href="[^h]@href="/tdf_game/@' {} \\;`
    `find docs -name "*.html" -exec sed -i '' 's@window\.location = "@window.location = "/tdf_game@' {} \\;`
  end

  sig { params(html: String).returns(String) }
  def adjust_links(html:)
    html
      .gsub(/<a ?.* href="[^"]*/, '\0.html')
      .gsub(/(<option value="[\d]{1,3})"/, '\1.html"')
  end

  sig { params(url: T.any(String, URI::HTTP), html: T::Boolean).returns(String) }
  def file_name(url:, html:)
    Rails.root.join("#{STATIC_DIR}/#{url.to_s.gsub(URL_BASE, '').gsub(%r{^/}, '')}#{html ? '.html' : ''}").to_s
  end

  sig { params(content: String, file_name: String).void }
  def save(content:, file_name:)
    FileUtils.mkdir_p(File.dirname(file_name))

    # puts file_name
    File.write(file_name, content)
  end

  desc 'Remove the static copy'
  task clean: :environment do
    `rm -rf #{Rails.root.join(STATIC_DIR)}`
  end
end
