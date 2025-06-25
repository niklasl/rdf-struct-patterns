DELETE {
  ?s ?p ?strlangdir .
}
INSERT {
  ?s ?p ?litnode .
  ?litnode a rdf:CompoundLiteral ;
    rdf:value ?lexical ;
    rdf:language ?lang ;
    rdf:direction ?langdir .
}
WHERE {
  ?s ?p ?strlangdir .
  FILTER(hasLANG(?strlangdir) && hasLANGDIR(?strlangdir))
  BIND(STR(?strlangdir) as ?lexical)
  BIND(LANG(?strlangdir) as ?lang)
  BIND(LANGDIR(?strlangdir) as ?langdir)
  OPTIONAL {
    ?existing_litnode a rdf:CompoundLiteral ;
      rdf:value ?lexical ;
      rdf:language ?lang ;
      rdf:direction ?langdir .
  }
  BIND(COALESCE(?existing_litnode, BNODE()) as ?litnode)
}
