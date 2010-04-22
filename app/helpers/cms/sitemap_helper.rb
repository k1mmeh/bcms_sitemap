module Cms::SitemapHelper

  def section_node(section, xml, level = 0)
    section.child_nodes.all(:order => 'node_type ASC, position ASC').each do |node|
      next unless ['Section', 'Page'].include? node.node_type
      
      next unless node.node.public?
      if node.node_type == 'Page'
        page_node(node.node, xml, level)
      else
        section_node(node.node, xml, level + 1)
      end 
    end
  end

  def page_node(page, xml, level)
    xml.url do
      xml.loc [@root_path.sub(/\/$/, ''), page.path.sub(/^\//, '')].join('/')
      xml.changefreq "daily"
      xml.priority 1 * (0.8 ** level)
    end
  end
end
