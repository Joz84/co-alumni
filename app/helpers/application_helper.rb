module ApplicationHelper
  def inline_svg(filename, options = {})
    asset = "app/assets/images/#{filename}.svg"

    if File.exist?(asset)
      file = File.open(asset, 'r') { |f| f.read }
      doc = Nokogiri::HTML::DocumentFragment.parse(file)
      svg = doc.at_css('svg')

      svg['class'] = options[:class] if options[:class].present?

      doc.to_s.html_safe
    else
      %(
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 30"
          width="400px" height="30px"
        >
          <text font-size="16" x="8" y="20" fill="#cc0000">
            Error: '#{filename}' could not be found.
          </text>
          <rect
            x="1" y="1" width="398" height="28" fill="none"
            stroke-width="1" stroke="#cc0000"
          />
        </svg>
      )
    end
  end

  def user_dashboard(user)
    if user.supervisor?
      supervisor_dashboard_path(user)
    elsif user.coordinator?
      coordinator_dashboard_path(user)
    elsif user.ambassador?
      ambassador_dashboard_path(user)
    end
  end


end
