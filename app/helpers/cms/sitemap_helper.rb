module Cms::SitemapHelper

  def section_node(section, xml, options = {})
    level = options[:level] || 0
    # don't render sections that are in the :ignore_list option
    return if options[:ignore_list] && options[:ignore_list].include?(section.id)

    section.child_nodes.all(:order => 'node_type ASC, position ASC').each do |c_node|
      next unless ['Section', 'Page'].include? c_node.node_type
      
      next unless c_node.node.public?
      if c_node.node_type == 'Page'
        page_node(c_node.node, xml, :level => level)
      else
        section_node(c_node.node, xml, options.merge(:level => level + 1))
      end 
    end
  end

  def page_node(page, xml, options = {})
    level = options[:level] || 0
    xml.url do
      xml.loc [@root_path.sub(/\/$/, ''), page.path.sub(/^\//, '')].join('/')
      xml.changefreq "daily"
      xml.priority 1 * (0.8 ** level)
    end
  end
end
