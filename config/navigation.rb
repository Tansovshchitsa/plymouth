# encoding: utf-8

# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Define the primary navigation
  navigation.renderer = SimpleNavigation::Renderer::Bootstrap
  navigation.autogenerate_item_ids = false
  navigation.items do |primary|
    primary.item :dashboard,'首页',"#"
    primary.item :archive,'组织机构' do |archive|
      archive.item :project,"专项资金项目申报","#"
      archive.item :todoes,'示范企业功能区申报',"#"
    end
    primary.item :articles,"师资力量","#"
    primary.item :user,'场馆设施',"#"
    primary.item :notice,'体育教学',"#"
    primary.item :notice,'党建与学生工作',"#"
    primary.item :notice,'资料下载',"#"

    primary.dom_class='nav nav-tabs navigation_font'
  end

end
