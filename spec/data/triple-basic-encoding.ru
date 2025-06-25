DELETE {
  ?s ?rel <<( ?ts ?tp ?to )>> .
}
INSERT {
  ?s ?rel ?t .
  ?t a rdf:TripleForm ;
    rdf:tripleSubject ?ts ; rdf:triplePredicate ?tp ; rdf:tripleObject ?to .
}
WHERE {
  ?s ?rel <<( ?ts ?tp ?to )>> .
  OPTIONAL {
    ?existing_tt a rdf:TripleForm ;
      rdf:tripleSubject ?ts ; rdf:triplePredicate ?tp ; rdf:tripleObject ?to .
  }
  BIND(COALESCE(?existing_tt, BNODE()) as ?t)
}
