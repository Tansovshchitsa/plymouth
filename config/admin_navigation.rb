# encoding: utf-8

# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Define the primary navigation
  navigation.renderer = SimpleNavigation::Renderer::Bootstrap
  navigation.autogenerate_item_ids = false
  navigation.items do |primary|
    primary.item :dashboard,'首页',"#"
    primary.item :articles,"师资力量","#"
    primary.item :user,'场馆设施',"#"
    primary.item :new,'新闻管理',admin_newss_path
    primary.item :notice,'党建与学生工作',"#"
    primary.item :articles,"基本管理" do |archive|
      archive.item :announcement, "通知", admin_announcements_path
      archive.item :focus,"焦点图",admin_focuss_path
      archive.item :link, "友情链接", admin_links_path
      archive.item :summary,'学院简介',new_admin_summary_path
      archive.item :contact, '联系我们', admin_contacts_path
    end
    primary.item :notice,'资料下载',"#"

    primary.dom_class='nav nav-tabs navigation_font'
  end

end
