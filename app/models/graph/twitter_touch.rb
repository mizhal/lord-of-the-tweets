class Graph::TwitterTouch

  include Neo4j::ActiveRel

  from_class :TwitterProfileNode
  to_class :TwitterProfileNode

  type "twitter-touch"

  property :kind, type: String
  property :friendliness, type: String
  property :when, type: DateTime

  ## ENUMS
  KIND = ["like", "mention", "retweet"]
  FRIENDLINESS = ["friendly", "aggressive", "neutral"]
  ## FIN: ENUMS

end
