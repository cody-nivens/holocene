module DownloadHelpers
  TIMEOUT = 1
  PATH    = Rails.root.join("tmp/downloads")

  extend self

  def downloads
    Dir[PATH.join("*")]
  end

  def download
    downloads.first
  end

  def download_content
    wait_for_download
    File.read(download)
  end

  def wait_for_download
    Timeout.timeout(TIMEOUT) do
      sleep 0.1 until downloaded?
    end
  end

  def downloaded?
    !downloading? && downloads.any?
  end

  def downloading?
    downloads.grep(/\.part$/).any?
  end

  def clear_downloads
    FileUtils.rm_f(downloads)
  end

      # assert react_component render
      #
      # assert_react_component("HelloWorld") do |props|
      #   assert_equal "Hello world", props[:message]
      # end
      def assert_react_component(name)
        assert_select "div[data-react-class]" do |dom|
          assert_select "[data-react-class=?]", name

          if block_given?
            props = JSON.parse(dom.attr("data-react-props"))
            props.deep_transform_keys! { |key| key.to_s.underscore }
            props.deep_symbolize_keys!

            yield(props)
          end
        end
      end
  end
