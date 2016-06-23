class Graph::TwitterProfileNode
  include Neo4j::ActiveNode

  property :slug, index: :exact
end
