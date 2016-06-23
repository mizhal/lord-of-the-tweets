class Graph::TwitterCluster
  include Neo4j::ActiveNode

  property :slug, type: String
  property :name, type: String

  has_many :in, :members, type: "member-of", model_class: "TwitterProfileNode"
end
