class Menu
  def self.all
    YAML.load(File.open([Rails.root, "config/menu.yaml"].join("/")))
  end
end