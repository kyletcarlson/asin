require 'hashie'

module ASIN

  # =SimpleNode
  #
  # The +SimpleNode+ class is a wrapper for the Amazon XML-REST-Response.
  #
  # A Hashie::Mash is used for the internal data representation and can be accessed over the +raw+ attribute.
  #
  class SimpleNode

    attr_reader :raw

    def initialize(hash)
      @raw = Hashie::Mash.new(hash)
    end

    def name
      @raw.Name
    end

    def node_id
      @raw.BrowseNodeId
    end

    def top_sellers
      return [] unless @raw.TopSellers
      @raw.TopSellers.TopSeller
    end

    def new_releases
      return [] unless @raw.NewReleases
      @raw.NewReleases.NewRelease
    end

    # def most_gifted
    #   return [] unless @raw.TopSellers
    #   @raw.TopSellers.TopSeller
    # end

    # def most_gifted
    #   return [] unless @raw.TopSellers
    #   @raw.TopSellers.TopSeller
    # end

    def children
      return [] unless @raw.Children
      @raw.Children.BrowseNode.is_a?(Array) ? @raw.Children.BrowseNode : [@raw.Children.BrowseNode]
    end

    def ancestors
      return [] unless @raw.Ancestors
      @raw.Ancestors.BrowseNode.is_a?(Array) ? @raw.Ancestors.BrowseNode : [@raw.Ancestors.BrowseNode]
    end

    def top_item_set
      return [] unless @raw.TopItemSets
      @raw.TopItemSets.TopItem.is_a?(Array) ? @raw.TopItemSets.TopItem : [@raw.TopItemSets.TopItem]
    end
  end
end
