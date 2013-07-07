# encoding: utf-8

# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Define the primary navigation
  navigation.renderer = SimpleNavigation::Renderer::Bootstrap
  navigation.autogenerate_item_ids = false
  navigation.items do |primary|
    primary.item :home,'首页',root_path
    primary.item :news,"学联新闻" do |news|
      Type.where(title: "学联新闻").first.children.each do |children|
        news.item :title, children.title, newss_path(:type_id => children.id)
      end if Type.where(title: "学联新闻").first
    end
    primary.item :user,'学联活动' do |news|
      Type.where(title: "学联活动").first.children.each do |children|
        news.item :title, children.title, newss_path(:type_id => children.id)
      end if Type.where(title: "学联活动").first
    end
    primary.item :notice,'学联服务'do |news|
      Type.where(title: "学联服务").first.children.each do |children|
        news.item :title, children.title, newss_path(:type_id => children.id)
      end if Type.where(title: "学联服务").first
    end
    primary.item :notice,'学联论坛',"http://www.plymouthcssa.org/bbs/forum.php"
    primary.item :notice,'关于学联' do |archive|
      Type.where(title: "关于学联").first.children.each do |children|
        archive.item :title, children.title, summarys_path(:type_id => children.id)
      end if Type.where(title: "关于学联").first
    end
    primary.item :notice,'合作赞助',"#"

    primary.dom_class='nav nav-pills navigation_font'
  end

end
