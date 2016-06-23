class Graph::TwitterLink
  
  include Neo4j::ActiveRel

  from_class :TwitterProfileNode
  to_class :TwitterProfileNode

  type "twitter-link"

end
