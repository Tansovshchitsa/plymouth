# encoding: utf-8

# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Define the primary navigation
  navigation.renderer = SimpleNavigation::Renderer::Bootstrap
  navigation.autogenerate_item_ids = false
  navigation.items do |primary|
    primary.item :home,'首页',"#"
    primary.item :articles,"学联新闻","#"
    primary.item :user,'学联活动',"#"
    primary.item :notice,'学联服务',"#"
    primary.item :notice,'学联论坛',"http://www.plymouthcssa.org/bbs/forum.php"
    primary.item :notice,'关于学联',"#"
    primary.item :notice,'合作赞助',"#"

    primary.dom_class='nav nav-pills navigation_font'
  end

end
