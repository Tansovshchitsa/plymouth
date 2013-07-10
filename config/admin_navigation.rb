# encoding: utf-8

# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Define the primary navigation
  navigation.renderer = SimpleNavigation::Renderer::Bootstrap
  navigation.autogenerate_item_ids = false
  navigation.items do |primary|
    primary.item :dashboard,'首页',"#"
    primary.item :summary,'关于学联' do |archive|
      Type.where(title: "关于学联").first.children.each do |children|
        archive.item :title, children.title, newss_path(:type_id => children.id)
      end if Type.where(title: "关于学联").first
    end
    primary.item :link, "键值对管理", admin_types_path
    primary.item :new,'文章管理',admin_newss_path
    primary.item :announcement, "通知", admin_announcements_path
    primary.item :articles,"基本管理" do |archive|
      archive.item :focus,"焦点图",admin_focuss_path
      archive.item :link, "友情链接", admin_links_path
      archive.item :contact, '联系我们', admin_contacts_path
    end
    primary.item :notice,'会员管理', admin_users_path

    primary.dom_class='nav nav-tabs navigation_font'
  end

end
