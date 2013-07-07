# encoding: utf-8

class Type
  include Mongoid::Document
  include Mongoid::Ancestry
  has_ancestry

  field :title
  field :value

  def self.tree
    nodes = node.nil? ? Type.roots : node.children.delete_if { |x| Unirole::Rank.leaf.include?(x.rank.id) }
    under = {}
    if node
      if ["省","市"].include?(node.rank.name)
        under = {"直属"=>node.id.to_s}
      else
        return node.id.to_s if nodes.empty?
      end
    end

    nodes.inject(under) do |result,organ|
      result.merge({organ.name => tree(organ)})
    end
  end
end
